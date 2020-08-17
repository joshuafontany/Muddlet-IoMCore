--[[if matches[2] then
Character.Name = matches[2]
end]]
if matches[3] then
    Character.Surname = matches[3]
    end
    if matches[4] then
    Character.Race = matches[4]
    end
    if matches[5] then
    Character.Title = matches[5]
    end
    if matches[6] then
    Character.GuildName = matches[6]
    end
    
    if table.contains(GUI.Mute, "Character.Score") then
    selectCurrentLine()
    deleteLine()
    end