local class = require "libs.middleclass"
require "player"
require "card"
require "deck"

local Game = class("Game")

function Game:initialize()
    print "Game:initialize()"
    self.players = {}
    self.nb_races = 0

    -- create deck
    self.deck = Deck:new()
    print(self.deck)
    self.deck:shuffle()
    print(self.deck)
end

function Game:setup()
    print "Game:setup()"
    self:shuffle_players()
    self:distribute_cards()
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
    self:dump_players()
    local first_player = self:find_first_player()
    ask_player_to_choose_a_card(first_player)
    -- choose a card
    -- play card action
    -- pick a card
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
    self:add_false_players()
    for i = 1, 6 do
        self.players[i].first_car = i
        self.players[i].second_car = 13 - i
    end
end

function Game:add_false_players()
    for i = #self.players, 6 do
        self:add_player()
    end
end

function Game:add_player()
    table.insert(self.players, Player:new())
end

function Game:distribute_cards()
    for i = 1, 5 do
        for j = 1, 6 do
            if (self.players[j].type ~= "off") then
                self.players[j]:receive_card(self.deck:draw_card())
            end
        end
    end
end

function Game:find_first_player()
    for i = 1, 6 do
        if ((self.players[i].first_car == 1) or (self.players[i].second_car == 1)) then
            return self.players[i]
        end
    end
end
TheGame = Game:new()
