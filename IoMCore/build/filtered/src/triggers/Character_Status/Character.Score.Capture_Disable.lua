render_console("CharacterConsole", content_body["CharacterConsole"])
render_progress()
disableTrigger("Character.Score")
disableTrigger("Character.Score.Capture_Guilds")
if table.contains(GUI.Mute, "Character.Score") == true then
selectCurrentLine()
copy()
deleteLine()
table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Score"))
end