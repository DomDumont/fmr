require("libs.ui.gui")
require("libs.scene_manager")

-- zerobrane debugging
if arg[#arg] == "-debug" then
    require("mobdebug").start()
end

function love.load(args)
    -- enable key repeat so backspace can be held down to trigger love.keypressed multiple times.
    love.keyboard.setKeyRepeat(true)

    TheGUI:create_button("Play", 0, 0, 150, 50)
    TheGUI:create_label("How many races in session ? ", 0, 200, 250, 25)
    TheGUI:create_textbox("Textbox  10", 349, 233, 250, 25)
    TheGUI:create_label("How many players ? ", 0, 300, 250, 25)
    TheGUI:create_textbox("Textbox  2", 300, 300, 250, 25)

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
