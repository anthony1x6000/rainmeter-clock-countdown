function Update()
    local now = os.time()

    local fYear = 2023
    local fMonth = 7
    local fDay = 27
    local fHour = 0
    local fMin = 0
    local fSec = 0
    local f = os.time({year = fYear, month = fMonth, day = fDay, hour = fHour, min = fMin, sec = fSec})

    local diff = os.difftime(f, now)

    local days = math.floor(diff / 86400)
    local remainder = diff % 86400
    local hours = math.floor(remainder / 3600)
    remainder = remainder % 3600
    local minutes = math.floor(remainder / 60)
    local seconds = remainder % 60

    SKIN:Bang('!SetOption', 'MeterCountdown', 'Text', days .. "D " .. hours .. "H " .. minutes .. "M " .. seconds .. "S" .. " until school end")
end
