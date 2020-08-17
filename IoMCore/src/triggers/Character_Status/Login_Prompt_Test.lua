--echo("Prompt!")
disableTrigger("Mute Login Data")
disableTrigger("loginData")
if GUI.DataInitialized ~= nil and GUI.DataInitialized ~= false then
cecho(" <green>sys<DimGrey>:<white> Save Data synced for "..Character.Name.."\n")
Character_io("Save")
end