if matches[2] then
    GUI.CaptureGuild = string.trim(string.lower(matches[2]))
    if table.contains(Character.Spells, GUI.CaptureGuild) == false then
        Character.Spells[GUI.CaptureGuild] = {}
    end
    if table.contains(GUI.Mute, "Character.Spells") then
    deleteLine()
    end
end