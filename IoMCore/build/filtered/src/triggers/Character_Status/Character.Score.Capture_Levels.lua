if matches[2] and matches[3] then
	Character.Level = tonumber(matches[2])
	Character.OpenLevels = tonumber(matches[3])
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end