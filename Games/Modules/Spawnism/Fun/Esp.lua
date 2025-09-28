local module = {}
module.Enabled = false

local Players = game:GetService("Players")

local function handleCharacter(Character)
    if not Character then return end

    local Highlight = Character:FindFirstChildOfClass("Highlight")

    if module.Enabled then
        if not Highlight then
            Highlight = Instance.new("Highlight")
            Highlight.Name = "AutoHighlight"
            Highlight.FillColor = Color3.fromRGB(255, 255, 0)
            Highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
            Highlight.Parent = Character
        end
    else
        if Highlight then
            Highlight:Destroy()
        end
    end
end

local function setupPlayer(Player)
    if Player == Players.LocalPlayer then return end

    if Player.Character then
        handleCharacter(Player.Character)
    end

    Player.CharacterAdded:Connect(function(Character)
        handleCharacter(Character)
    end)
end

for _, Player in ipairs(Players:GetPlayers()) do
    setupPlayer(Player)
end

Players.PlayerAdded:Connect(setupPlayer)

function module.Toggle(Boolean)
    module.Enabled = Boolean

    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer and Player.Character then
            handleCharacter(Player.Character)
        end
    end
end

return module
