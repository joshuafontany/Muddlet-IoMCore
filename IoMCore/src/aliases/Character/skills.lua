if table.contains(GUI.Mute, "Character.Skills") == true then
	table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Skills"))
end
if table.contains(GUI.Mute, "Character.Exp") == false then
	table.insert(GUI.Mute, "Character.Exp")
end
disableTrigger("Character.Spells")
enableTrigger("Character.Skills")
enableTrigger("Character.Exp")
--cecho("<sky_blue>updating skills...<reset>")
send("do exp; skills;", false)