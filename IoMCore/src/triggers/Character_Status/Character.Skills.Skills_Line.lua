if matches[2] and matches[3] then
    local nameA = string.lower(string.trim(matches[2]))
    local percentA = tonumber(matches[3])
    Character.Skills[GUI.CaptureGuild][nameA] = percentA
    
    if matches[4] and matches[5] then
        local nameB = string.lower(string.trim(matches[4]))
        local percentB = tonumber(matches[5])
        Character.Skills[GUI.CaptureGuild][nameB] = percentB
    end
    
    if table.contains(GUI.Mute, "Character.Skills") then
    deleteLine()
    end
    
    end