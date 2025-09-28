local module = {}
local player = game.Players.LocalPlayer

function module.SetInfiniteStamina()
    local character = player.Character
    local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
    if HumanoidRootPart:GetAttribute("MaxStamina") ~= nil then
        HumanoidRootPart:SetAttribute("MaxStamina", 20^45)
        HumanoidRootPart:SetAttribute("Stamina", 20^45)
    end
end

return module