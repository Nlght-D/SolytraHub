local module = {}
module.Places = {
    ["Church"] = Vector3.new(-50, 17, 133),
    ["Spawndonalds"] = Vector3.new(125, 16, 103),
    ["Spawn Games"] = Vector3.new(146, 17, 192),
    ["Parking"] = Vector3.new(33, 2, 230),
    ["Dreamy House"] = Vector3.new(202, 4, 410),
    ["SCP-173 [Containment]"] = Vector3.new(-169, -46, 26),
    ["SCP-173 [Outside]"] = Vector3.new(-202, -46, 47),
    ["Abyss"] = Vector3.new(511, -396, -355),
    ["Spawn"] = Vector3.new(28, 16, 214)
}
module.SavedPosition = nil

local player = game.Players.LocalPlayer

function module.SavePosition()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        module.SavedPosition = character.HumanoidRootPart.Position
    end
end

function module.Teleport(Place)
    local position = module.Places[Place]
    if not position then return end

    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character:MoveTo(position)
    end
end

function module.BackToSavedPosition()
    local Character = player.Character
    if Character and Character:FindFirstChild("HumanoidRootPart") and module.SavedPosition then
        Character:MoveTo(module.SavedPosition)
    end
end

return module