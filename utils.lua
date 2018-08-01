function show_error_and_quit(error_msg)
    io.write("ERROR => " .. error_msg)
    os.exit()
end

function get_number_within_limits(prompt, minValue, maxValue, defaultValue)
    io.write(prompt .. " [" .. minValue .. " - " .. maxValue .. "] (default " .. defaultValue .. ")")
    local tempInput = io.read()
    if (tempInput == "") then
        return defaultValue
    end
    tempInput = tonumber(tempInput)
    if (tempInput == nil) then
        show_error_and_quit("You must enter a number")
    end
    if ((tempInput < minValue) or (tempInput > maxValue)) then
        show_error_and_quit("the value must be between " .. minValue .. " and " .. maxValue)
    end

    return tempInput
end

function get_name_or_generate_a_random_one(prompt)
    possiblenames = {"John", "Smith", "Paul", "Jacob", "Jackson", "Reece", "Kimberly", "Paula", "Chuck", "Ness"}
    local chosenOne = math.random(1, #possiblenames)
    local defaultValue = possiblenames[chosenOne]
    table.remove(possiblenames, chosenOne)
    io.write(prompt .. " (default " .. defaultValue .. ")")
    local tempInput = io.read()
    if (tempInput == "") then
        return defaultValue
    else
        return tempInput
    end
end

function ask_player_to_choose_a_card(player)
    local temp_string = "PLAYER " .. player.name .. " " .. player.type .. " PLEASE CHOOSE BETWEEN => "
    for i = 1, #player.cards do
        temp_string = temp_string .. tostring(i) .. "> " .. player.cards[i].name .. "\n"
    end
    print(temp_string)
    local tempIndex = io.read()
    return tempIndex
end

function shuffle(t)
    local n = #t

    while n >= 2 do
        -- n is now the last pertinent index
        local k = math.random(n) -- 1 <= k <= n
        -- Quick swap
        t[n], t[k] = t[k], t[n]
        n = n - 1
    end

    return t
end

function my_scene_color(colorName)
    print(colorName)
    if colorName == "red" then
        love.graphics.setColor(1, 0, 0, 1)
    elseif colorName == "green" then
        love.graphics.setColor(0, 1, 0, 1)
    elseif colorName == "blue" then
        love.graphics.setColor(0, 0, 1, 1)
    elseif colorName == "orange" then
        love.graphics.setColor(1, 0.65, 0, 1)
    elseif colorName == "yellow" then
        love.graphics.setColor(1, 1, 0, 1)
    elseif colorName == "purple" then
        love.graphics.setColor(0.93, 0.50, 0.93, 1)
    elseif colorName == "white" then
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.setColor(1, 1, 1, 1)
    end
end
