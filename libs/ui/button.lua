-- class table

-- local Button = {text = "button", x = 0, y = 0, width = 0, height = 0, hasFocus = false, isHit = false, onGetFocus = nil}

local class = require "libs.middleclass"

Button = class("Button")

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

function Button:check_collision()
    self.isHit = false

    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    if (mouseX > self.x and mouseX < self.x + self.width and mouseY > self.y and mouseY < self.y + self.height) then
        if (self.hasFocus == false) then
            self.hasFocus = true
            if (self.onGetFocus ~= nil) then
                self.onGetFocus()
            end
        end

        if love.mouse.isDown(1) then
            self.isHit = true
            if (self.onClicked ~= nil) then
                self.onClicked()
            end
        end
    else
        self.hasFocus = false
    end
end

function Button:set_position(x, y)
    self.x, self.y = x, y
end

function Button:set_size(w, h)
    self.width = w
    self.height = h
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
