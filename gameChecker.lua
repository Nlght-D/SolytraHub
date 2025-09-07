local Places = {
    102719677723924 = ""
}
local PlaceId = game.PlaceId
if Places[PlaceId] then
    loadstring(game:HttpGet(places[PlaceId]))
end