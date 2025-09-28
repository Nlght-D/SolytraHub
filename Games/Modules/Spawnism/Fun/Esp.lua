local module = {}
module.Enabled = false

local Players = game:GetService("Players")

function module.Run()
    module.Enabled = not module.Enabled
    for _, Player in ipairs(Players:GetPlayers()) do
        if Player ~= Players.LocalPlayer then
            local Character = Player.Character
            if Character then
                local Highlight = Character:FindFirstChildOfClass("Highlight")

                if module.Enabled then
                    if Highlight then
                        Highlight:Destroy()
                    end
                else
                    if not Highlight then
                        Highlight = Instance.new("Highlight")
                        Highlight.Parent = Character
                    end
                end
            end
        end
    end
end

return module
