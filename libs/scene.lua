local class = require "libs.middleclass"

Scene = class("Scene")

function Scene:on_scene_enter()
    print("on_scene_enter")
end

function Scene:on_scene_exit()
    print("on_scene_exit")
end

function Scene:keypressed(key)
end

function Scene:draw()
end
