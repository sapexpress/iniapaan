-- Load the UI library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local humanoid, rootPart

local function setupCharacter(char)
   humanoid = char:WaitForChild("Humanoid")
   rootPart = char:WaitForChild("HumanoidRootPart")
end
   
if LocalPlayer.Character then
   setupCharacter(LocalPlayer.Character)
end
LocalPlayer.CharacterAdded:Connect(setupCharacter)


local Window = Rayfield:CreateWindow({
   Name = "SAP Express Hub Mountain Helper",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Mountain Helper",
   LoadingSubtitle = "by SAP Express",
   ShowText = "Express", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


-- Create tabs with icons replace ur own icon id
local user = Window:CreateTab("Auto Walk", "star")
local MainSection = walkTab:CreateSection("Main")
local Toggle = userTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(v) if v then UserInputService.JumpRequest:Connect(function() if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end) end end})
local Slider = userTab:CreateSlider({Name = "WalkSpeed", Range = {0, 100}, Increment = 1, Suffix = "Speed", CurrentValue = 16, Flag = "sliderjp", Callback = function(val) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (val) end, })
local Slider = userTab:CreateSlider({Name = "JumpPower", Range = {0, 300}, Increment = 1, Suffix = "Speed", CurrentValue = 50, Flag = "sliderjp", Callback = function(val) game.Players.LocalPlayer.Character.Humanoid.JumpPower = (val) end, })
local Input = userTab:CreateInput({Name = " WalkSpeed", Range = {0-100}, PlaceholderText = "0-100", RemoveTextAfterFocusLost = false, Callback = function(Text) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text) end, })
local Input = userTab:CreateInput({Name = " JumpPower", Range = {0-300}, PlaceholderText = "0-300", RemoveTextAfterFocusLost = false, Callback = function(Text) game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Text) end, })
--local MainTab = Window:CreateTab("Player". "user")
--local VisualTab = Window:CreateTab("Visual", "sun")
--local ProteksiTab = Window:CreateTab("Protection", "shield")
--local MiscTab = Window:CreateTab("Misc","settings" )
--local SocialTab = Window:CreateTab("Social", "link")

-- Main Tab Elements
Rayfield:LoadConfiguration()
