local class = require "libs.middleclass"

Label = class("Label")

function Label:initialize()
    self.name = ""
end

function Label:set_text(new_value)
    self.text = new_value
end
