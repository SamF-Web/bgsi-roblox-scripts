print("[OK] Running TrickOrTreat Farm Script")

if not getgenv().Config or not getgenv().Config.TrickOrTreat then
    warn("[Alert] You currently have TrickOrTreat Farm disabled.")
    return
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local positions = {
    Vector3.new(-5035.52, 25.16, -547.86),
    Vector3.new(-5059.96, 25.16, -556.41),
    Vector3.new(-5051.66, 22.37, -595.76),
    Vector3.new(-5080.74, 22.31, -688.19),
    Vector3.new(-5057.93, 22.31, -695.73),
    Vector3.new(-5033.55, 22.37, -620.40)
}

local function teleportTo(pos)
    if character and character:FindFirstChild("HumanoidRootPart") then
        character:MoveTo(pos)
    else
        warn("[ERR] Character or HumanoidRootPart not found.")
    end
end

local function startTrickOrTreatLoop()
    task.spawn(function()
        while true do
            for _, pos in ipairs(positions) do
                teleportTo(pos)
                task.wait(5)
            end
        end
    end)
end

startTrickOrTreatLoop()
