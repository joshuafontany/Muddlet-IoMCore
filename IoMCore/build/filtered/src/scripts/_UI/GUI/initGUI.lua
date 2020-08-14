function initGUI()
	-- Container used to get console position
  GUI.mainconsole_container = Geyser.Container:new({
  	name = "mainconsole_container",
  	x="0", y="10%",
  	width="60%", height="80%",
  })
	
	GUI.window_width = -1
	GUI.window_height = -1
	
	GUI.UpdateBorderSizes()
	GUI.CreateBackground()
	GUI.CreateHeader()
	GUI.CreateFooter()
	GUI.CreateRight()
		GUI.CreateChat()
		GUI.CreateContent()
		GUI.CreateMoney()
		GUI.CreateMenu()
		GUI.CreateStatus()
	GUI.Initialized = true		
	tempTimer(
      1,
      function()
			--mapper
      GUI.MapperConsole = GUI.MapperConsole or Geyser.Mapper:new(
          {name = "MapperConsole", 
					x = GUI.ContentBox:get_x(),
            x = GUI.ContentBox:get_x(),
            y = GUI.ContentBox:get_y(),
            height = GUI.ContentBox:get_height(),
            width = GUI.ContentBox:get_width()
					}
        )
			--GUI.MapperConsole:raise()
			GUI.MapperConsole:hide()

			--call updates on all refreshable sections
			on_menu_box_press("BoxProgress")
			on_chat_box_press("BoxChatAll")
	    on_content_box_press("BoxCharacter")	
      end
    )
end