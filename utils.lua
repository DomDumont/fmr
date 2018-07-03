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
