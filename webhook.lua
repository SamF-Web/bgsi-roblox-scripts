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

-- Pet image database
local petImages = {
    -- Legendary
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

    -- Secret
    ["MAN FACE GOD"] = "https://static.wikia.nocookie.net/bgs-infinity/images/1/1b/MAN_FACE_GOD.png/revision/latest?cb=20250414020316",
    ["The Overlord"] = "https://static.wikia.nocookie.net/bgs-infinity/images/c/c0/The_Overlord.png/revision/latest?cb=20250413130318",
    ["King Doggy"] = "https://static.wikia.nocookie.net/bgs-infinity/images/a/a8/King_Doggy.png/revision/latest?cb=20250412152038"
}

local function sendWebhook(name, rarity, image)
    local data = {
        ["embeds"] = {{
            ["title"] = (petImages[name] and "⭐ Legendary Pet Hatched" or "🌟 Secret Pet Hatched"),
            ["description"] = string.format("**__Pet Name:__** %s\n**__Pet Rarity:__** %s\n**__Catch Date:__** %s", name, rarity, os.date("%Y-%m-%d %H:%M:%S")),
            ["color"] = 28927,
            ["footer"] = {
                ["text"] = "Pet Hatched By: " .. player.Name
            },
            ["thumbnail"] = {
                ["url"] = image
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

local lastPet = ""

local function monitorHatch()
    local gui = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("ScreenGui")
    if not gui then return end

    local hatch = gui:FindFirstChild("Hatching")
    if not hatch then return end

    local template = hatch:FindFirstChild("Template")
    if not template then return end

    local label = template:FindFirstChild("Label")
    local rarity = template:FindFirstChild("Rarity")

    if label and rarity then
        local name = label.Text
        local rarityText = rarity.Text

        if name ~= lastPet then
            lastPet = name
            if petImages[name] then
                sendWebhook(name, rarityText, petImages[name])
                print("📤 Sent webhook for pet:", name)
            end
        end
    end
end

print("Running: Webhook Alerts")
runService.RenderStepped:Connect(monitorHatch)
