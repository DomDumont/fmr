local class = require "libs.middleclass"
require "consts"

Player = class("Player")

function Player:initialize()
    print "Player:initialize()"
    self.name = ""
    self.first_car = 0
    self.second_car = 0
    self.type = "off" -- off, computer or human
    self.score = 0
    self.cards = {}
end

function Player:__tostring()
    local temp_string =
        "< " ..
        self.name ..
            " car1=" ..
                tostring(self.first_car) ..
                    "car2=" ..
                        tostring(self.second_car) .. " score = " .. tostring(self.score) .. " " .. self.type .. ">\n"

    temp_string = temp_string .. "\n---- CARDS ----\n"
    for i = 1, #self.cards do
        temp_string = temp_string .. tostring(i) .. "> " .. self.cards[i].name .. "\n"
    end

    return temp_string
end

function Player:update_score()
    -- print("Player:update_score()")
    self.score = self.score + score[self.first_car] + score[self.second_car]
    -- print(self.score)
end

function Player:receive_card(new_card)
    print("receive_card " .. new_card.name)
    table.insert(self.cards, new_card)
end
