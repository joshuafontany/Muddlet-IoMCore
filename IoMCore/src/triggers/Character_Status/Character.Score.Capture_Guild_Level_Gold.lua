if matches[2] and matches[3] then
	--echo(matches[2])
	Character.Exp.NextGuildLevel = tonumber(string.format("%0f", string.gsub(matches[2],",", "")))
	Character.Gold.Current = tonumber(string.format("%0f", string.gsub(matches[3],",", "")))
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end