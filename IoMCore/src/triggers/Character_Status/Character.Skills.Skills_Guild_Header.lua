if matches[2] then
    GUI.CaptureGuild = string.trim(string.lower(matches[2]))
    if table.contains(Character.Skills, GUI.CaptureGuild) == false then
        Character.Skills[GUI.CaptureGuild] = {}
    end
    if table.contains(GUI.Mute, "Character.Skills") then
    deleteLine()
    end
end