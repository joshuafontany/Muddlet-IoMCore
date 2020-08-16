--[[ turn on chat capture when:
 			1- a prompt comes up
]]
--cecho("<sky_blue>Resuming chat capture...<reset>")
if GUI.CaptureChat == false then
	GUI.CaptureChat = true
	disableTrigger("Resume Chat Capture")
end