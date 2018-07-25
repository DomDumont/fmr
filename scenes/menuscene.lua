-- Menu Scene

local class = require "libs.middleclass"
require "libs.scene"

local MenuScene = class("MenuScene", Scene)

function MenuScene:initialize(sweetness)
end

function MenuScene:on_scene_enter()
    print("MenuScene on_scene_enter")

    self.playButton = TheGUI:create_button("Play", 0, 0, 150, 50)
    self.playButton.onClicked = function()
        print("pouet pouet")
    end

    TheGUI:create_label("How many races in session ? ", 0, 200, 250, 25)
    TheGUI:create_textbox("Textbox  10", 349, 233, 250, 25)
    TheGUI:create_label("How many players ? ", 0, 300, 250, 25)
    TheGUI:create_textbox("Textbox  2", 300, 300, 250, 25)
end
return MenuScene:new()
