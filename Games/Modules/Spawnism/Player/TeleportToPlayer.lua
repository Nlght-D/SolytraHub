local module = {}
local Player = game.Players.LocalPlayer

function module.Teleport(SelectedPlayer)
    local VictimCharacter = SelectedPlayer.Character
    local Character = Player.Character

    if Character and Character:FindFirstChild("HumanoidRootPart") then
        Character:MoveTo(VictimCharacter:WaitForChild("HumanoidRootPart").Position)
    end
end

return module