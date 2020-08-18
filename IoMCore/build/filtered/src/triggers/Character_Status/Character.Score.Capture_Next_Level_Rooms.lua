if matches[2] and matches[3] then
	Character.Exp.NextAdvLevel = tonumber(string.format("%0f", string.gsub(matches[2],",", "")))
	Character.Explored.Rooms = tonumber(string.format("%0f", string.gsub(matches[3],",", "")))
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end