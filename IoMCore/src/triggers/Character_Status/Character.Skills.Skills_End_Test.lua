--cecho("\n -- <red>Skills Prompt!<reset>\n")
if table.contains(GUI.Mute, "Character.Skills") then
    deleteLine()
    table.remove(GUI.Mute, table.index_of(GUI.Mute, "Character.Skills"))
end
GUI.CaptureGuild = ""
disableTrigger("Character.Skills.Skills_Guild_Header")
disableTrigger("Character.Skills.Skills_Line")
disableTrigger("Character.Skills.Skills_End")
disableTrigger("Character.Skills")
disableTrigger("Character.Skills.Skills_End_Test")