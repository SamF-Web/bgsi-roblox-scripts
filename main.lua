--// Loader Rev. 1.0.5
getgenv().Config = {
    Webhook = "https://discord.com/api/webhooks/",
    ScriptURL = "https://cdn.1ms.network/rblx/webhook.lua",
    AntiAFKURL = "https://cdn.1ms.network/rblx/antiafk.lua",
}

print("Starting: Hatching Scripts")
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKURL))()
