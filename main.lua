--// Loader Rev. 1.0.4
getgenv().Config = {
    Webhook = "https://discord.com/api/webhooks/",
    ScriptURL = "https://russia.1ms.network/rblx/webhook.lua",
    AntiAFKURL = "https://russia.1ms.network/rblx/antiafk.lua",

    --// Config | Change the key in the "" to update keybind
    AntiAFKBind = "R"
}

print("Starting: Hatching Scripts")
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKURL))()
