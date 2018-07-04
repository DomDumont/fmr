local class = require "libs.middleclass"
require "consts"

Player = class("Player")

function Player:initialize()
    print "Player:initialize()"
    self.name = ""
    self.first_car = 0
    self.second_car = 0
    self.type = "off"
    self.score = 0
end

function Player:__tostring()
    return "< " ..
        self.name ..
            "car1=" ..
                tostring(self.first_car) ..
                    "car2=" ..
                        tostring(self.second_car) .. " score = " .. tostring(self.score) .. " " .. self.type .. ">"
end

function Player:update_score()
    -- print("Player:update_score()")
    self.score = self.score + score[self.first_car] + score[self.second_car]
    -- print(self.score)
end
