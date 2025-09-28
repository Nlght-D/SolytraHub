local module = {}
module.Places = {
    ["Church"] = -50, 17, 133,
    ["Spawndonalds"] = 125, 16, 103,
    ["Spawn Games"] = 146, 17, 192,
    ["Parking"] = 33, 2, 230,
    ["Dreamy House"] = 202, 4, 410,
    ["SCP-173 [Containment]"] = -169, -46, 26,
    ["SCP-173 [Outside]"] = -202, -46, 47,
    ["Abyss"] = 511, -396, -355,
    ["Spawn"] = 28, 16, 214
}
local player = game.Players.LocalPlayer

function module.Teleport(Place)
    if not module.Places[Place] then
        return
    end
    local Character = player.Character
    Character:MoveTo(module.Places[Place])
end

return module