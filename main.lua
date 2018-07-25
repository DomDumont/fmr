require("libs.ui.gui")
require("libs.scene_manager")

-- zerobrane debugging
if arg[#arg] == "-debug" then
    require("mobdebug").start()
end

function love.load(args)
    -- enable key repeat so backspace can be held down to trigger love.keypressed multiple times.
    love.keyboard.setKeyRepeat(true)

    TheSceneManager:push_scene(require("scenes/menuscene"))
end

function love.textinput(t)
    TheGUI:textinput(t)
    -- text = text .. t
end

function love.keypressed(key)
    TheGUI:keypressed(key)
    TheSceneManager:keypressed(key)

    if key == "f" then
        local fullscreen, fstype = love.window.getFullscreen()
        if fullscreen == false then
            love.window.setFullscreen(true, "desktop")
        else
            love.window.setFullscreen(false)
        end
    end
end

function love.draw()
    -- love.graphics.printf(text, 0, 0, love.graphics.getWidth())
    TheGUI:draw()
end
