local GLRL = {}
local Player = game.Players.LocalPlayer
local Character = Player.Character
-- -42, 1024, 145
function GLRL.Finish()
    if Character then
        local torso = Character.Torso
            torso.Position = Vector3.new(-42, 1024, 145)
    end
end

return GLRL