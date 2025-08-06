local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFunction = ReplicatedStorage.Shared.Framework.Network.Remote.RemoteFunction

if not getgenv().Config or not getgenv().Config.ClaimPlaytime then
    print("Auto-claiming playtime is disabled in the config. Script will not run.")
    return
end

local playtimeClaimInterval = 30

local function claimPlaytime(index)
    local args = {
        [1] = "ClaimPlaytime",
        [2] = index
    }
    
    local success, result = pcall(function()
        return RemoteFunction:InvokeServer(unpack(args))
    end)
    
    if success then
        print(string.format("✅ Playtime Claimer: Successfully attempted to claim Playtime %d. Result: %s", index, tostring(result)))
    else
        warn(string.format("❌ Playtime Claimer: Failed to claim Playtime %d. Error: %s", index, result))
    end
end

local lastPlaytimeClaim = 0

while true do
    local currentTime = tick()
    
    if currentTime - lastPlaytimeClaim >= playtimeClaimInterval then
        print("--- Starting new playtime claim cycle ---")
        for i = 1, 9 do
            print(string.format("Attempting to claim Playtime event %d...", i))
            claimPlaytime(i)
            task.wait(1)
        end
        print(string.format("--- Cycle complete. Next cycle in %d seconds ---", playtimeClaimInterval))
        lastPlaytimeClaim = currentTime
    end
    
    task.wait(5)
end
