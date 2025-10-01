-- LocalScript (e.g., StarterPlayerScripts)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Require LeafHere module
local LeafHere = require(game.ReplicatedStorage:WaitForChild("LeafHere"))

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoWalkGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.AnchorPoint = Vector2.new(0, 0)
frame.BackgroundTransparency = 0.1
frame.ClipsDescendants = true

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame

local title = Instance.new("TextLabel")
title.Text = "Auto Walk"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = frame

-- Start Button
local startButton = Instance.new("TextButton")
startButton.Text = "Start Walk"
startButton.Size = UDim2.new(0.8, 0, 0, 40)
startButton.Position = UDim2.new(0.1, 0, 0, 40)
startButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
startButton.TextColor3 = Color3.new(1, 1, 1)
startButton.Font = Enum.Font.GothamBold
startButton.TextSize = 20
startButton.AutoButtonColor = true
startButton.Parent = frame
local startUICorner = Instance.new("UICorner")
startUICorner.CornerRadius = UDim.new(0, 8)
startUICorner.Parent = startButton

-- Stop Button
local stopButton = Instance.new("TextButton")
stopButton.Text = "Stop Walk"
stopButton.Size = UDim2.new(0.8, 0, 0, 40)
stopButton.Position = UDim2.new(0.1, 0, 0, 90)
stopButton.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
stopButton.TextColor3 = Color3.new(1, 1, 1)
stopButton.Font = Enum.Font.GothamBold
stopButton.TextSize = 20
stopButton.AutoButtonColor = true
stopButton.Parent = frame
local stopUICorner = Instance.new("UICorner")
stopUICorner.CornerRadius = UDim.new(0, 8)
stopUICorner.Parent = stopButton

-- Variables for walking
local isWalking = false
local pathPoints = {}
local currentIndex = 1
local walkSpeed = 16 -- default walk speed

-- Function to parse path with LeafHere and get waypoints
-- Here you need to customize input for LeafHere usage based on actual API of the module.
local function getPathPoints()
    -- Example: LeafHere.parsePath returns array of Vector3 points
    -- Replace this with actual usage according to LeafHere module
    local path = LeafHere.parsePath()  -- You must implement or adapt this function with the actual module usage
    return path or {}
end

-- Function to move character along path points smoothly
local function walkAlongPath(points)
    if #points == 0 then return end
    currentIndex = 1
    isWalking = true

    while isWalking and currentIndex <= #points do
        local targetPos = points[currentIndex]
        -- Move humanoid to target position using MoveTo
        humanoid:MoveTo(targetPos)

        -- Wait until reached close to target or stopped
        local reached = false
        local connection
        connection = humanoid.MoveToFinished:Connect(function(reachedSuccess)
            if reachedSuccess then
                reached = true
            end
        end)

        -- Wait loop with small delay to check reach or stop
        while isWalking and not reached do
            local dist = (rootPart.Position - targetPos).Magnitude
            if dist < 3 then
                reached = true
            end
            wait(0.1)
        end

        connection:Disconnect()

        if not isWalking then
            break
        end

        currentIndex = currentIndex + 1
    end

    isWalking = false
end

-- Start button click
startButton.MouseButton1Click:Connect(function()
    if isWalking then return end
    pathPoints = getPathPoints()
    if #pathPoints == 0 then
        warn("No path points found")
        return
    end
    walkAlongPath(pathPoints)
end)

-- Stop button click
stopButton.MouseButton1Click:Connect(function()
    isWalking = false
    humanoid:MoveTo(rootPart.Position) -- Stop movement immediately
end)
