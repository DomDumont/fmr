local class = require "libs.middleclass"
require "player"
require "card"
require "deck"

local Game = class("Game")

function Game:initialize()
    print "Game:initialize()"
    self.players = {}
    self.nb_races = 0
    for i = 1, 6 do
        self.players[i] = Player:new()
    end

    -- create deck
    self.deck = Deck:new()
    self.deck:shuffle()
    local testcard = self.deck:draw_card()
    print(testcard.name)
    testcard = self.deck:draw_card()
    if (testcard ~= nil) then
        print(testcard.name)
    end
end

function Game:setup()
    print "Game:setup()"
    self:shuffle_players()
    self:dump_players()
end
function Game:start()
    print "Game:start()"
    for i = 1, self.nb_races do
        self:start_race(i)
        self:compute_score_for_race(i)
    end

    self:dump_players()
end

function Game:start_race(num_race)
    print("Game:start_race(" .. num_race .. ")")
end

function Game:compute_score_for_race(num_race)
    print("Game:compute_score_for_race(" .. num_race .. ")")
    for i = 1, 6 do
        self.players[i]:update_score()
    end
end

function Game:dump_players()
    print("=== PLAYERS ===")
    for i = 1, 6 do
        print(self.players[i])
    end
end

function Game:shuffle_players()
    shuffle(self.players)
    for i = 1, 6 do
        self.players[i].first_car = i
        self.players[i].second_car = 13 - i
    end
end
TheGame = Game:new()
