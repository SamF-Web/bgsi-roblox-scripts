print("Running: AntiAFK")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local keys = {"W", "A", "S", "D"}
local moveDistance = 1 
local interval = 60 
local keyName = (getgenv().Config and getgenv().Config.AntiAFKBind) or "R"
local toggleKey = Enum.KeyCode[keyName] or Enum.KeyCode.R
local enabled = true

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "🛡️ " .. title,
            Text = text,
            Duration = 4
        })
    end)
end

local function movePlayerAwayAndBack()
    if not enabled then return end
    local originalCFrame = humanoidRootPart.CFrame
    local direction = Vector3.new(0, 0, 0)
    local randomKey = keys[math.random(1, #keys)]
    if randomKey == "W" then
        direction = character.HumanoidRootPart.CFrame.LookVector * moveDistance
    elseif randomKey == "S" then
        direction = -character.HumanoidRootPart.CFrame.LookVector * moveDistance
    elseif randomKey == "A" then
        direction = -character.HumanoidRootPart.CFrame.RightVector * moveDistance
    elseif randomKey == "D" then
        direction = character.HumanoidRootPart.CFrame.RightVector * moveDistance
    end
    humanoidRootPart.CFrame = originalCFrame + direction
    task.wait(1)
    humanoidRootPart.CFrame = originalCFrame
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == toggleKey then
        enabled = not enabled
        local state = enabled and "✅ Enabled" or "❌ Disabled"
        notify("AntiAFK", state .. " (Press [" .. keyName .. "] to toggle)")
    end
end)

while true do
    task.wait(interval)
    pcall(movePlayerAwayAndBack)
end
