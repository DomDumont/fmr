function show_error_and_quit(error_msg)
    io.write("ERROR => " .. error_msg)
    os.exit()
end

function get_number_within_limits(prompt, minValue, maxValue, defaultValue)
    io.write(prompt .. " [" .. minValue .. " - " .. maxValue .. "] ")
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
