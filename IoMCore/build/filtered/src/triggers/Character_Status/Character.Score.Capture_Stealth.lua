if matches[2] and matches[3] and matches[4] then
	Character.Stats.Sta.Current = tonumber(matches[2])
	Character.Stealth = tonumber(matches[4])
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end