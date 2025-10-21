if not getgenv().Config or not getgenv().Config.MaxPotionCraft then return end
print("[OK] Running Potion Craft")

local re = game:GetService("ReplicatedStorage"):WaitForChild("Shared", 10)
    :WaitForChild("Framework", 10):WaitForChild("Network", 10)
    :WaitForChild("Remote", 10):WaitForChild("RemoteEvent", 10)

local potions = { "Lucky", "Speed", "Coins", "Mythic" }

task.spawn(function()
    while true do
        for _, p in ipairs(potions) do
            for t = 1, 6 do
                local ok, err = pcall(function()
                    re:FireServer("CraftPotion", p, t, true)
                end)
                task.wait(2)
            end
        end
        task.wait(300)
    end
end)
