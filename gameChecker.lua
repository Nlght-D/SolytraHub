local Places = {
    [102719677723924] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/KSPR.lua",
    [125009265613167] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/InkGame.lua"
}

local PlaceId = game.PlaceId
warn(PlaceId)
if Places[PlaceId] then
    if loadstring then
        local success, err = pcall(function()
            local scriptContent = game:HttpGet(Places[PlaceId])
            local func = loadstring(scriptContent)
            if func then
                func()
            else
                warn("Erro ao compilar o script.")
            end
        end)
    end
end
