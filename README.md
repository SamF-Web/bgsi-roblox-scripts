# Bubble Gum Simulator INFINITY Scripts
![VEGAX](https://badge.ttsalpha.com/api?icon=android&label=VEGAX&status=WORKING&color=2bc440&iconColor=ffffff) ![CODEX](https://badge.ttsalpha.com/api?icon=android&label=CODEX&status=WORKING&color=2bc440&iconColor=ffffff) ![Xeno](https://badge.ttsalpha.com/api?icon=nvidia&label=Xeno&status=WORKING&color=2bc440&iconColor=ffffff) ![AWP](https://badge.ttsalpha.com/api?icon=nvidia&label=AWP&status=WORKING&color=2bc440&iconColor=ffffff) ![Gamebuild](https://badge.ttsalpha.com/api?icon=wegame&label=Gamebuild&status=v9781&iconColor=ffffff)


This is a archive of my personal scripts for BGSI.

## Installation

Use for your favorite executor and copy and paste `main.lua` into the console and execute.

```lua
--// Loader Rev. 1.0.5
getgenv().Config = {
    Webhook = "https://discord.com/api/webhooks/",
    ScriptURL = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/webhook.lua",
    AntiAFKURL = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/antiafk.lua",
}

print("Starting: Hatching Scripts")
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKURL))()

```

## For MoonX + BSGI Scripts

```lua
--// Loader Rev. 1.0.5
getgenv().Config = {
    Webhook = "https://discord.com/api/webhooks/",
    ScriptURL = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/webhook.lua",
    AntiAFKURL = "https://raw.githubusercontent.com/SamF-Web/bgsi-roblox-scripts/refs/heads/main/antiafk.lua",
}

print("Starting: Hatching Scripts")
loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/main/Loader.lua"))()
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKURL))()

```

## Explaination on Webhook
Webhook only sends Legendary and Secret. Thats it really simple.

![WebhookDEMO1](https://img.aliensbald.com/u/Yu3if1.png)


## License

[MIT](https://choosealicense.com/licenses/mit/)


## Donation Shirt Robux
[Shirt Link](https://www.roblox.com/catalog/71032498937806/chiller)
