print("[OK] Running TrickOrTreat Teleport Script")

if not getgenv().Config or not getgenv().Config.TrickOrTreat then
    warn("[Alert] You currently have TrickOrTreat teleporting disabled.")
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

local function teleportAndJump(pos)
    if not (character and character:FindFirstChild("HumanoidRootPart")) then
        warn("[ERR] Character or HumanoidRootPart not found.")
        return
    end

    character:MoveTo(pos)
    print(string.format("[OK] Teleported to: (%.2f, %.2f, %.2f)", pos.X, pos.Y, pos.Z))

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        task.wait(0.2)
        humanoid.Jump = true
    end
end

local function startTrickOrTreatLoop()
    task.spawn(function()
        while true do
            for _, pos in ipairs(positions) do
                teleportAndJump(pos)
                task.wait(1)
                task.wait(5)
            end
        end
    end)
end

startTrickOrTreatLoop()
