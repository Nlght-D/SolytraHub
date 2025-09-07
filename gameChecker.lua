local Places = {
    102719677723924 = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/KSPE.lua?token=GHSAT0AAAAAADJJLAFD4GL27MRNMJSX73NM2F55JGQ"
}
local PlaceId = game.PlaceId 
if Places[PlaceId] then
    print("tentando carregar")
    loadstring(game:HttpGet(Places[PlaceId]))
end