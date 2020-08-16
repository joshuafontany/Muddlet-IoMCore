if matches[2] and matches[3] and matches[4] then
	Character.Exp.Current = tonumber(string.format("%0f", string.gsub(matches[2],",", "")))
	Character.Exp.NextAdvLevel = tonumber(string.format("%0f", string.gsub(matches[3],",", "")))
	Character.Gold.Current = tonumber(string.format("%0f", string.gsub(matches[4],",", "")))
	render_console("CharacterConsole", content_body["CharacterConsole"])
	render_progress()
	if table.contains(GUI.Mute, "Character.Exp") then
  	selectCurrentLine()
  	deleteLine()
	end
	if table.contains(GUI.Mute, "Character.Exp") then
    table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Exp"))
  end
  disableTrigger("Character.Exp")
end