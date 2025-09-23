local module = {}
local Players = game:game:GetService("Players")

function module.GetPlayers()
    local Table = {}
    for _, Player in ipairs(Players:GetPlayers()) do
        if not table.find(Table, Player.Name) then
            table.insert(Table, Player.Name)
        end
    end

    return Table
end

return module