local class = require "libs.middleclass"

Player = class("Player")

function Player:initialize()
    self.name = ""
    self.first_car = -1
    self.second_car = -1
end

function Player:__tostring()
    return "<Player: " .. self.name .. ">"
end
