local class = require "libs.middleclass"
require "libs.ui.widget"
Slider = class("Slider", Widget)

function Slider:initialize()
    Widget.initialize(self)
    self.text = "Slider"
    self.min = 0
    self.max = 100
    self.value = 30
end

function Slider:set_text(new_value)
    self.text = new_value
end

function Slider:draw()
    love.graphics.push("all")
    Widget.draw(self)
    -- todo debug only
    -- love.graphics.setColor(1.0, 1.0, 0.0)
    love.graphics.rectangle("fill", self.x, self.y, self.width, 10, 1)
    love.graphics.pop()
end

---[[
function Slider:check_collision()
    Widget.check_collision(self)
end
---]]
