local GLRL = {}
local Player = game.Players.LocalPlayer
local Character = Player.Character
-- -42, 1024, 145
function GLRL.TeleportToEnd()
    if not Character then
        return
    end

    local torso = Character.Torso
    local ts = game:GetService("TweenService")
    local info = TweenInfo.new(1, Enum.EasingStyle.Linear)
    local goal = {CFrame = CFrame.new(-42, 1024, 145)}
    local tween = ts:Create(torso, info, goal)
    tween:Play()

   --[[ torso.Anchored = true
            torso.Position = Vector3.new(-42, 1024, 145)
    torso.AssemblyLinearVelocity = Vector3.zero
    task.delay(1, function()
        torso.Anchored = false
    end)]]
end

function GLRL.GodMode(Boolean)
    if not Character then
        return
    end

    local torso = Character.Torso
    
    if Boolean then
        torso.Position.Position = torso.Position.Position + Vector3.new(0, 100, 0)
        return
    end 
    
    torso.Position.Position = torso.Position.Position - Vector3.new(0, 10, 0)
end

return GLRL