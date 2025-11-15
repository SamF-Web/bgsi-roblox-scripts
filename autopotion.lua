print("[OK] Running Auto Potion")

if not getgenv().Config then
    warn("[Alert] Config not found.")
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
    warn("[ERR] Auto Potion requirements not found.")
    return
end

local potions = {
    {name = "Secret Elixir", enabled = getgenv().Config.SecretElixir, cooldown = 12 * 60},
    {name = "Infinity Elixir", enabled = getgenv().Config.InfinityElixir, cooldown = 6 * 60}, 
    {name = "Egg Elixir", enabled = getgenv().Config.EggElixir, cooldown = 25 * 60}, 
    {name = "Lucky", enabled = getgenv().Config.LuckyInf, cooldown = 37 * 60, tier = 7}, 
    {name = "Speed", enabled = getgenv().Config.SpeedInf, cooldown = 37 * 60, tier = 7}, 
    {name = "Mythic", enabled = getgenv().Config.MythicInf, cooldown = 37 * 60, tier = 7} 
}

local enabledPotions = {}
for _, potion in ipairs(potions) do
    if potion.enabled then
        table.insert(enabledPotions, potion)
    end
end

if #enabledPotions == 0 then
    warn("[Alert] No potions enabled in config.")
    return
end

print("Enabled potions:")
for _, potion in ipairs(enabledPotions) do
    print(" - " .. potion.name .. " (Cooldown: " .. (potion.cooldown / 60) .. " minutes)")
end

local function usePotion(potion)
    task.spawn(function()
        task.wait(math.random(2, 5))
        while true do
            local args = {
                "UsePotion",
                potion.name,
                potion.tier or 1
            }
            
            local ok, err = pcall(function()
                RemoteEvent:FireServer(unpack(args))
            end)
            
            if not ok then
                warn("[ERROR] Failed to use " .. potion.name .. ": " .. tostring(err))
            end
            
            task.wait(potion.cooldown)
        end
    end)
end

for _, potion in ipairs(enabledPotions) do
    usePotion(potion)
end