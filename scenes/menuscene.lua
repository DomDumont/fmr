-- Menu Scene

local class = require "libs.middleclass"
require "libs.scene"

local MenuScene = class("MenuScene", Scene)

function MenuScene:on_scene_enter()
    print("MenuScene on_scene_enter")
end
return MenuScene:new()
