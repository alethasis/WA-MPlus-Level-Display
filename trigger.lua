function (allstates, event, ...)
    if ((event == "SHOW_DUNGEON_LEVELS" or event == "CHALLENGE_MODE_COMPLETED") and
        not aura_env.region.HighestLevelHook and ...) then
        for _, children in ipairs(ChallengesFrame.DungeonIcons) do
            hooksecurefunc(children, "SetUp",
                           function(self) self.HighestLevel:Hide() end)

            children.HighestLevel:Hide()
        end

        aura_env.region.HighestLevelHook = true
    end

    if (event == "SHOW_DUNGEON_LEVELS") then
        for mapID, abbreviation in pairs(aura_env.mapIDs) do
            local affixScores = C_MythicPlus.GetSeasonBestAffixScoreInfoForMap(
                                    mapID)

            if (affixScores) then
                local fortifiedIndex = affixScores[1] and affixScores[1].name ==
                                           aura_env.fortified and 1 or
                                           affixScores[2] and
                                           affixScores[2].name ==
                                           aura_env.fortified and 2 or nil
                local tyrannicalIndex =
                    affixScores[1] and affixScores[1].name ==
                        aura_env.tyrannical and 1 or affixScores[2] and
                        affixScores[2].name == aura_env.tyrannical and 2 or nil

                allstates[mapID] = {
                    show = true,
                    changed = true,
                    mapID = mapID,
                    fortified = fortifiedIndex and
                        affixScores[fortifiedIndex].level or 0,
                    fortifiedOverTime = fortifiedIndex and
                        affixScores[fortifiedIndex].overTime,
                    tyrannical = tyrannicalIndex and
                        affixScores[tyrannicalIndex].level or 0,
                    tyrannicalOverTime = tyrannicalIndex and
                        affixScores[tyrannicalIndex].overTime,
                    dungeonAbbreviation = abbreviation
                }
            end
        end

        return true
    end

    if (event == "HIDE_DUNGEON_LEVELS") then
        for mapID, abbreviation in pairs(aura_env.mapIDs) do
            allstates[mapID] = {show = false, changed = true}
        end

        return true
    end
end
