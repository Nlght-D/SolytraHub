local module = {}
local Player = game.Players.LocalPlayer

function module.Teleport(SelectedPlayer)
    local VictimCharacter = SelectedPlayer.Character
    local Character = Player.Character

    Character:MoveTo(VictimCharacter:WaitForChild("HumanoidRootPart").Position)
end

return module