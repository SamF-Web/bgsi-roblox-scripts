# Bubble Gum Simulator INFINITY Scripts
![Static Badge](https://img.shields.io/badge/AWP_BUILD-VALID-green) ![Static Badge](https://img.shields.io/badge/VEGAX_BUILD-VALID-green)

This is a archive of my personal scripts for BGSI.

There is another Menu included in the `main.lua` which is MoonX.

## Installation

Use for your favorite executor and copy and paste `main.lua` into the console and execute.

```lua
--// Loader
 getgenv().Config = {
     Webhook = "https://discord.com/api/webhooks/",
     ScriptURL = "https://russia.1ms.network/rblx/webhook.lua",
     AntiAFKURL = "https://russia.1ms.network/rblx/antiafk.lua"
 }
 
 print("Starting: Hatching Scripts")
 loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
 loadstring(game:HttpGet(getgenv().Config.AntiAFKURL))()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/main/Loader.lua"))()
```

## For ONLY Webhook and not MoonX

```lua
--// Loader
 getgenv().Config = {
     Webhook = "https://discord.com/api/webhooks/",
     ScriptURL = "https://russia.1ms.network/rblx/webhook.lua",
     AntiAFKURL = "https://russia.1ms.network/rblx/antiafk.lua"
 }
 
 print("Starting: Hatching Scripts")
 loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
 loadstring(game:HttpGet(getgenv().Config.AntiAFKURL))()
 --// MoonX //loadstring(game:HttpGet("https://raw.githubusercontent.com/MateoDev2024/MoonX/main/Loader.lua"))()
```

## Explaination on Webhook
Webhook only sends Legendary and Secret. Thats it really simple.

![WebhookDEMO1](https://img.aliensbald.com/u/mVaVL8.png)


## License

[MIT](https://choosealicense.com/licenses/mit/)
