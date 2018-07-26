local class = require "libs.middleclass"
local BASE = (...):match("(.-)[^%.]+$")
require(BASE .. "button")
require(BASE .. "label")
require(BASE .. "textbox")

local GUI = class("GUI")

function GUI:initialize()
    print "GUI:initialize()"
    self.widgets = {}
end

function GUI:update(dt)
    for k in pairs(self.widgets) do
        self.widgets[k]:check_collision()
    end
end

function GUI:draw()
    love.graphics.push("all")

    for k in pairs(self.widgets) do
        self.widgets[k]:draw()
    end

    love.graphics.pop()
end

function GUI:textinput(t)
    for k in pairs(self.widgets) do
        if (self.widgets[k]:has_focus() == true) then
            self.widgets[k]:textinput(t)
        end
    end
end

function GUI:keypressed(key)
    for k in pairs(self.widgets) do
        if (self.widgets[k]:has_focus() == true) then
            self.widgets[k]:keypressed(key)
        end
    end
end

function GUI:create_button(text, x, y, w, h)
    local tempButton = Button:new()
    tempButton:set_text(text)
    tempButton:set_position(x, y)
    tempButton:set_size(w, h)
    GUI.add_widget(self, tempButton)
    return tempButton
end

function GUI:create_label(text, x, y, w, h)
    local tempLabel = Label:new()
    tempLabel:set_text(text)
    tempLabel:set_position(x, y)
    tempLabel:set_size(w, h)
    GUI.add_widget(self, tempLabel)
    return tempLabel
end

function GUI:create_textbox(text, x, y, w, h)
    local tempTextbox = Textbox:new()
    tempTextbox:set_text(text)
    tempTextbox:set_position(x, y)
    tempTextbox:set_size(w, h)
    GUI.add_widget(self, tempTextbox)
    return tempTextbox
end

function GUI:clear()
    for k in pairs(self.widgets) do
        self.widgets[k] = nil
    end
    self.widgets = {}
end

function GUI:add_widget(new_widget)
    if #self.widgets == 0 then
        new_widget:set_focus()
    end
    table.insert(self.widgets, new_widget)
end
TheGUI = GUI:new()
