-- Check for supported HTTP request
local httpRequest =
    (syn and syn.request) or
    (http and http.request) or
    (http_request) or
    (fluxus and fluxus.request) or
    (request)

if not httpRequest then
    warn("⚠️ No supported HTTP request method found!")
    return
end

local player = game.Players.LocalPlayer
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")

local petImages = {
    -- Base Legendary Images
    ["Emerald Golem"] = "https://static.wikia.nocookie.net/bgs-infinity/images/8/8f/Emerald_Golem.png/revision/latest?cb=20250412234012",
    ["Inferno Dragon"] = "https://static.wikia.nocookie.net/bgs-infinity/images/0/06/Inferno_Dragon.png/revision/latest?cb=20250412205317",
    ["Flying Pig"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/18/Flying_Pig.png/revision/latest?cb=20250412142625",
    ["Unicorn"] = "https://static.wikia.nocookie.net/bgs-infinity/images/7/7e/Unicorn.png/revision/latest?cb=20250412233524",
    ["Lunar Serpent"] = "https://static.wikia.nocookie.net/bgs-infinity/images/5/50/Lunar_Serpent.png/revision/latest?cb=20250413002818",
    ["Electra"] = "https://static.wikia.nocookie.net/bgs-infinity/images/a/a0/Electra.png/revision/latest?cb=20250412204328",
    ["Dark Phoenix"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/1c/Dark_Phoenix.png/revision/latest?cb=20250413001114",
    ["Neon Elemental"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/11/Neon_Elemental.png/revision/latest?cb=20250413001526",
    ["NULLVoid"] = "https://static.wikia.nocookie.net/bgs-infinity/images/9/98/NULLVoid.png/revision/latest?cb=20250413001555",
    ["Inferno Cube"] = "https://static.wikia.nocookie.net/bgs-infinity/images/0/0d/Inferno_Cube.png/revision/latest?cb=20250413010729",
    ["Virus"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/1d/Virus.png/revision/latest?cb=20250412214808",
    ["Green Hydra"] = "https://static.wikia.nocookie.net/bgs-infinity/images/b/bc/Green_Hydra.png/revision/latest?cb=20250412170659",
    ["Demonic Hydra"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/17/Demonic_Hydra.png/revision/latest?cb=20250412170659",
    ["Hexarium"] = "https://static.wikia.nocookie.net/bgs-infinity/images/8/89/Hexarium.png/revision/latest?cb=20250413010434",
    ["Rainbow Shock"] = "https://static.wikia.nocookie.net/bgs-infinity/images/c/c6/Rainbow_Shock.png/revision/latest?cb=20250413010157",
    ["Sigma Serpent"] = "https://static.wikia.nocookie.net/bgs-infinity/images/3/3d/Sigma_Serpent.png/revision/latest?cb=20250414121909",
    ["Manarium"] = "https://static.wikia.nocookie.net/bgs-infinity/images/5/5d/Manarium.png/revision/latest?cb=20250414121813",
    ["MAN FACE GOD"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/1b/MAN_FACE_GOD.png/revision/latest?cb=20250414020316",
    ["The Overlord"] = "https://static.wikia.nocookie.net/bgs-infinity/images/c/c0/The_Overlord.png/revision/latest?cb=20250413130318",
    ["King Doggy"] = "https://static.wikia.nocookie.net/bgs-infinity/images/a/a8/King_Doggy.png/revision/latest?cb=20250412152038",
    -- Event Pets
    ["Seraphic Bunny"] = "https://static.wikia.nocookie.net/bgs-infinity/images/d/d7/Seraphic_Bunny.png/revision/latest/scale-to-width-down/130?cb=20250418234258",
    ["Ethereal Bunny"] = "https://static.wikia.nocookie.net/bgs-infinity/images/b/b9/Ethereal_Bunny.png/revision/latest/scale-to-width-down/130?cb=20250419000116",
    ["Cardinal Bunny"] = "https://static.wikia.nocookie.net/bgs-infinity/images/3/33/Cardinal_Bunny.png/revision/latest/scale-to-width-down/130?cb=20250419014509",
    ["Easter Basket"] = "https://static.wikia.nocookie.net/bgs-infinity/images/0/00/Easter_Basket.png/revision/latest/scale-to-width-down/130?cb=20250419001802",
    ["Sweet Treat"] = "https://static.wikia.nocookie.net/bgs-infinity/images/0/0e/Sweet_Treat.png/revision/latest/scale-to-width-down/130?cb=20250418233529",
    ["Rainbow Marshmellow"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/14/Rainbow_Marshmellow.png/revision/latest/scale-to-width-down/130?cb=20250418232506",
    ["Giant Chocolate Chicken"] = "https://static.wikia.nocookie.net/bgs-infinity/images/e/ef/Giant_Chocolate_Chicken.png/revision/latest/scale-to-width-down/130?cb=20250419001410",
    ["Easter Serpent"] = "https://static.wikia.nocookie.net/bgs-infinity/images/c/cd/Easter_Serpent.png/revision/latest/scale-to-width-down/130?cb=20250423223156",
    ["Dualcorn"] = "https://static.wikia.nocookie.net/bgs-infinity/images/b/bc/Dualcorn.png/revision/latest/scale-to-width-down/130?cb=20250423223401",
    ["Holy Egg"] = "https://static.wikia.nocookie.net/bgs-infinity/images/d/d7/Holy_Egg.png/revision/latest/scale-to-width-down/130?cb=20250423223522",
    ["Godly Gem"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/18/Godly_Gem.png/revision/latest?cb=20250423224429",
    ["Dementor"] = "https://static.wikia.nocookie.net/bgs-infinity/images/5/58/Dementor.png/revision/latest/scale-to-width-down/130?cb=20250423233608",
}

local fallbackImage = "https://static.wikia.nocookie.net/bgs-infinity/images/7/73/Common_Pet.png"
local recentFrames = {}

local function isRecentFrame(frame)
    local id = tostring(frame)
    if recentFrames[id] and tick() - recentFrames[id] < 10 then
        return true
    end
    recentFrames[id] = tick()
    return false
end

local function sendWebhook(name, rarity, shiny, image, chance)
    local rarityLower = rarity:lower()
    local shinyPrefix = shiny and "✨ Shiny " or ""
    local baseTitle = "Pet Hatched"

    if rarityLower:find("secret") then
        baseTitle = shinyPrefix .. "Secret Pet Hatched"
    elseif rarityLower:find("mythic") then
        baseTitle = shinyPrefix .. "Mythic Pet Hatched"
    elseif rarityLower:find("legendary") then
        baseTitle = shinyPrefix .. "Legendary Pet Hatched"
    end

    local desc = string.format("**__Pet Name:__** %s\n**__Pet Rarity:__** %s\n", name, rarity)
    if chance and chance ~= "" then
        desc = desc .. "**__Chance:__** " .. chance .. "\n"
    end

    local time = os.time()
    desc = desc .. "**__Catch Date:__** <t:" .. time .. ":F>"

    local totalHatches = "N/A"
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local hatches = leaderstats:FindFirstChild("🥚 Hatches")
        if hatches and hatches:IsA("IntValue") then
            totalHatches = tostring(hatches.Value)
        end
    end

    local data = {
        ["content"] = "@everyone",
        ["embeds"] = {{
            ["title"] = baseTitle,
            ["description"] = desc,
            ["color"] = 28927,
            ["footer"] = {
                ["text"] = "Pet Hatched By: " .. player.Name .. " | 🥚 Total Hatches: " .. totalHatches
            },
            ["thumbnail"] = {
                ["url"] = image or fallbackImage
            }
        }}
    }

    httpRequest({
        Url = getgenv().Config.Webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = httpService:JSONEncode(data)
    })
end

local function monitorHatch()
    local gui = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("ScreenGui")
    if not gui then return end

    local hatch = gui:FindFirstChild("Hatching")
    if not hatch then return end

    for _, frame in ipairs(hatch:GetChildren()) do
        if frame:IsA("Frame") and frame:FindFirstChild("Label") and frame:FindFirstChild("Rarity") then
            local name = frame.Label.Text
            local rarity = frame.Rarity.Text
            local shiny = frame:FindFirstChild("Shiny") and frame.Shiny.Visible or false
            local chance = frame:FindFirstChild("Chance") and frame.Chance.Text or nil
            local rarityLower = rarity:lower()

            if rarityLower:find("legendary") or rarityLower:find("secret") or rarityLower:find("mythic") then
                if not isRecentFrame(frame) then
                    local image = petImages[name] or fallbackImage
                    sendWebhook(name, rarity, shiny, image, chance)
                    print("📤 Sent webhook for:", name)
                end
            end
        end
    end
end

runService.RenderStepped:Connect(monitorHatch)
print("Running: Webhook Alerts")
