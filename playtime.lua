print("playtime.lua loaded")

if not getgenv().Config or not getgenv().Config.ClaimPlaytime then
    print("Auto-claiming playtime is disabled in the config. Script will not run.")
    return
end

print("Running: Auto Claim Playtime")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local success, RemoteFunction = pcall(function()
    return ReplicatedStorage:WaitForChild("Shared", 10)
        :WaitForChild("Framework", 10)
        :WaitForChild("Network", 10)
        :WaitForChild("Remote", 10)
        :WaitForChild("RemoteFunction", 10)
end)

if not success or not RemoteFunction then
    warn("RemoteFunction path is invalid or not found.")
    return
end

while task.wait(3) do
    for i = 1, 9 do
        local args = {
            [1] = "ClaimPlaytime",
            [2] = i
        }

        pcall(function()
            RemoteFunction:InvokeServer(unpack(args))
        end)

        task.wait(3)
    end
end
