-- Pause Scene
local class = require "libs.middleclass"
require "libs.scene"

local PauseScene = class("PauseScene", Scene)

function PauseScene:on_scene_enter()
    TheGUI:clear()
    self.resumeButton = TheGUI:create_button("Resume", 512 - 75, 200, 150, 50)
    self.resumeButton.onClicked = function()
        TheSceneManager:push_scene(require("scenes/gamescene"))
    end

    self.exitToMainButton = TheGUI:create_button("Exit to main menu", 512 - 75, 400, 150, 50)
    self.exitToMainButton.onClicked = function()
        TheSceneManager:push_scene(require("scenes/menuscene"))
    end
end

function PauseScene:keypressed(key)
    if key == "escape" then
        TheSceneManager:push_scene(require("scenes/gamescene"))
    end
end

return PauseScene:new()
