local Places = {
    102719677723924 = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/KSPE.lua"
}

local PlaceId = game.PlaceId

if Places[PlaceId] then
    if loadstring then
        local success, err = pcall(function()
            loadstring(game:HttpGet(Places[PlaceId]))()
        end)
        if not success then
            warn("Erro ao executar o script:", err)
        else
            print("Loaded")
        end
    else
        warn("loadstring não está disponível neste ambiente")
    end
end
