if table.contains(GUI.Mute, "Character.Exp") == false then
    table.insert(GUI.Mute, "Character.Exp")
  end
  enableTrigger("Character.Exp")
  send("exp", false)
  render_progress()