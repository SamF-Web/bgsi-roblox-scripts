print("[OK] Running Season Pass Claim")

if not getgenv().Config or not getgenv().Config.SeasonPassClaim then
    warn("[Alert] You currently have Season Pass Claim disabled.")
    return
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local success, RemoteEvent = pcall(function()
    return ReplicatedStorage:WaitForChild("Shared", 10)
        :WaitForChild("Framework", 10)
        :WaitForChild("Network", 10)
        :WaitForChild("Remote", 10)
        :WaitForChild("RemoteEvent", 10)
end)

if not success or not RemoteEvent then
    warn("[ERR] Season Pass event not found.")
    return
end

local function claimSeasonPass()
    task.spawn(function()
        while true do
            local args = {
                [1] = "ClaimSeason"
            }

            local ok, err = pcall(function()
                RemoteEvent:FireServer(unpack(args))
            end)

            if ok then
                print("[OK] Season Pass claimed successfully.")
            else
                warn("[ERR] Failed to claim Season Pass:", err)
            end

            task.wait(60)
        end
    end)
end

claimSeasonPass()
