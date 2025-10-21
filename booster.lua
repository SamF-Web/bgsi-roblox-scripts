if not getgenv().Config then
    warn("[Alert] You currently have FPS Booster disabled.")
    return
end

print("[OK] FPS Booster")

if getgenv().Config.LowGraphics then
    local Lighting = game:GetService("Lighting")
    local Workspace = game:GetService("Workspace")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    local function optimizeGraphics()
        settings().Rendering.QualityLevel = 1

        pcall(function()
            Lighting.GlobalShadows = false
            Lighting.BloomEnabled = false
            Lighting.BlurEnabled = false
            Lighting.DepthOfFieldEnabled = false
            Lighting.SunRaysEnabled = false
        end)
        print("[FPS-DG] Disabled lighting effects.")
        local function disableShadows(instance)
            if instance:IsA("BasePart") then
                pcall(function()
                    instance.CastShadow = false
                end)
            end

            for _, child in ipairs(instance:GetChildren()) do
                disableShadows(child)
            end
        end
        disableShadows(Workspace)
        Workspace.DescendantAdded:Connect(function(descendant)
            disableShadows(descendant)
        end)
        print("[FPS-DG] Disabled shadows on all parts.")
        local function disableNameAndHealth(character)
            if character and character:FindFirstChildOfClass("Humanoid") then
                character.Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then
                disableNameAndHealth(p.Character)
            end
            p.CharacterAdded:Connect(disableNameAndHealth)
        end
        print("[FPS-DG] Disabled humanoid health and name displays.")
    end
    if player.Character then
        optimizeGraphics()
    else
        player.CharacterAdded:Wait()
        optimizeGraphics()
    end
end

if getgenv().Config.FPS then
    local targetFps = tonumber(getgenv().Config.FPS)
    if targetFps then
        local success, err = pcall(function()
            game.Engine.TargetFps = targetFps
        end)
        if success then
            print("[FPS-DG] Successfully set target FPS to " .. targetFps .. ".")
        else
            warn("[FPS-DG] Failed to set target FPS. " .. tostring(err))
        end
    else
        warn("[FPS-DG] Invalid FPS value provided in the configuration. Please provide a number.")
    end
end
