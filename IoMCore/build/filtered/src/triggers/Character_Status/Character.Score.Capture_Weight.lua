if matches[2] and matches[3] and matches[4] and matches[5] then
	Character.Stats.Con.Current = tonumber(matches[2])
	Character.Ep.Current = tonumber(matches[3])
	Character.Ep.Max = tonumber(matches[4])
	Character.Weight = tonumber(matches[5])
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end