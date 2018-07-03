local class = require "libs.middleclass"

local Game = class("Game")

function Game:initialize()
    print "Game:initialize()"
    self.nb_races = 0
end

function Game:start()
    print "Game:start()"
    for i = 1, self.nb_races do
        self:start_race(i)
        self:compute_score_for_race(i)
    end

    self:compute_final_score()
end

function Game:start_race(num_race)
    print("Game:start_race(" .. num_race .. ")")
end

function Game:compute_score_for_race(num_race)
    print("Game:compute_score_for_race(" .. num_race .. ")")
end

function Game:compute_final_score()
    print "Game:compute_final_score()"
end

TheGame = Game:new()
