local Places = {
    [102719677723924] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/main/Games/KSPR.lua",
    [125009265613167] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/main/Games/InkGame.lua"
}

local pid = game.PlaceId
warn("PlaceId atual:", pid)

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
