# Bubble Gum Simulator INFINITY Scripts
![VEGAX](https://badge.ttsalpha.com/api?icon=android&label=VEGAX&status=WORKING&color=2bc440&iconColor=ffffff) ![CODEX](https://badge.ttsalpha.com/api?icon=android&label=CODEX&status=WORKING&color=2bc440&iconColor=ffffff) ![Xeno](https://badge.ttsalpha.com/api?icon=nvidia&label=Xeno&status=WORKING&color=2bc440&iconColor=ffffff) ![AWP](https://badge.ttsalpha.com/api?icon=nvidia&label=AWP&status=WORKING&color=2bc440&iconColor=ffffff) ![Gamebuild](https://badge.ttsalpha.com/api?icon=wegame&label=Gamebuild&status=v9781&iconColor=ffffff)


This is a archive of my personal scripts for BGSI.

## Installation

Use for your favorite executor and copy and paste `main.lua` into the console and execute.

```lua
--// BGSI Script | Rev. 1.0.6 | BGSI Build v9986
getgenv().Config = {
    --// General Settings
    ClaimPlaytime = true,
    AntiAFK = true,

    --// Webhook Settings
    Webhook_enabled = true,
    Discord_ID = "DISCORDID",
    Webhook = "https://discord.com/api/webhooks/",
    Ignore_AutoDeleted = true,
    Secret_Only = false,

    --// Script Files
    WebhookScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/webhook.lua",
    AntiAFKScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/antiafk.lua",
    PlaytimeScript = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/playtime.lua"
}

loadstring(game:HttpGet(getgenv().Config.WebhookScript))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKScript))()
loadstring(game:HttpGet(getgenv().Config.PlaytimeScript))()
```


## Explaination on Webhook
Webhook only sends Legendary and Secret. Thats it really simple.

![WebhookDEMO1](https://img.aliensbald.com/u/Yu3if1.png)


## License

[MIT](https://choosealicense.com/licenses/mit/)


## Donation Shirt Robux
[Shirt Link](https://www.roblox.com/catalog/71032498937806/chiller)
