print("Running: AntiAFK")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local keys = {"W", "A", "S", "D"}
local moveDistance = 1  -- studs
local interval = 60  -- seconds between AFK moves

local function pressKey(key)
    VirtualInputManager:SendKeyEvent(true, key, false, game)
    task.wait(0.2)
    VirtualInputManager:SendKeyEvent(false, key, false, game)
end

local function movePlayerAwayAndBack()
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

    pressKey(randomKey)
    humanoidRootPart.CFrame = originalCFrame + direction
    task.wait(1)
    humanoidRootPart.CFrame = originalCFrame
    pressKey("R")
end

while true do
    task.wait(interval)
    pcall(movePlayerAwayAndBack)
end
