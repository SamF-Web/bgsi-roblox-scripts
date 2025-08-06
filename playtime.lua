local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFunction = ReplicatedStorage.Shared.Framework.Network.Remote.RemoteFunction

if not getgenv().Config or not getgenv().Config.ClaimPlaytime then
    print("Auto-claiming playtime is disabled in the config. Script will not run.")
    return
end

print("Running: Auto Claim Playtime")

local playtimeClaimInterval = 30

local function claimPlaytime(index)
    local args = {
        [1] = "ClaimPlaytime",
        [2] = index
    }
    
    pcall(function()
        RemoteFunction:InvokeServer(unpack(args))
    end)
end

local lastPlaytimeClaim = 0

while true do
    local currentTime = tick()
    
    if currentTime - lastPlaytimeClaim >= playtimeClaimInterval then
        for i = 1, 9 do
            claimPlaytime(i)
            task.wait(1)
        end
        lastPlaytimeClaim = currentTime
    end
    
    task.wait(5)
end
