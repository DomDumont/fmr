local class = require "libs.middleclass"

Widget = class("Widget")

function Widget:initialize()
    self.x = 0
    self.y = 0
    self.width = 0
    self.height = 0
    self.hasFocus = false
    self.isHit = false
    self.onGetFocus = nil
end

function Widget:set_position(x, y)
    self.x, self.y = x, y
end

function Widget:set_size(w, h)
    self.width = w
    self.height = h
end

function Widget:check_collision()
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

function Widget:has_focus()
    return self.hasFocus
end
function Widget:draw()
    if (self.hasFocus == true) then
        love.graphics.setColor(0.0, 1.0, 0.0)
    end
end
