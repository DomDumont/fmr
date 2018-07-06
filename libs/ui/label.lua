local class = require "libs.middleclass"
require "libs.ui.widget"
Label = class("Label", Widget)

function Label:initialize()
    self.name = ""
end

function Label:set_text(new_value)
    self.text = new_value
end

function Label:draw()
    if (self.hasFocus == true) then
        love.graphics.setColor(0.0, 1.0, 0.0)
    end
    love.graphics.printf(self.text, self.x, self.y, self.width)
end
