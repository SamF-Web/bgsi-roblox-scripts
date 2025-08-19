--// BGSI Script | Rev. 1.0.8 | BGSI Build v10003
getgenv().Config = {
    --// General Settings
    ClaimPlaytime = true,
    MaxPotionCraft = true,
    SeasonPassClaim = true,
    QuestClaim = true,

    AntiAFK = true, --// if your using a executor that does this for you disable it. [delta auto removes afk]

    --// Webhook Settings
    Webhook_enabled = true,
    Discord_ID = "DISCORDID",
    Webhook = "https://discord.com/api/webhooks/",
    Ignore_AutoDeleted = true, --// Dont disable this unless you want your webhook flooded
    Secret_Only = false,

    --// Anti Scam Settings
    Allowed_User = "ROBLOXNAME", --// Set this as the account that could trade with
    AntiTrade = true,

    --// Performance Boost
    FPS = "5",
    LowGraphics = true,


    --// Script Files
    WebhookScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/webhook.lua",
    AntiAFKScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/antiafk.lua",
    PlaytimeScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/playtime.lua",
    PotionScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/potioncraft.lua",
}

loadstring(game:HttpGet(getgenv().Config.WebhookScript))()
loadstring(game:HttpGet(getgenv().Config.PlaytimeScript))()
loadstring(game:HttpGet(getgenv().Config.PotionScript))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKScript))()
