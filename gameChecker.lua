local Places = {
    [102719677723924] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/KSPE.lua"
}

local PlaceId = game.PlaceId

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
        if not success then
            warn("Erro ao executar o script:", err)
        else
            print("Script carregado e executado com sucesso.")
        end
    else
        warn("loadstring não está disponível neste ambiente.")
    end
else
    warn("ID do lugar não encontrado na tabela.")
end
