local class = require "libs.middleclass"
require "consts"

Player = class("Player")

function Player:initialize()
    print "Player:initialize()"
    self.name = ""
    self.first_car = 0
    self.second_car = 0
    self.is_human = false
    self.score = 0
end

function Player:__tostring()
    return "<Player: " .. self.name .. " score = " .. tostring(self.score) .. " " .. tostring(self.is_human) .. ">"
end

function Player:update_score()
    -- print("Player:update_score()")
    self.score = self.score + score[self.first_car] + score[self.second_car]
    -- print(self.score)
end
