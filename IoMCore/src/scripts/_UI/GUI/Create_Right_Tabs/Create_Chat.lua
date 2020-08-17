chat_sections =
  {
		"BoxChatAll", 
		"BoxChatCustom",
		"BoxChatTells", 
		"BoxChatParty", 
		"BoxChatMailbox", 
		"BoxChatSettings"
		}
chat_icons = 
	{
		"chat-all.png", 
		"chat-custom.png", 
		"chat-raven.png", 
		"chat-party.png", 
		"chat-mailbox.png", 
		"chat-settings.png"
	}
chat_tooltips = 
	{
		"All", 
		"Custom", 
		"Tells", 
		"Party", 
		"Mailbox", 
		"Chat Settings"
	}
chat_consoles =
  {
    "ChatAllConsole",
    "ChatCustomConsole",
    "ChatTellsConsole",
    "ChatPartyConsole",
    "ChatMai1boxConsole",
    "ChatSettingsConsole"
  }

function on_chat_box_press(section)

  for index = 1, #chat_sections do
    local section_value = chat_sections[index]
    local console_value = chat_consoles[index]
		
    if section_value == section then
      GUI.CurrentChat = section
			if index ~= #chat_sections then GUI[console_value]:show() end
			GUI[section_value.."Grey"]:hide()
    else
      if index ~= #chat_sections then GUI[console_value]:hide() end
			GUI[section_value.."Grey"]:show()
    end
  end
end

function GUI.CreateChat()
  GUI.BoxChatButtonCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
    border-style: solid;
    border-color: #31363b;
    border-width: 1px;
		qproperty-alignment: 'AlignBottom|AlignMiddle';
  ]])
  
  -- The icons will be contained here
  GUI.HBoxChat =
    Geyser.HBox:new({name = "HBoxChat", x = 0, y = 0, width = "50%", height = "5%"}, GUI.Right)
  	
  -- Add the icons and events
  for index = 1, #chat_sections do
    local section_value = chat_sections[index]
    local section_icon = chat_icons[index]
    local tooltip_value = chat_tooltips[index]
  	
		GUI[section_value] =
    Geyser.Label:new(
      {
        name = section_value,
        message = ""
      },
      GUI.HBoxChat
    )
		GUI[section_value]:setStyleSheet(GUI.BoxChatButtonCSS:getCSS())
		
   	GUI[section_value.."Icon"] =
    Geyser.Label:new(
      {
        name = section_value.."Icon",
        message = "",
				x=0, y=0,
				width=GUI.button_height, height=GUI.button_height
      },
      GUI[section_value]
    )
		set_icon(section_value.."Icon", "BoxRightCSS", section_icon, tooltip_value)
		GUI[section_value .. "Icon"]:setClickCallback("on_chat_box_press", section_value)
		set_greybox(section_value, "BoxRightCSS", tooltip_value, "on_chat_box_press")
  end
  
  -- The consoles will be contained here
  GUI.ChatBox =
    Geyser.Label:new(
      {name = "ChatBox", x = 0, y = "5%", width = "50%", height = "40%"}, GUI.Right
    )
  GUI.ChatBox:setStyleSheet(GUI.BoxRightCSS:getCSS())
  
  -- Add the consoles
  for index = 1, #chat_sections - 1 do
    local console_value = chat_consoles[index]
		if not table.contains(GUI.consoles, console_value) then
  		table.insert(GUI.consoles, console_value)
  	end  	
    GUI[console_value] =
      GUI[console_value] or
      Geyser.MiniConsole:new(
        {
          name = console_value,
          x = GUI.ChatBox:get_x()+tonumber(string.format("%.0f", GUI.ChatBox:get_width()*0.02)),
          y = GUI.ChatBox:get_y()+tonumber(string.format("%.0f", GUI.ChatBox:get_width()*0.02)),
          height = GUI.ChatBox:get_height()-tonumber(string.format("%.0f", GUI.ChatBox:get_width()*0.02)),
          width = GUI.ChatBox:get_width()-tonumber(string.format("%.0f", GUI.ChatBox:get_width()*0.02))
        }
      )
    setBackgroundColor(console_value, 0, 0, 0, 0)
    setMiniConsoleFontSize(console_value, GUI.ConsoleFontSize)
    setFgColor(console_value, 192, 192, 192)
    setBgColor(console_value, 0, 0, 0)
    GUI[console_value]:enableAutoWrap()
    GUI[console_value]:hide()
  end
end