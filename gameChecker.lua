local Places = {
    102719677723924 = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/KSPE.lua"
}
local PlaceId = game.PlaceId 
if Places[PlaceId] then
    print("tentando carregar")
    loadstring(game:HttpGet(Places[PlaceId]))
end