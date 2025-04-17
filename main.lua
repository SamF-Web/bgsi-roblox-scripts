--// Loader
getgenv().Config = {
    Webhook = "Webhook_URL",
    ScriptURL = "https://russia.1ms.network/rblx/bbsi.lua",
}

print("Starting: Hatching Webhook Alerts")
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
