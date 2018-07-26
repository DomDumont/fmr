local class = require "libs.middleclass"
require "libs.ui.widget"
Label = class("Label", Widget)

function Label:initialize()
    Widget.initialize(self)
    self.text = "Label"
end

function Label:set_text(new_value)
    self.text = new_value
end

function Label:draw()
    love.graphics.push("all")
    Widget.draw(self)
    -- todo debug only 
    -- love.graphics.rectangle("line", self.x, self.y, self.width, self.height, 1)
    love.graphics.printf(self.text, self.x, self.y, self.width)
    love.graphics.pop()
end
