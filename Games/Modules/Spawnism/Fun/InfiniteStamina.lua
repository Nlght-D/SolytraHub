local module = {}
local player = game.Player.LocalPlayer

function module.SetInfiniteStamina()
    local character = player.Character
    local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
    if HumanoidRootPart:GetAttribute("MaxStamina") then
        HumanoidRootPart:SetAttribute("MaxStamina", 10^25)
        HumanoidRootPart:SetAttribute("Stamina", 10^25)
    end
end

return module