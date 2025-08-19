if not getgenv().Config then
    warn("⚠️ FPS Booster is disabled or the configuration table was not found. Script will not run.")
    return
end

print("✅ FPS Booster script loaded.")

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
        print("✅ Disabled lighting effects.")
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
        print("✅ Disabled shadows on all parts.")
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
        print("✅ Disabled humanoid health and name displays.")
    end
    if player.Character then
        optimizeGraphics()
    else
        player.CharacterAdded:Wait()
        optimizeGraphics()
    end

    print("🎉 Low graphics mode initialized successfully!")
end

if getgenv().Config.FPS then
    local targetFps = tonumber(getgenv().Config.FPS)
    if targetFps then
        local success, err = pcall(function()
            game.Engine.TargetFps = targetFps
        end)
        if success then
            print("✅ Successfully set target FPS to " .. targetFps .. ".")
        else
            warn("❌ Failed to set target FPS. " .. tostring(err))
        end
    else
        warn("⚠️ Invalid FPS value provided in the configuration. Please provide a number.")
    end
end
