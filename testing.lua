local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local LeafHere = require(game.ReplicatedStorage:WaitForChild("LeafHere"))
local Rayfield = require(game.ReplicatedStorage:WaitForChild("Rayfield")) -- Adjust path as needed

-- Create Rayfield Window
local Window = Rayfield:CreateWindow({
    Name = "Auto Walk",
    LoadingTitle = "Loading Auto Walk",
    LoadingSubtitle = "by ChatGPT",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "AutoWalkConfig"
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- Variables
local isWalking = false
local pathPoints = {}

-- Function to walk path
local function walkPath(points)
    if #points == 0 then return end
    isWalking = true
    local currentIndex = 1

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

-- UI Elements

local startPosInput
local endPosInput

-- Start Walk button
Window:CreateInput({
    Name = "Start Position (x,y,z)",
    PlaceholderText = "e.g. 0,5,0",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        startPosInput = value
    end
})

Window:CreateInput({
    Name = "End Position (x,y,z)",
    PlaceholderText = "e.g. 10,5,10",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        endPosInput = value
    end
})

Window:CreateButton({
    Name = "Start Walk",
    Callback = function()
        if isWalking then return end

        local function parseVec3(input)
            local x, y, z = input:match("([^,]+),([^,]+),([^,]+)")
            if x and y and z then
                return Vector3.new(tonumber(x), tonumber(y), tonumber(z))
            end
            return nil
        end

        local startPos = parseVec3(startPosInput or "")
        local endPos = parseVec3(endPosInput or "")

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
    end
})

Window:CreateButton({
    Name = "Stop Walk",
    Callback = function()
        isWalking = false
        humanoid:MoveTo(rootPart.Position)
    end
})
