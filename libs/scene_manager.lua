local class = require "libs.middleclass"

local SceneManager = class("SceneManager")

function SceneManager:initialize()
    print("SceneManager:initialize()")
    self.scenes_stack = {}
end

function SceneManager:draw()
    if (#self.scenes_stack ~= 0) then
        self.scenes_stack[#self.scenes_stack]:draw()
    end
end

function SceneManager:update(dt)
    if (#self.scenes_stack ~= 0) then
        self.scenes_stack[#self.scenes_stack]:update(dt)
    end
end

function SceneManager:keypressed(key)
    if (#self.scenes_stack ~= 0) then
        self.scenes_stack[#self.scenes_stack]:keypressed(key)
    end
end

function SceneManager:push_scene(new_scene, force_reset)
    force_reset = force_reset or false
    assert(new_scene ~= {})

    if (#self.scenes_stack > 0) then
        self.scenes_stack[#self.scenes_stack]:on_scene_exit()
    end

    if (force_reset == true) then
        self:clear_scenes()
    end
    table.insert(self.scenes_stack, new_scene)
    self.scenes_stack[#self.scenes_stack]:on_scene_enter()
end

function SceneManager:clear_scenes()
    for k in pairs(self.scenes_stack) do
        self.scenes_stack[k] = nil
    end
    self.scenes_stack = {}
end

function SceneManager:pop_scene()
    assert(#self.scenes_stack > 0)
    self.scenes_stack[#self.scenes_stack]:on_scene_exit()
    table.remove(self.scenes_stack)
    self.scenes_stack[#self.scenes_stack]:on_scene_enter()
end

TheSceneManager = SceneManager:new()
