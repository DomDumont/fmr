local class = require "libs.middleclass"

local GUI = class("GUI")

function GUI:initialize()
    print "GUI:initialize()"
end

TheGUI = GUI:new()
