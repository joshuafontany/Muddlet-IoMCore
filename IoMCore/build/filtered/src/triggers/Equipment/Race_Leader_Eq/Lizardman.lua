send("wear tailspike")
enableTrigger("Character.Score")
if table.contains(GUI.Mute, "Character.Score") == false then
	table.insert(GUI.Mute, "Character.Score")
end
send("score", false)