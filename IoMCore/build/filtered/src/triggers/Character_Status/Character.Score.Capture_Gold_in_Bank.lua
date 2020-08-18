if matches[2] then
	Character.Gold.Bank = tonumber(string.format("%0f", string.gsub(matches[2],",", "")))
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end