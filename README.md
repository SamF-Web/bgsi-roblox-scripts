# Bubble Gum Simulator INFINITY Scripts
![VEGAX](https://badge.ttsalpha.com/api?icon=android&label=VEGAX&status=WORKING&color=2bc440&iconColor=ffffff) ![CODEX](https://badge.ttsalpha.com/api?icon=android&label=CODEX&status=WORKING&color=2bc440&iconColor=ffffff) ![Xeno](https://badge.ttsalpha.com/api?icon=nvidia&label=Xeno&status=WORKING&color=2bc440&iconColor=ffffff) ![Gamebuild](https://badge.ttsalpha.com/api?icon=wegame&label=Gamebuild&status=v10074&iconColor=ffffff)


This is a archive of my personal scripts for BGSI.

## Installation

Use for your favorite executor and copy and paste `main.lua` into the console and execute.

```lua
--// BGSI Script | Rev. 1.1.3 | BGSI Build v10077
getgenv().Config = {
    --// General Settings
    ClaimPlaytime = true,
    MaxPotionCraft = true,
    SeasonPassClaim = true,
    AntiAFK = true,

    --// Event Scripts
    AutoBuyEventShop = true, --// Will auto buy the normal halloween shop [NOT THE SHOP WITH THE SECRET]
    EventZone = "First", --// First, Second, Third, Fourth
    TrickOrTreat = false,

    --// Event Minigame
    Mode = "Easy" --// Easy, Medium, Hard, insane
    UseTickets = true, --// uses super tickets [if false will wait the cooldown]


    --// Webhook Settings
    Webhook_enabled = true,
    Discord_ID = "DiscordID",
    Webhook = "https://discord.com/api/webhooks/",
    Ignore_AutoDeleted = true,
    Secret_Only = false,

    --// Anti Scam Settings
    Allowed_User = "RobloxName", --// Set this as the account that could trade with you.
    AntiTrade = true,

    --// Performance Boost
    FPS = "5",
    LowGraphics = false,

    --// Script Files
    WebhookScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/webhook.lua",
    AntiAFKScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/antiafk.lua",
    PlaytimeScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/playtime.lua",
    SeasonPassScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/seasonpass.lua",
    PotionScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/potioncraft.lua",
    BoosterScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/booster.lua",
    TrickOrTreatScript = "https://raw.bgsi-botting.xyz/v10077/events/trickortreat.lua",
    MinigameScript = "https://raw.bgsi-botting.xyz/v10077/events/minigame.lua"
}

loadstring(game:HttpGet(getgenv().Config.WebhookScript))()
loadstring(game:HttpGet(getgenv().Config.PlaytimeScript))()
loadstring(game:HttpGet(getgenv().Config.SeasonPassScript))()
loadstring(game:HttpGet(getgenv().Config.PotionScript))()
loadstring(game:HttpGet(getgenv().Config.TrickOrTreatScript))()
loadstring(game:HttpGet(getgenv().Config.MinigameScript))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKScript))()
loadstring(game:HttpGet(getgenv().Config.BoosterScript))()
```
