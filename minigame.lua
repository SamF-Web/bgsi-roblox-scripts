print("[OK] Minigame Script loaded.")

if not getgenv().Config or not getgenv().Config.EventMinigame then return end

local MINIGAME_NAME = "Spooky Darts"
local MIN_DURATION = 45
local MAX_DURATION = 60
local COOLDOWN_WAIT_SECONDS = 20 * 60

local selectedMode = getgenv().Config.Mode or "Easy"
local useTickets = getgenv().Config.UseTickets or false

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local success, RemoteEvent = pcall(function()
    return ReplicatedStorage:WaitForChild("Shared", 10)
        :WaitForChild("Framework", 10)
        :WaitForChild("Network", 10)
        :WaitForChild("Remote", 10)
        :WaitForChild("RemoteEvent", 10)
end)

if not success or not RemoteEvent then return end

math.randomseed(tick())

task.spawn(function()
    while true do
        local ok = pcall(function()
            RemoteEvent:FireServer("SkipMinigameCooldown", MINIGAME_NAME)
            task.wait(0.5)
            RemoteEvent:FireServer("StartMinigame", MINIGAME_NAME, selectedMode)
            task.wait(math.random(MIN_DURATION, MAX_DURATION))
            RemoteEvent:FireServer("FinishMinigame")
            task.wait(5)
        end)
        if not ok then task.wait(5) end
        if not useTickets then
            task.wait(COOLDOWN_WAIT_SECONDS)
        else
            task.wait(1)
        end
    end
end)
