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

function Scene:update(dt)
    TheGUI:update(dt)
end

function Scene:draw()
    love.graphics.clear(0.1, 0.2, 0.25)
    TheGUI:draw()
end
