local module = {}
module.Enabled = false
module.Target = nil
module.Radius = 10
module.Speed = 2

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local angle = 0 

function module.Toggle(Value, targetPlayer)
    if Value then
        if not targetPlayer or not targetPlayer.Character then return end
        if not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

        module.Target = targetPlayer
        module.Enabled = true
    else
        module.Enabled = false
        module.Target = nil
    end
end

RunService.RenderStepped:Connect(function(dt)
    if module.Enabled and module.Target and module.Target.Character then
        local targetHRP = module.Target.Character:FindFirstChild("HumanoidRootPart")
        local myChar = LocalPlayer.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")

        if targetHRP and myHRP then
            angle = angle + dt * module.Speed 

            local offset = Vector3.new(
                math.cos(angle) * module.Radius,
                0,
                math.sin(angle) * module.Radius
            )

            myHRP.CFrame = CFrame.new(targetHRP.Position + offset, targetHRP.Position)
        end
    end
end)

return module
