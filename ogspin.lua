print("[OK] Running Auto Spin")

if not getgenv().Config or not getgenv().Config.OGSpin then
    warn("[Alert] You currently have OGSpin disabled.")
    return
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local success, networkFolder = pcall(function()
    return ReplicatedStorage:WaitForChild("Shared", 10)
        :WaitForChild("Framework", 10)
        :WaitForChild("Network", 10)
        :WaitForChild("Remote", 10)
end)

if not success or not networkFolder then
    warn("[ERR] OGSpin requirements not found.")
    return
end

local RemoteFunction = networkFolder:WaitForChild("RemoteFunction", 10)
local RemoteEvent = networkFolder:WaitForChild("RemoteEvent", 10)

if not RemoteFunction or not RemoteEvent then
    warn("[ERR] OGSpin remote objects not found.")
    return
end

local function spinOGWheel()
    task.spawn(function()
        while true do
            pcall(function()
                RemoteFunction:InvokeServer("OGWheelSpin")
                task.wait(1)
                RemoteEvent:FireServer("ClaimOGWheelSpinQueue")
            end)
            
            task.wait(60)
        end
    end)
end

spinOGWheel()