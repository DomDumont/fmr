local class = require "libs.middleclass"

Scene = class("Scene")

function Scene:on_scene_enter()
    print("on_scene_enter")
end
