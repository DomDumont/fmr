local class = require "libs.middleclass"

Deck = class("Deck")

function Deck:initialize()
    print "Deck:initialize()"
    self.cards = {}

    for i = 1, 6 do
        local temp_card = Card:new()
        temp_card.name = "Overtake +2"
        table.insert(self.cards, temp_card)
    end

    for i = 1, 12 do
        local temp_card = Card:new()
        temp_card.name = "Overtake +3"
        table.insert(self.cards, temp_card)
    end

    for i = 1, 6 do
        local temp_card = Card:new()
        temp_card.name = "Overtake +4"
        table.insert(self.cards, temp_card)
    end

    for i = 1, 3 do
        local temp_card = Card:new()
        temp_card.name = "Wrong Line"
        table.insert(self.cards, temp_card)
    end
    for i = 1, 3 do
        local temp_card = Card:new()
        temp_card.name = "Off Circuit"
        table.insert(self.cards, temp_card)
    end
    for i = 1, 3 do
        local temp_card = Card:new()
        temp_card.name = "Lose Control"
        table.insert(self.cards, temp_card)
    end

    for i = 1, 4 do
        local temp_card = Card:new()
        temp_card.name = "Tailender  Turbo"
        table.insert(self.cards, temp_card)
    end

    for i = 1, 8 do
        local temp_card = Card:new()
        temp_card.name = "Pit Stop"
        table.insert(self.cards, temp_card)
    end
end

function Deck:shuffle()
    shuffle(self.cards)
end

function Deck:draw_card()
    return table.remove(self.cards)
end

function Deck:__tostring()
    local temp_string = ""
    for i = 1, #self.cards do
        temp_string = temp_string .. tostring(i) .. "> " .. self.cards[i].name .. "\n"
    end
    return temp_string
end
