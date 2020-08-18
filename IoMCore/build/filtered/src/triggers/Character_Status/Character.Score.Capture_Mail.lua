if matches[2] and matches[3] then
	Character.Mail.New = tonumber(matches[2])
	Character.Mail.Total = tonumber(matches[3])
	enableTrigger("Character.Score.Capture_Guilds")
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end