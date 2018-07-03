require("utils")
require("game")

local nbRaces = get_number_within_limits("How many races in the season ?", 1, 10, 3)
local nbPlayers = get_number_within_limits("How many human players ?", 3, 6, 3)

io.write("Number of races = ", nbRaces, "!\n")
io.write("Number of players = ", nbPlayers, "!\n")
