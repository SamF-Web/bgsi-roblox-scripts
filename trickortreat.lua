print("[OK] Running TrickOrTreat Farm Script")

if not getgenv().Config or not getgenv().Config.TrickOrTreat then
    warn("[Alert] You currently have TrickOrTreat Farm disabled.")
    return
end

local selectedZone = getgenv().Config.EventZone or "First"

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.Shared.Framework.Network.Remote.RemoteEvent

local zonePositions = {
    ["First"] = {
        Vector3.new(-5035.52, 25.16, -547.86),
        Vector3.new(-5059.96, 25.16, -556.41),
        Vector3.new(-5051.66, 22.37, -595.76),
    },
    ["Second"] = {
        Vector3.new(-5080.74, 22.31, -688.19),
        Vector3.new(-5057.93, 22.31, -695.73),
        Vector3.new(-5033.55, 22.37, -620.40),
    },
    ["Third"] = {
        Vector3.new(-4961.24, 16.33, -692.04),
        Vector3.new(-4988.21, 16.32, -688.33),
        Vector3.new(-4891.19, 21.87, -488.14),
    },
    ["Fourth"] = {
        Vector3.new(-4889.80, 21.87, -464.91),
        Vector3.new(-4939.61, 19.08, -451.23),
        Vector3.new(-4966.23, 19.08, -456.08),
    }
}

if not zonePositions[selectedZone] then
    warn(string.format("[ERR] Invalid EventZone '%s' in config. Must be one of: First, Second, Third, Fourth.", selectedZone))
    return
end

local function dropOnto(pos)
    rootPart.CFrame = CFrame.new(pos + Vector3.new(0, 10, 0))
end

local function startTrickOrTreatLoop()
    local positions = zonePositions[selectedZone]
    task.spawn(function()
        while true do
            for _, pos in ipairs(positions) do
                dropOnto(pos)
                task.wait(5)
            end
        end
    end)
end

print("[INFO] TrickOrTreat Farm started for EventZone:", selectedZone)
startTrickOrTreatLoop()
