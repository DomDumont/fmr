local class = require "libs.middleclass"
require "libs.ui.widget"
Slider = class("Slider", Widget)

function Slider:initialize()
    Widget.initialize(self)
    self.text = "Slider"
    self.min = 0
    self.max = 100
    self.value = 30
    self.cursorX = self.x + 10
    self.cursorY = self.y - 10
    self.cursorW = 40
    self.cursorH = self.height + 10
    self.dragging = false
end

function Slider:set_position(x, y)
    Widget.set_position(self, x, y)
    self.cursorX = self.x + 10
    self.cursorY = self.y - 10
end

function Slider:set_size(w, h)
    Widget.set_size(self, w, h)
    self.cursorH = self.height + 10
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
    love.graphics.rectangle("fill", self.cursorX, self.cursorY, self.cursorW, self.cursorH, 1)
    love.graphics.pop()
end

---[[
function Slider:check_collision()
    -- Widget.check_collision(self)

    if not love.mouse.isDown(1) then
        self.dragging = false
    end

    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    if
        (mouseX > self.cursorX and mouseX < self.cursorX + self.cursorW and mouseY > self.cursorY and
            mouseY < self.cursorY + self.cursorH)
     then
        if love.mouse.isDown(1) then
            self.dragging = true
            if (self.hasFocus == false) then
                TheGUI:clear_focus()
                self:set_focus(true)
            end
        end
    end

    if (self.dragging) then
        self.cursorX = love.mouse.getX() - (self.cursorW / 2)
        if (self.cursorX < self.x) then
            self.cursorX = self.x
        end
        if (self.cursorX > self.x + self.width) then
            self.cursorX = self.x + self.width
        end
    end
end
---]]
