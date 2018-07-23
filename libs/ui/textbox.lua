local class = require "libs.middleclass"
local utf8 = require("utf8")

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
    self.text = self.text .. t
end

function Textbox:keypressed(key)
    if key == "backspace" then
        print "backspace"
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(self.text, -1)

        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            self.text = string.sub(self.text, 1, byteoffset - 1)
        end
    end
end
