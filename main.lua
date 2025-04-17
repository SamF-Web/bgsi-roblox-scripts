--// Loader
getgenv().Config = {
    Webhook = "Webhook URL",
    ScriptURL = "https://russia.1ms.network/rblx/bbsi.lua",
    AntiAFKURL = "https://russia.1ms.network/rblx/antiafk.lua"
}

print("Starting: Hatching Scripts")
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKURL))()
