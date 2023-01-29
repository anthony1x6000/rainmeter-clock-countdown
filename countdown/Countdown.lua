function Update()
    local targets = {
        {day = 30, month = 1, year = 2023, hour=9, min=00, sec=5, endtxt="until cs exam"},
        {day = 31, month = 1, year = 2023, hour=9, min=00, sec=2, endtxt="until avdfunctions exam"},
        {day = 1, month = 2, year = 2023, hour=9, min=00, sec=7, endtxt="until english exam"},
        {day = 30, month = 4, year = 2023, hour=17, min=30, sec=30, endtxt="finalize highschool volunteer hours"},
        {day = 27, month = 7, year = 2023, hour=14, min=55, sec=0, endtxt="until end of school"},
        {day = 27, month = 7, year = 2999, hour=0, min=0, sec=0, endtxt="thing overflows"},
    } -- right now, that is the max amount that is displayed with what i configured it to be. except for that last one... the thing overflows

    local timeRemainingText = ""
    for i, target in ipairs(targets) do
        local targetTime = os.time({day = target.day, month = target.month, year = target.year, hour = target.hour, min = target.min, sec = target.sec})
        local timeNow = os.time()
        local timeRemaining = targetTime - timeNow
        if timeRemaining > 0 then
            local days = math.floor(timeRemaining / 86400)
            local hours = math.floor((timeRemaining % 86400) / 3600)
            local minutes = math.floor((timeRemaining % 3600) / 60)
            local seconds = timeRemaining % 60
            timeRemainingText = timeRemainingText .. days .. "D " .. hours .. "H " .. minutes .. "M " .. seconds .. "S " .. target.endtxt .. "\n"
        end
    end

    SKIN:Bang('!SetOption', 'MeterCountdown', 'Text', timeRemainingText)
end
