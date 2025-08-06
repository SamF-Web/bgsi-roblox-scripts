local httpRequest =
    (syn and syn.request) or
    (http and http.request) or
    (http_request) or
    (fluxus and fluxus.request) or
    (request)

if not httpRequest then
    warn("⚠️ No supported HTTP request method found!")
    return
end

local player = game.Players.LocalPlayer
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")

local fallbackImage = "https://static.wikia.nocookie.net/bgs-infinity/images/7/73/Common_Pet.png"
local recentFrames = {}

local function isRecentFrame(frame)
    local id = tostring(frame)
    if recentFrames[id] and tick() - recentFrames[id] < 10 then
        return true
    end
    recentFrames[id] = tick()
    return false
end

local function sendWebhook(name, rarity, shiny, chance)
    if not getgenv().Config.Webhook_enabled then
        return
    end

    if chance and not string.find(chance, " in ", 1, true) then
        return
    end

    local rarityLower = rarity:lower()
    local shinyPrefix = shiny and "✨ Shiny " or ""
    local baseTitle = "Pet Hatched"

    if rarityLower:find("secret") then
        baseTitle = shinyPrefix .. "Secret Pet Hatched"
    elseif rarityLower:find("mythic") then
        baseTitle = shinyPrefix .. "Mythic Pet Hatched"
    elseif rarityLower:find("legendary") then
        baseTitle = shinyPrefix .. "Legendary Pet Hatched"
    end

    local desc = string.format("**__Pet Name:__** %s\n**__Pet Rarity:__** %s\n", name, rarity)
    if chance and chance ~= "" then
        desc = desc .. "**__Chance:__** " .. chance .. "\n"
    end

    local time = os.time()
    desc = desc .. "**__Catch Date:__** <t:" .. time .. ":F>"

    local totalHatches = "N/A"
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local hatches = leaderstats:FindFirstChild("🥚 Hatches")
        if hatches and hatches:IsA("IntValue") then
            totalHatches = tostring(hatches.Value)
        end
    end

    local discordID = tostring(getgenv().Config.Discord_ID)
    local mention = ""
    if discordID and discordID ~= "" then
        mention = "<@" .. discordID .. ">"
    end

    local data = {
        ["content"] = mention,
        ["embeds"] = {{
            ["title"] = baseTitle,
            ["description"] = desc,
            ["color"] = 28927,
            ["footer"] = {
                ["text"] = "Pet Hatched By: " .. player.Name .. " | 🥚 Total Hatches: " .. totalHatches
            }
        }}
    }

    httpRequest({
        Url = getgenv().Config.Webhook,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = httpService:JSONEncode(data)
    })
end

local function monitorHatch()
    local gui = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("ScreenGui")
    if not gui then return end
    local hatch = gui:FindFirstChild("Hatching")
    if not hatch then return end
    for _, frame in ipairs(hatch:GetChildren()) do
        if frame:IsA("Frame") and frame:FindFirstChild("Label") and frame:FindFirstChild("Rarity") then
            local name = frame.Label.Text
            local rarity = frame.Rarity.Text
            local shiny = frame.Shiny.Visible
            local deleted = frame.Deleted.Visible
            local chance = frame:FindFirstChild("Chance") and frame.Chance.Text or nil
            local rarityLower = rarity:lower()
            if rarityLower:find("legendary") or rarityLower:find("secret") or rarityLower:find("mythic") then
                if not deleted then
                    if not isRecentFrame(frame) then
                        sendWebhook(name, rarity, shiny, chance)
                    end
                end
            end
        end
    end
end

if getgenv().Config.Webhook_enabled then
    runService.RenderStepped:Connect(monitorHatch)
    print("Running: Webhook Alerts")
else
    print("Webhook Alerts are disabled in the config.")
end
