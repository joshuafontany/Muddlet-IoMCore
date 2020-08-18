--[[ turn off chat capture when:
 			1- a chracter's 'finger' info comes up


]]
--cecho("<sky_blue>Pausing chat capture...<reset>")
if GUI.CaptureChat == true then
	GUI.CaptureChat = false
	enableTrigger("Resume_Chat_Capture")
end