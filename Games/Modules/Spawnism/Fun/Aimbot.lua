local AutoAim = {}
AutoAim.Enabled = false
AutoAim.MaxDistance = 50
AutoAim.FOV = 70

local player = game.Players.LocalPlayer
function AutoAim.FindTargetInFOV(localPlayer)
    if not localPlayer then return nil end
    
    local camera = workspace.CurrentCamera
    if not camera then return nil end
    
    local closestTarget = nil
    local closestAngle = math.rad(AutoAim.FOV / 2)
    local closestDistance = AutoAim.MaxDistance
    
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local head = player.Character:FindFirstChild("Head")
            
            if humanoid and humanoid.Health > 0 and head then
                local screenPoint = camera:WorldToViewportPoint(head.Position)
                local cameraDirection = camera.CFrame.LookVector
                local targetDirection = (head.Position - camera.CFrame.Position).Unit
                
                local angle = math.acos(cameraDirection:Dot(targetDirection))
                local distance = (camera.CFrame.Position - head.Position).Magnitude
                
                if angle <= closestAngle and distance < closestDistance then
                    closestAngle = angle
                    closestDistance = distance
                    closestTarget = player
                end
            end
        end
    end
    
    return closestTarget
end

function AutoAim.AimCameraAtTarget()
    if not AutoAim.Enabled then return end
    
    local localPlayer = game:GetService("Players").LocalPlayer
    local camera = workspace.CurrentCamera
    if not localPlayer or not camera then return end
    
    local targetPlayer = AutoAim.FindTargetInFOV(localPlayer)
    if targetPlayer and targetPlayer.Character then
        local torso = targetPlayer.Character:FindFirstChild("Torso")
        if not torso then return end
        
        local screenPoint, onScreen = camera:WorldToViewportPoint(torso.Position)
        mousemoveabs(screenPoint.X, screenPoint.Y)
    end
end

function AutoAim.ToggleLockOn(Boolean)
    AutoAim.Enabled = Boolean
end

function AutoAim.ChangeMaxDistance(NewDistance)
    AutoAim.MaxDistance = NewDistance
end

game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
    AutoAim.AimCameraAtTarget(deltaTime)
end)

return AutoAim