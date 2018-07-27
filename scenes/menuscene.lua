-- Menu Scene

local class = require "libs.middleclass"
require "libs.scene"

local MenuScene = class("MenuScene", Scene)
local C_ROW_1_Y = 200
local C_ROW_2_Y = 300

function MenuScene:initialize(sweetness)
end

function MenuScene:on_scene_enter()
    TheGUI:clear()

    TheGUI:create_label("How many races in session ? ", 200, C_ROW_1_Y, 250, 25)
    TheGUI:create_textbox("Textbox  10", 450, C_ROW_1_Y, 250, 25)
    TheGUI:create_slider("Slider", 200, 250, 250, 25)
    TheGUI:create_label("How many players ? ", 200, C_ROW_2_Y, 250, 25)
    TheGUI:create_textbox("Textbox  2", 450, C_ROW_2_Y, 250, 25)
    TheGUI:create_slider("Slider", 200, 350, 250, 25)

    self.playButton = TheGUI:create_button("Play", 512 - 75, 700, 150, 50)
    self.playButton.onClicked = function()
        print("pouet pouet 2")
        TheSceneManager:push_scene(require("scenes/gamescene"))
    end
end

function MenuScene:draw()
    Scene.draw(self) -- call base method
end

function MenuScene:keypressed(key)
    if key == "escape" then
        love.event.push("quit")
    end
end

return MenuScene:new()
