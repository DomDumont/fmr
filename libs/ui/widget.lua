local class = require "libs.middleclass"

Widget = class("Widget")

function Widget:initialize()
    self.x = 0
    self.y = 0
    self.width = 0
    self.height = 0
    self.hasFocus = false
    self.isHover = false
    self.isHit = false
    self.onIsHover = nil
    self.onGetFocus = nil
    self.thename = "unnamed"
    self.tabOrder = -1
end

function Widget:set_tab_order(value)
    self.tabOrder = value
end
function Widget:set_position(x, y)
    self.x, self.y = x, y
end

function Widget:set_size(w, h)
    self.width = w
    self.height = h
end

function Widget:check_collision()
    local mouseX = love.mouse.getX()
    local mouseY = love.mouse.getY()
    if (mouseX > self.x and mouseX < self.x + self.width and mouseY > self.y and mouseY < self.y + self.height) then
        if (self.isHover == false) then
            self.isHover = true
            if (self.onIsHover ~= nil) then
                self.onIsHover()
            end
        end

        if love.mouse.isDown(1) then
            if (self.hasFocus == false) then
                TheGUI:clear_focus()
                self:set_focus(true)
            end

            if (self.onClicked ~= nil and self.isHit == false) then
                self.isHit = true
                self.onClicked()
            end
        else
            self.isHit = false
        end
    else
        self.isHover = false
    end
end

function Widget:set_focus(value)
    print("set_focus on " .. self.thename)
    self.hasFocus = value
end

function Widget:has_focus()
    return self.hasFocus
end
function Widget:draw()
    if (self.isHover == true) then
        love.graphics.setColor(0.0, 0.0, 1.0)
    elseif (self.hasFocus == true) then
        love.graphics.setColor(0.0, 1.0, 0.0)
    end
end

function Widget:textinput(t)
end

function Widget:keypressed(key)
    print("base keypressed " .. key)
end
