local class = require "libs.middleclass"
require "libs.ui.widget"

Button = class("Button", Widget)

function Button:initialize()
    Widget.initialize(self)
    self.text = "button"
end

function Button:set_text(new_value)
    self.text = new_value
end

function Button:draw()
    love.graphics.push("all")
    Widget.draw(self)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, 4)
    font = love.graphics.getFont()
    local yAdjustementForText = (self.height - font:getHeight()) / 2
    love.graphics.printf(self.text, self.x, self.y + yAdjustementForText, self.width, "center")
    love.graphics.pop()
end
