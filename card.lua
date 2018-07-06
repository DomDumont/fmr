local class = require "libs.middleclass"
require "consts"

Card = class("Card")

function Card:initialize()
    print "Card:initialize()"
    self.name = ""
    self.image = ""
end

function Card:do_action()
    -- how am I going to do stuff here ???
end
