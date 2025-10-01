local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Require LeafHere module from ReplicatedStorage
local LeafHere = require(game.ReplicatedStorage:WaitForChild("LeafHere"))

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoWalkGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 160)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = frame

-- Title label
local title = Instance.new("TextLabel")
title.Text = "Auto Walk"
title.Size = UDim2.new(1, 0, 0, 36)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.Parent = frame

-- Start Position Input
local startPosBox = Instance.new("TextBox")
startPosBox.PlaceholderText = "Start Position (x,y,z)"
startPosBox.Size = UDim2.new(0.9, 0, 0, 30)
startPosBox.Position = UDim2.new(0.05, 0, 0, 45)
startPosBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
startPosBox.TextColor3 = Color3.new(1, 1, 1)
startPosBox.Font = Enum.Font.Gotham
startPosBox.TextSize = 18
startPosBox.ClearTextOnFocus = false
startPosBox.Parent = frame
local startPosCorner = Instance.new("UICorner")
startPosCorner.CornerRadius = UDim.new(0, 8)
startPosCorner.Parent = startPosBox

-- End Position Input
local endPosBox = Instance.new("TextBox")
endPosBox.PlaceholderText = "End Position (x,y,z)"
endPosBox.Size = UDim2.new(0.9, 0, 0, 30)
endPosBox.Position = UDim2.new(0.05, 0, 0, 85)
endPosBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
endPosBox.TextColor3 = Color3.new(1, 1, 1)
endPosBox.Font = Enum.Font.Gotham
endPosBox.TextSize = 18
endPosBox.ClearTextOnFocus = false
endPosBox.Parent = frame
local endPosCorner = Instance.new("UICorner")
endPosCorner.CornerRadius = UDim.new(0, 8)
endPosCorner.Parent = endPosBox

-- Start Walk Button
local startButton = Instance.new("TextButton")
startButton.Text = "Start Walk"
startButton.Size = UDim2.new(0.4, 0, 0, 34)
startButton.Position = UDim2.new(0.05, 0, 0, 125)
startButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
startButton.TextColor3 = Color3.new(1, 1, 1)
startButton.Font = Enum.Font.GothamBold
startButton.TextSize = 20
startButton.AutoButtonColor = true
startButton.Parent = frame
local startUICorner = Instance.new("UICorner")
startUICorner.CornerRadius = UDim.new(0, 10)
startUICorner.Parent = startButton

-- Stop Walk Button
local stopButton = Instance.new("TextButton")
stopButton.Text = "Stop Walk"
stopButton.Size = UDim2.new(0.4, 0, 0, 34)
stopButton.Position = UDim2.new(0.55, 0, 0, 125)
stopButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
stopButton.TextColor3 = Color3.new(1, 1, 1)
stopButton.Font = Enum.Font.GothamBold
stopButton.TextSize = 20
stopButton.AutoButtonColor = true
stopButton.Parent = frame
local stopUICorner = Instance.new("UICorner")
stopUICorner.CornerRadius = UDim.new(0, 10)
stopUICorner.Parent = stopButton

-- Variables
local isWalking = false
local currentIndex = 1
local pathPoints = {}

-- Helper to parse Vector3 from "x,y,z" string
local function parseVector3(input)
    local x, y, z = input:match("([^,]+),([^,]+),([^,]+)")
    if x and y and z then
        return Vector3.new(tonumber(t), tonumber(x), tonumber(y), tonumber(z), tonumber(yaw))
    end
    return nil
end

-- Walking function along points
local function walkPath(points)
    if #points == 0 then return end
    isWalking = true
    currentIndex = 1

    while isWalking and currentIndex <= #points do
        local target = points[currentIndex]
        humanoid:MoveTo(target)

        local reached = false
        local conn
        conn = humanoid.MoveToFinished:Connect(function(success)
            if success then
                reached = true
            end
        end)

        while isWalking and not reached do
            local dist = (rootPart.Position - target).Magnitude
            if dist < 3 then
                reached = true
            end
            wait(0.1)
        end

        conn:Disconnect()

        if not isWalking then break end
        currentIndex = currentIndex + 1
    end

    isWalking = false
end

-- Start Button logic
startButton.MouseButton1Click:Connect(function()
    if isWalking then return end

    local startPos = parseVector3(startPosBox.Text)
    local endPos = parseVector3(endPosBox.Text)

    if not startPos or not endPos then
        warn("Invalid input format! Use x,y,z")
        return
    end

    local success, path = pcall(function()
        return LeafHere.findPath(startPos, endPos)
    end)

    if not success or not path or #path == 0 then
        warn("Failed to find path")
        return
    end

    pathPoints = path
    walkPath(pathPoints)
end)

-- Stop Button logic
stopButton.MouseButton1Click:Connect(function()
    isWalking = false
    humanoid:MoveTo(rootPart.Position) -- Stop movement immediately
end)
