if table.contains(GUI.Mute, "Character.Spells") == true then
	table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Spells"))
end
if table.contains(GUI.Mute, "Character.Align") == false then
	table.insert(GUI.Mute, "Character.Align")
end
disableTrigger("Character.Skills")
enableTrigger("Character.Spells")
enableTrigger("Character.Align")
--cecho("<sky_blue>updating spells...<reset>")
send("do align; spells;", false)