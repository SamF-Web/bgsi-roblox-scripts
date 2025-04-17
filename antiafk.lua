local vu = game:GetService("VirtualUser")
local plr = game:GetService("Players").LocalPlayer

plr.Idled:Connect(function()
    task.wait(1)
    vu:CaptureController()
    vu:ClickButton2(Vector2.new(math.random(0, 1000), math.random(0, 700)))
end)

print("Running: AntiAFK")
