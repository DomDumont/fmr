-- Menu Scene

local class = require "libs.middleclass"
require "libs.scene"

local MenuScene = class("MenuScene", Scene)
local C_ROW_1_Y = 200
local C_ROW_2_Y = 300
function MenuScene:initialize(sweetness)
end

function MenuScene:on_scene_enter()
    print("MenuScene on_scene_enter")

    self.playButton = TheGUI:create_button("Play", 512 - 75, 700, 150, 50)
    self.playButton.onClicked = function()
        print("pouet pouet 2")
        TheSceneManager:push_scene(require("scenes/gamescene"))
    end

    TheGUI:create_label("How many races in session ? ", 0, C_ROW_1_Y, 250, 25)
    TheGUI:create_textbox("Textbox  10", 350, C_ROW_1_Y, 250, 25)
    TheGUI:create_label("How many players ? ", 0, C_ROW_2_Y, 250, 25)
    TheGUI:create_textbox("Textbox  2", 350, C_ROW_2_Y, 250, 25)
end

function MenuScene:draw()
    love.graphics.clear(0.1, 0.2, 0.25)
    TheGUI:draw()
end
return MenuScene:new()
