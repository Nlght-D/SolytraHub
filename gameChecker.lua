local Places = {
    [102719677723924] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/main/Games/KSPR.lua",
    [125009265613167] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/main/Games/InkGame.lua"
}

local pid = game.PlaceId
warn("PlaceId atual:", pid)

local url = Places[pid]
if url then
    local s, r = pcall(function()
        local src = game:HttpGet(url)
        local f = loadstring(src)
        if f then
            f()
        else
            warn("loadstring retornou nil.")
        end
    end)
    if not s then
        warn("Erro ao carregar:", r)
    end
else
    warn("Nenhum script configurado para este PlaceId.")
end
