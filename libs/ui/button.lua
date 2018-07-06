local class = require "libs.middleclass"
require "libs.ui.widget"

Button = class("Button", Widget)

function Button:initialize()
    self.text = "button"
    self.x = 0
    self.y = 0
    self.width = 0
    self.height = 0
    self.hasFocus = false
    self.isHit = false
    self.onGetFocus = nil
end

function Button:set_text(new_value)
    self.text = new_value
end

function Button:draw()
    love.graphics.push("all")
    if (self.hasFocus == true) then
        love.graphics.setColor(0.0, 1.0, 0.0)
    end
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, 4)
    font = love.graphics.getFont()
    local yAdjustementForText = (self.height - font:getHeight()) / 2
    love.graphics.printf(self.text, self.x, self.y + yAdjustementForText, self.width, "center")
    love.graphics.pop()
end
