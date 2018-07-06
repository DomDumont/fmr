local utf8 = require("utf8")

function love.load(args)
    text = "Type away! -- "

    -- enable key repeat so backspace can be held down to trigger love.keypressed multiple times.
    love.keyboard.setKeyRepeat(true)
end

function love.textinput(t)
    text = text .. t
end

function love.keypressed(key)
    if key == "backspace" then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(text, -1)

        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            text = string.sub(text, 1, byteoffset - 1)
        end
    end
end

function love.draw()
    love.graphics.printf(text, 0, 0, love.graphics.getWidth())
end