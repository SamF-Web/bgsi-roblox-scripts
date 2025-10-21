# Bubble Gum Simulator INFINITY Scripts
![VEGAX](https://badge.ttsalpha.com/api?icon=android&label=VEGAX&status=WORKING&color=2bc440&iconColor=ffffff) ![CODEX](https://badge.ttsalpha.com/api?icon=android&label=CODEX&status=WORKING&color=2bc440&iconColor=ffffff) ![Xeno](https://badge.ttsalpha.com/api?icon=nvidia&label=Xeno&status=WORKING&color=2bc440&iconColor=ffffff) ![Gamebuild](https://badge.ttsalpha.com/api?icon=wegame&label=Gamebuild&status=v10068&iconColor=ffffff)


This is a archive of my personal scripts for BGSI.

## Installation

Use for your favorite executor and copy and paste `main.lua` into the console and execute.

```lua
[--// BGSI Script | Rev. 1.0.9 | BGSI Build v10068
getgenv().Config = {
    --// General Settings
    ClaimPlaytime = true,
    MaxPotionCraft = true,
    SeasonPassClaim = true,

    AntiAFK = true, --// if your using a executor that does this for you disable it. [delta auto removes afk]

    --// Webhook Settings
    Webhook_enabled = true,
    Discord_ID = "YOURDISCORDID",
    Webhook = "https://discord.com/api/webhooks/",
    Ignore_AutoDeleted = true, --// Dont disable this unless you want your webhook flooded
    Secret_Only = false,

    --// Anti Scam Settings
    Allowed_User = "ROBLOXUSERNAME", --// Set this as the account that could trade with you.
    AntiTrade = true,

    --// Performance Boost
    FPS = "5",
    LowGraphics = true,


    --// Script Files
    WebhookScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/webhook.lua",
    AntiAFKScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/antiafk.lua",
    PlaytimeScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/playtime.lua",
    SeasonPassScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/seasonpass.lua",
    PotionScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/potioncraft.lua",
    BoosterScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/booster.lua",
}

loadstring(game:HttpGet(getgenv().Config.WebhookScript))()
loadstring(game:HttpGet(getgenv().Config.PlaytimeScript))()
loadstring(game:HttpGet(getgenv().Config.SeasonPassScript))()
loadstring(game:HttpGet(getgenv().Config.PotionScript))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKScript))()
loadstring(game:HttpGet(getgenv().Config.BoosterScript))()](https://img.files.cheap/u/gNboF6.gif)
```
