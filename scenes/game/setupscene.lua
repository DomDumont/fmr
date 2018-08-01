-- Game Scene
local class = require "libs.middleclass"
require "libs.scene"

local SetupScene = class("SetupScene", Scene)

function SetupScene:initialize()
end

function SetupScene:on_scene_enter()
    TheGUI:clear()
    TheGUI:create_label("Setup  >>> ", 0, 100, 250, 25)
    self.whale = love.graphics.newImage("assets/car.png")
end

function SetupScene:keypressed(key)
    if key == "escape" then
        TheSceneManager:push_scene(require("scenes/pausescene"))
    end
end

function SetupScene:draw()
    Scene.draw(self) -- call base method
    love.graphics.push("all")
    my_scene_color("yellow")
    love.graphics.draw(self.whale, 100, 100)
    my_scene_color("green")
    love.graphics.draw(self.whale, 300, 100)
    love.graphics.pop()
end

return SetupScene:new()
