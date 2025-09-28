local module = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SCP = workspace:WaitForChild("SCP-173")
local Hitbox = SCP:WaitForChild("Head"):WaitForChild("Hitbox")

function module.Toggle(Value)
    if Value then
        Hitbox.Parent = ReplicatedStorage
    else
        Hitbox.CFrame = SCP:WaitForChild("Head").CFrame
        Hitbox.Parent = SCP:WaitForChild("Head")
    end
end

return module