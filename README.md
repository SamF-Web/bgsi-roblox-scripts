# Bubble Gum Simulator INFINITY Scripts
![VEGAX](https://badge.ttsalpha.com/api?icon=android&label=VEGAX&status=WORKING&color=2bc440&iconColor=ffffff) ![CODEX](https://badge.ttsalpha.com/api?icon=android&label=CODEX&status=WORKING&color=2bc440&iconColor=ffffff) ![Xeno](https://badge.ttsalpha.com/api?icon=nvidia&label=Xeno&status=WORKING&color=2bc440&iconColor=ffffff) ![Gamebuild](https://badge.ttsalpha.com/api?icon=wegame&label=Gamebuild&status=v10012&iconColor=ffffff)


This is a archive of my personal scripts for BGSI.

## Installation

Use for your favorite executor and copy and paste `main.lua` into the console and execute.

```lua
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
    Webhook = "https://discord.com/api/webhooks,
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

```


## Explaination on Webhook
Webhook only sends Legendary and Secret. Thats it really simple.

![WebhookDEMO1](https://img.files.cheap/u/6iYr3k.png)


## License

[MIT](https://choosealicense.com/licenses/mit/)


## Donation Shirt Robux
[Shirt Link](https://www.roblox.com/catalog/71032498937806/chiller)
