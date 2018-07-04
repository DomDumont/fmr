local class = require "libs.middleclass"

Deck = class("Deck")

function Deck:initialize()
    print "Deck:initialize()"
    self.cards = {}
    local temp_card = Card:new()
    temp_card.name = "Wrong Line"
    table.insert(self.cards, temp_card)
end

function Deck:shuffle()
    shuffle(self.cards)
end

function Deck:draw_card()
    return table.remove(self.cards)
end
