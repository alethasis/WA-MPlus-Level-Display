function()
    local fortified = aura_env.state.fortified
    local tyrannical = aura_env.state.tyrannical
    local dungeonAbbreviation = aura_env.state.dungeonAbbreviation

    local fortifiedColorLevel = aura_env.state.fortifiedOverTime and -1 or
                                    min(floor(fortified / 5), 6)
    local tyrannicalColorLevel = aura_env.state.tyrannicalOverTime and -1 or
                                     min(floor(tyrannical / 5), 6)

    local fortifiedColor = aura_env.levelColors[fortifiedColorLevel]
    local tyrannicalColor = aura_env.levelColors[tyrannicalColorLevel]

    local fortifiedLevel = string.format("|c%s%d|r", fortifiedColor, fortified)
    local tyrannicalLevel = string.format("|c%s%d|r", tyrannicalColor,
                                          tyrannical)

    local fortifiedDisplay = "F: " .. fortifiedLevel
    local tyrannicalDisplay = "T: " .. tyrannicalLevel

    return dungeonAbbreviation, fortifiedDisplay, tyrannicalDisplay
end
