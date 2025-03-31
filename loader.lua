local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/Shadow_officials1/Shadow/main/GameList.lua"))()

for PlaceID, Execute in pairs(Games) do
if PlaceID == game.PlaceId then
loadstring(game:HttpGet(Execute))()
end
end

