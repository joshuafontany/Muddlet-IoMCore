if table.contains(GUI.Mute, "Character.Inventory") then
    table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Inventory"))
  end
  send("i", false)
  tempTimer( 2, function () render_console("InventoryConsole", menu_body["InventoryConsole"] ) end )