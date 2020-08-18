if table.contains(GUI.Mute, "Character.Eq") then
    table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Eq"))
end
disableTrigger("Character.Eq.Get_Armor")
disableTrigger("Character.Eq.End_Eq")
echo("disable")