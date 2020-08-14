function GUI.UpdateBorderSizes()
	local w,h = getMainWindowSize()
	-- Only update if window size have changed!
	if( w ~= GUI.window_width or h ~= GUI.window_height ) then
		GUI.window_width = w
		GUI.window_height = h
		
		GUI.button_height = h/20

		local cx = GUI.mainconsole_container:get_x()
		local cy = GUI.mainconsole_container:get_y()
		local cw = GUI.mainconsole_container:get_width()
		local ch = GUI.mainconsole_container:get_height()

		setBorderLeft(tonumber(cx))
		setBorderTop(tonumber(cy))
		setBorderRight(tonumber(w-cx-cw))
		setBorderBottom(tonumber(h-cy-ch))
		
		GUI.UpdateConsoleFontSize()
		GUI.UpdateFontSize()
		return true
	end
	return false
end

function GUI.UpdateConsoleFontSize()
	--MiniConsoleFontSize
	local w,h = getMainWindowSize()
	local defaultWidth = w * 0.2
	local targetWidth = defaultWidth / 40
	local width,height = calcFontSize(GUI.ConsoleFontSize)
	if width > targetWidth then
		GUI.ConsoleFontSize = GUI.ConsoleFontSize - 1
		GUI.UpdateConsoleFontSize()
	elseif width < targetWidth * .6 then
		GUI.ConsoleFontSize = GUI.ConsoleFontSize + 1
		GUI.UpdateConsoleFontSize()	
	end
end

function GUI.UpdateFontSize()
	--FontSize

end