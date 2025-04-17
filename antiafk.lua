local vu = game:GetService("VirtualUser")
local player = game:GetService("Players").LocalPlayer

player.Idled:Connect(function()
    local x = math.random(0, 1000)
    local y = math.random(0, 700)
    vu:Button1Down(Vector2.new(x, y), workspace.CurrentCamera.CFrame)
    task.wait(0.2)
    vu:Button1Up(Vector2.new(x, y), workspace.CurrentCamera.CFrame)
end)
