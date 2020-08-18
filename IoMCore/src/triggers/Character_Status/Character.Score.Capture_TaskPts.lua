if matches[2] and matches[3] and matches[4] then
	Character.Stats.Cha.Current = tonumber(matches[2])
	local val = string.trim(matches[3])
	local num = GUI.Lookup.Alignment[val]
	Character.Alignment = tonumber(num)
	Character.TaskPoints = tonumber(matches[4])
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end