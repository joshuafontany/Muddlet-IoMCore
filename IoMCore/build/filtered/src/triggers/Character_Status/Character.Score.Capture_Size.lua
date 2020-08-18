if matches[2] and matches[3] and matches[4] and matches[5] then
	Character.Stats.Dex.Current = tonumber(matches[2])
	Character.Sp.Current = tonumber(matches[3])
	Character.Sp.Max = tonumber(matches[4])
	Character.Height = matches[5]
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end