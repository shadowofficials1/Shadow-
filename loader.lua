local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/shadowofficials1/Shadow-/refs/heads/main/Game%20List.lua"))()

for PlaceID, Execute in pairs(Games) do
if PlaceID == game.PlaceId then
loadstring(game:HttpGet(Execute))()
end
end

