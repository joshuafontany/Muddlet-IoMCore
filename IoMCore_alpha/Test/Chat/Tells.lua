if GUI.CaptureChat == true then
	selectCurrentLine()
	copy()
	appendBuffer("ChatTellsConsole")
	if GUI.HideTells == true then
		deleteLine()
	end
	if GUI.CurrentChat ~= "BoxChatTells" then
		flashButtonBox("BoxChatTellsIcon", 0.25, 0.5)
	end
end