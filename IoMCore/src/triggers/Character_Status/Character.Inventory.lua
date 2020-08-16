if matches[2] =="Weight (in lbs):" then
	if table.contains(GUI.Mute, "Character.Inventory") then
		selectCurrentLine()
    deleteLine()
  end
	Character.Inventory = {}
	GUI.InvSection = ""
end