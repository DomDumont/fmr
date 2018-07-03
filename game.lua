local class = require "libs.middleclass"

local Game = class("Game")

function Game:initialize()
    print "Game:initialize()"
    self.nb_races = 0
end

function Game:start()
    self.nb_races = 0
end

TheGame = Game:new()
