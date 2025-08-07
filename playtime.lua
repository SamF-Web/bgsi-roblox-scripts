print("Running: Auto Claim Playtime")

if not getgenv().Config or not getgenv().Config.ClaimPlaytime then
    warn("⚠️ Auto-claiming playtime is disabled in the config.")
    return
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local success, RemoteFunction = pcall(function()
    return ReplicatedStorage:WaitForChild("Shared", 10)
        :WaitForChild("Framework", 10)
        :WaitForChild("Network", 10)
        :WaitForChild("Remote", 10)
        :WaitForChild("RemoteFunction", 10)
end)

if not success or not RemoteFunction then
    warn("❌ Failed to find RemoteFunction. Playtime claiming will not run.")
    return
end

local function claimAllPlaytime()
    task.spawn(function()
        while true do
            for i = 1, 9 do
                local args = {
                    [1] = "ClaimPlaytime",
                    [2] = i
                }

                local ok, result = pcall(function()
                    return RemoteFunction:InvokeServer(unpack(args))
                end)

                if ok then
                    print("🎁 Claimed Playtime " .. i)
                else
                    warn("❌ Failed to claim Playtime " .. i .. ": " .. tostring(result))
                end

                task.wait(1.5) 
            end

            task.wait(60)
        end
    end)
end

claimAllPlaytime()
