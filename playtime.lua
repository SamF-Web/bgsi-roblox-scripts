local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteFunction = ReplicatedStorage.Shared.Framework.Network.Remote.RemoteFunction

if not getgenv().Config or not getgenv().Config.ClaimPlaytime then
    print("Playtime claiming is disabled in the config. Script will not run.")
    return
end
local WAIT_TIME = 30

local function claimPlaytime(index)
    local args = {
        [1] = "ClaimPlaytime",
        [2] = index
    }
    
    local success, result = pcall(function()
        return RemoteFunction:InvokeServer(unpack(args))
    end)
    
    if success then
        print(string.format("Successfully attempted to claim Playtime %d. Result: %s", index, tostring(result)))
    else
        warn(string.format("Failed to claim Playtime %d. Error: %s", index, result))
    end
end

while true do
    for i = 1, 9 do
        claimPlaytime(i)
        task.wait(1)
    end
    task.wait(WAIT_TIME)
end
