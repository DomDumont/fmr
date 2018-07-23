local class = require "libs.middleclass"
require "libs.ui.widget"
Label = class("Label", Widget)

function Label:initialize()
    self.text = "Label"
end

function Label:set_text(new_value)
    self.text = new_value
end

function Label:draw()
    Widget.draw(self)
    love.graphics.printf(self.text, self.x, self.y, self.width)
end
