local class = require "libs.middleclass"

Player = class("Player")

function Player:initialize()
    print "Player:initialize()"
    self.name = ""
    self.first_car = -1
    self.second_car = -1
    self.is_human = false
end

function Player:__tostring()
    return "<Player: " .. self.name .. tostring(self.is_human) .. ">"
end
