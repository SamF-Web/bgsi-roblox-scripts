--// BGSI Script | Rev. 1.1.0 | BGSI Build v10068
getgenv().Config = {
    --// General Settings
    ClaimPlaytime = true,
    MaxPotionCraft = true,
    SeasonPassClaim = true,

    AntiAFK = true, --// if your using a executor that does this for you disable it. [delta auto removes afk]

    --// Event Scripts
    TrickOrTreat = true, --// You Must be in the halloween world for it to start. [Bubble jump power must be 0]

    --// Webhook Settings
    Webhook_enabled = true,
    Discord_ID = "DISCORDID",
    Webhook = "https://discord.com/api/webhooks/",
    Ignore_AutoDeleted = true, --// Dont disable this unless you want your webhook flooded
    Secret_Only = false,

    --// Anti Scam Settings
    Allowed_User = "ROBLOXUSERNAME", --// Set this as the account that could trade with you.
    AntiTrade = true,

    --// Performance Boost
    FPS = "5",
    LowGraphics = False,

    --// Script Files
    WebhookScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/webhook.lua",
    AntiAFKScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/antiafk.lua",
    PlaytimeScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/playtime.lua",
    SeasonPassScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/seasonpass.lua",
    PotionScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/potioncraft.lua",
    BoosterScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/booster.lua",
    TrickOrTreatScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/trickortreat.lua",
}

loadstring(game:HttpGet(getgenv().Config.WebhookScript))()
loadstring(game:HttpGet(getgenv().Config.PlaytimeScript))()
loadstring(game:HttpGet(getgenv().Config.SeasonPassScript))()
loadstring(game:HttpGet(getgenv().Config.PotionScript))()
loadstring(game:HttpGet(getgenv().Config.TrickOrTreatScript))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKScript))()

