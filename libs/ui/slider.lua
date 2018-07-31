local class = require "libs.middleclass"
require "libs.ui.widget"
Slider = class("Slider", Widget)

function Slider:initialize()
    Widget.initialize(self)
    self.text = "Slider"
    self.minValue = 0
    self.maxValue = 100
    self.value = 0
    self.nbTicks = 11
    self.cursorX = self.x + 10
    self.cursorY = self.y - 10
    self.cursorW = 10
    self.cursorH = self.height + 10
    self.dragging = false
    self.stepWidth = 0.0
    self.stepValue = 10.0
end

function Slider:set_position(x, y)
    Widget.set_position(self, x, y)
    self.cursorX = self.x + 10
    self.cursorY = self.y - 10
end

function Slider:set_size(w, h)
    Widget.set_size(self, w, h)
    self.cursorH = self.height + 10
    self.stepWidth = self.width / (self.nbTicks - 1)
end

function Slider:set_nb_ticks(new_value)
    self.nbTicks = new_value + 1
    self.stepWidth = self.width / (self.nbTicks - 1)
    self.stepValue = (self.maxValue - self.minValue) / (self.nbTicks - 1)
end

function Slider:set_min_value(new_value)
    self.minValue = new_value
    self.stepValue = (self.maxValue - self.minValue) / (self.nbTicks - 1)
end

function Slider:set_max_value(new_value)
    self.maxValue = new_value
    self.stepValue = (self.maxValue - self.minValue) / (self.nbTicks - 1)
end

function Slider:set_value(new_value)
    self.cursorX = self.x + new_value * self.stepWidth
    self.value = self.minValue + new_value * self.stepValue
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
    -- cursor
    love.graphics.rectangle("fill", self.cursorX, self.cursorY, self.cursorW, self.cursorH, 1)

    love.graphics.printf(self.value, self.x, self.y - 25, self.width)

    local titi = self.x
    for toto = 1, (self.nbTicks), 1 do
        love.graphics.line(titi, self.y - 5, titi, self.y + 15)
        titi = titi + self.stepWidth
    end
    love.graphics.pop()
end

---[[
function Slider:check_collision()
    -- Widget.check_collision(self)

    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()

    if not love.mouse.isDown(1) then
        -- TODO snap
        self.dragging = false
    end

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
        --self.cursorX = mouseX - (self.cursorW / 2)

        local deltaX = mouseX - self.x
        local nbSteps = math.floor(deltaX / self.stepWidth)
        print(nbSteps)
        self.value = self.minValue + nbSteps * self.stepValue
        self.cursorX = self.x + (nbSteps * self.stepWidth)

        if (self.cursorX < self.x) then
            self.cursorX = self.x
            self.value = self.minValue
        end
        if (self.cursorX > self.x + self.width) then
            self.cursorX = self.x + self.width
            self.value = self.maxValue
        end
    end
end
---]]
