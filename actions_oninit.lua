aura_env.tyrannical = C_ChallengeMode.GetAffixInfo(9)
aura_env.fortified = C_ChallengeMode.GetAffixInfo(10)

aura_env.mapIDs = {
    [375] = "Mists", -- Mists of Tirna Scithe
    [376] = "NW", -- The Necrotic Wake
    [377] = "DOS", -- De Other Side
    [378] = "HOA", -- Halls of Atonement
    [379] = "PF", -- Plaguefall
    [380] = "SD", -- Sanguine Depths
    [381] = "SOA", -- Spires of Ascension
    [382] = "TOP", -- Theater of Pain
    [391] = "STRT", -- Tazavesh: Streets of Wonder (Lower)
    [392] = "GMBT" -- Tazavesh: So'leah's Gambit (Upper)
}

aura_env.levelColors = {
    [-1] = "ffa3a3a3",
    [0] = "ffffffff",
    [1] = "ff1eff00",
    [2] = "ff0070dd",
    [3] = "ffa335ee",
    [4] = "ffff8000",
    [5] = "ffe6cc80",
    [6] = "ff00ccff"
}

if (not aura_env.region.ChallengesFrameHook) then
    local aura_env = aura_env

    C_Timer.After(1, function()
        LoadAddOn("Blizzard_ChallengesUI")

        ChallengesFrame:HookScript("OnShow", function()
            WeakAuras.ScanEvents("SHOW_DUNGEON_LEVELS", true)
        end)

        ChallengesFrame:HookScript("OnHide", function()
            WeakAuras.ScanEvents("HIDE_DUNGEON_LEVELS", true)
        end)

        aura_env.region.ChallengesFrameHook = true
    end)
end
