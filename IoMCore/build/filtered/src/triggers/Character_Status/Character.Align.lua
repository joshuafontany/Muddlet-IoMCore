if matches[2] then
	if table.contains(GUI.Mute, "Character.Align") then
  	selectCurrentLine()
  	deleteLine()
    table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Align"))
  end
  disableTrigger("Character.Align")
end