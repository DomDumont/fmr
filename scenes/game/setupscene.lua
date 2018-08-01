-- Game Scene
local class = require "libs.middleclass"
require "libs.scene"

local SetupScene = class("SetupScene", Scene)

function SetupScene:on_scene_enter()
    TheGUI:clear()
    TheGUI:create_label("Setup  >>> ", 0, 100, 250, 25)
end

function SetupScene:keypressed(key)
    if key == "escape" then
        TheSceneManager:push_scene(require("scenes/pausescene"))
    end
end

return SetupScene:new()
