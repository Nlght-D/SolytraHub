local AutoAim = {}
AutoAim.Enabled = false
AutoAim.Sensitivity = 0.3
AutoAim.MaxDistance = 100
AutoAim.FOV = 70
AutoAim.Smoothness = 0.2

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

function AutoAim.SmoothCameraLook(camera, targetPosition, deltaTime)
    local currentLook = camera.CFrame.LookVector
    local desiredLook = (targetPosition - camera.CFrame.Position).Unit
    
    local smoothedLook = currentLook:Lerp(desiredLook, AutoAim.Smoothness * deltaTime * 60)
    
    return CFrame.lookAt(camera.CFrame.Position, camera.CFrame.Position + smoothedLook)
end

function AutoAim.AimCameraAtTarget()
    if not AutoAim.Enabled then return end
    
    local localPlayer = game:GetService("Players").LocalPlayer
    local camera = workspace.CurrentCamera
    if not localPlayer or not camera then return end
    
    local targetPlayer = AutoAim.FindTargetInFOV(localPlayer)
    if targetPlayer and targetPlayer.Character then
        local head = targetPlayer.Character:FindFirstChild("Head")
        if not head then return end
        
        local newCFrame = AutoAim.SmoothCameraLook(camera, head.Position, game:GetService("RunService").RenderStepped:Wait())
        camera.CFrame = newCFrame
    end
end

function AutoAim.ToggleLockOn(Boolean)
    AutoAim.Enabled = Boolean
    if Boolean then
        player.CameraMode = Enum.CameraMode.LockFirstPerson
    else
        player.CameraMode = Enum.CameraMode.Classic; player.CameraMinZoomDistance = 10
        task.wait(1)
        player.CameraMinZoomDistance = .5
    end
end

function AutomAim.ChangeMaxDistance(Value)
    AutoAim.MaxDistance = Value
end

game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
    AutoAim.AimCameraAtTarget(deltaTime)
end)

return AutoAim