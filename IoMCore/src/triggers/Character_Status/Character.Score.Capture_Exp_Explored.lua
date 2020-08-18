if matches[2] and matches[3] and matches[4] then
	--echo(string.format("%0.0f", string.gsub(matches[2],",", "")))
	Character.Exp.Current = tonumber(string.format("%0f", string.gsub(matches[2],",", "")))
	Character.Explored.MudPercent = string.format("%0.2f", matches[3])
	Character.Explored.NextReward = string.format("%0.2f", matches[4])
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end