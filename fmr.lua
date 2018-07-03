require("utils")
require("game")

local nb_races = get_number_within_limits("How many races in the season ?", 1, 10, 3)
local nbPlayers = get_number_within_limits("How many human players ?", 3, 6, 3)

io.write("Number of races = ", nb_races, "!\n")
io.write("Number of players = ", nbPlayers, "!\n")

TheGame.nb_races = nb_races
TheGame:start()
