local class = require "libs.middleclass"
local BASE = (...):match("(.-)[^%.]+$")
require(BASE .. "button")

local GUI = class("GUI")

function GUI:initialize()
    print "GUI:initialize()"
    self.widgets = {}
end

function GUI:draw()
    love.graphics.push("all")

    for k in pairs(self.widgets) do
        -- love.graphics.rectangle("line", 400, 400 + i * 30, 100, 30, 4)
        -- love.graphics.printf(self.theWidgets[i], 400, 400 + i * 30, 100, "center")
        self.widgets[k]:check_collision()
        self.widgets[k]:draw()
    end

    love.graphics.pop()
end

function GUI:create_button(text, x, y, w, h)
    local tempButton = Button:new()
    tempButton:set_text(text)
    tempButton:set_position(x, y)
    tempButton:set_size(w, h)
    table.insert(self.widgets, tempButton)
    return tempButton
end

TheGUI = GUI:new()
