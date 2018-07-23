local class = require "libs.middleclass"
require "libs.ui.widget"

Textbox = class("Textbox", Widget)

function Textbox:initialize()
    Widget.initialize(self)
    self.text = "textbox"
end

function Textbox:set_text(new_value)
    self.text = new_value
end

function Textbox:draw()
    love.graphics.push("all")
    Widget.draw(self)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, 1)
    love.graphics.printf(self.text, self.x, self.y, self.width)
    love.graphics.pop()
end

function Textbox:textinput(t)
    if (self.hasFocus == true) then
        self.text = self.text .. t
    end
end
