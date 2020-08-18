if matches[2] and matches[3] and matches[4] then
	Character.Stats.Int.Current = tonumber(matches[2])
	Character.Wimpy = tonumber(matches[3])
	local val = matches[4]
	local num = GUI.Lookup.Hiding[val]
	Character.Hiding = tonumber(num)
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end