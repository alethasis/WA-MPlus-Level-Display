function()
    if (ChallengesFrame and ChallengesFrame.DungeonIcons) then
        for k, v in ipairs(ChallengesFrame.DungeonIcons) do
            if v.mapID == aura_env.state.mapID then
                return ChallengesFrame.DungeonIcons[k]
            end
        end
    end
end
