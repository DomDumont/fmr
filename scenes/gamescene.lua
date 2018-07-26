-- Game Scene
local class = require "libs.middleclass"
require "libs.scene"

local GameScene = class("GameScene", Scene)

function GameScene:on_scene_enter()
    TheGUI:clear()
    TheGUI:create_label("PLAYING >>> ", 0, 100, 250, 25)
end

function GameScene:keypressed(key)
    if key == "escape" then
        TheSceneManager:push_scene(require("scenes/pausescene"))
    end
end

return GameScene:new()
