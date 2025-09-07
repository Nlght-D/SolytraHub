local Places = {
    [102719677723924] = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/KSPE.lua"
}

local PlaceId = game.PlaceId
if Places[PlaceId] then
    if loadstring then
        pcall(function()
            loadstring(game:HttpGet(Places[PlaceId]))()
        end)  if not success then
    else
        warn("Cant Use Loadstring in this game")
    end
end
