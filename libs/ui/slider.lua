local class = require "libs.middleclass"
require "libs.ui.widget"
Slider = class("Slider", Widget)

function Slider:initialize()
    Widget.initialize(self)
    self.text = "Slider"
end

function Slider:set_text(new_value)
    self.text = new_value
end
