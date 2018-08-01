-- Menu Scene

local class = require "libs.middleclass"
require "libs.scene"

local MenuScene = class("MenuScene", Scene)
local C_ROW_1_Y = 200
local C_ROW_2_Y = 300

function MenuScene:initialize(sweetness)
    self.possibleColors = {"red", "yellow", "green", "blue", "purple", "orange"}
end

function MenuScene:on_scene_enter()
    TheGUI:clear()

    TheGUI:create_label("How many races in session ? ", 200, C_ROW_1_Y, 250, 25)
    -- TheGUI:create_textbox("Textbox  10", 450, C_ROW_1_Y, 250, 25)
    self.sliderRaces = TheGUI:create_slider("SliderRaces", 200, 250, 250, 25)
    self.sliderRaces:set_min_value(1)
    self.sliderRaces:set_max_value(10)
    self.sliderRaces:set_nb_ticks(9)
    self.sliderRaces:set_value(1)

    TheGUI:create_label("How many players ? ", 200, C_ROW_2_Y, 250, 25)
    -- TheGUI:create_textbox("Textbox  2", 450, C_ROW_2_Y, 250, 25)
    self.sliderPlayers = TheGUI:create_slider("SliderPlayers", 200, 350, 250, 25)
    self.sliderPlayers:set_min_value(3)
    self.sliderPlayers:set_max_value(6)
    self.sliderPlayers:set_nb_ticks(3)
    self.sliderPlayers:set_value(1)

    self.playButton = TheGUI:create_button("Play", 512 - 75, 700, 150, 50)
    self.playButton.onClicked = function()
        print("pouet pouet 2")
        TheSceneManager:push_scene(require("scenes/gamescene"))
    end

    self.changeColorButton = TheGUI:create_button("Change Color", 200, 500, 150, 50)
    self.changeColorButton.onClicked = function()
        self.currentColor = self.currentColor + 1
        if self.currentColor > 6 then
            self.currentColor = 1
        end
    end

    self.currentColor = 1
end

function MenuScene:draw()
    Scene.draw(self) -- call base method
    love.graphics.push("all")
    self:setColor(self.possibleColors[self.currentColor])
    love.graphics.rectangle("fill", 400, 450, 100, 100, 4)
    love.graphics.pop()
end

function MenuScene:keypressed(key)
    if key == "escape" then
        love.event.push("quit")
    end
end

function MenuScene:setColor(colorName)
    print(colorName)
    if colorName == "red" then
        love.graphics.setColor(1, 0, 0, 1)
    elseif colorName == "green" then
        love.graphics.setColor(0, 1, 0, 1)
    elseif colorName == "blue" then
        love.graphics.setColor(0, 0, 1, 1)
    elseif colorName == "orange" then
        love.graphics.setColor(1, 0.65, 0, 1)
    elseif colorName == "yellow" then
        love.graphics.setColor(1, 1, 0, 1)
    elseif colorName == "purple" then
        love.graphics.setColor(0.93, 0.50, 0.93, 1)
    elseif colorName == "white" then
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.setColor(1, 1, 1, 1)
    end
end

return MenuScene:new()
