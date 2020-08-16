if table.contains(GUI.Mute, "Character.Score") then
    table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Score"))
  end
  enableTrigger("Character.Score")
  send("score", false)
  tempTimer( 2, function () render_console("CharacterConsole", menu_body["CharacterConsole"] ) end )