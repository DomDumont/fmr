require("utils")
require("game")

math.randomseed(os.time())

local nb_races = get_number_within_limits("How many races in the season ?", 1, 10, 2)
local nbPlayers = get_number_within_limits("How many human players ?", 3, 6, 3)

io.write("Number of races = ", nb_races, "!\n")
io.write("Number of players = ", nbPlayers, "!\n")

for i = 1, nbPlayers do
    TheGame:add_player()
    TheGame.players[i].name = get_name_or_generate_a_random_one("name for player " .. tostring(i))
    io.write("type")
    local tempInput = io.read()
    TheGame.players[i].type = tempInput
end

TheGame.nb_races = nb_races
TheGame:setup()
TheGame:start()
