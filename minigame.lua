local MINIGAME_NAME = "Spooky Darts"
local MINIGAME_DURATION_SECONDS = 60

local config = getgenv().Config and getgenv().Config.EventMinigame

if not config or not config.Mode then
    return
end

local selectedMode = config.Mode
local useTickets = config.UseTickets or false

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.Shared.Framework.Network.Remote.RemoteEvent

local function runMinigameCycle()
    if useTickets then
        RemoteEvent:FireServer("SkipMinigameCooldown", MINIGAME_NAME)
        task.wait(0.5)
    end

    RemoteEvent:FireServer("StartMinigame", MINIGAME_NAME, selectedMode)

    task.wait(MINIGAME_DURATION_SECONDS)

    RemoteEvent:FireServer("FinishMinigame")
end

task.spawn(runMinigameCycle)
