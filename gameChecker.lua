local Places = {
    [9391468976] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/main/Games/KSPR.lua",
}

local pid = game.PlaceId

local url = Places[pid]
if url then
    local src = game:HttpGet(url)
    local f = loadstring(src)
    if f then
        local ok, err = pcall(f)
        if not ok then
            warn("Erro dentro do script:", err)
        end
    else
        warn("loadstring falhou, código inválido")
    end
else
    warn("Nenhum script configurado para este PlaceId.")
end