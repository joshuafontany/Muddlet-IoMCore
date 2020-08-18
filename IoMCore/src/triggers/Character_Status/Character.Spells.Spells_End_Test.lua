--cecho("\n -- <red>Spells Prompt!<reset>\n")
if table.contains(GUI.Mute, "Character.Spells") then
    deleteLine()
    table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Spells"))
    end
    GUI.CaptureGuild = ""
    disableTrigger("Character.Spells.Spells_Guild_Header")
    disableTrigger("Character.Spells.Spells_Line")
    disableTrigger("Character.Spells.Spells_End")
    disableTrigger("Character.Spells")
    disableTrigger("Character.Spells.Spells_End_Test")