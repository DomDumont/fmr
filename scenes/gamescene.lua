-- Game Scene
local class = require "libs.middleclass"
require "libs.scene"

local GameScene = class("GameScene", Scene)

function GameScene:on_scene_enter()
    TheGUI:clear()
end
return GameScene:new()
