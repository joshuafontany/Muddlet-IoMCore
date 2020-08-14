status_sections =
  {
    "BoxBrave",
    "BoxPkable",
    "BoxPoisoned",
    "BoxConfused",
    "BoxHallucinating",
    "BoxDrunk"
  }
status_icons =
  {
    "chat-settings.png",
    "chat-settings.png",
    "chat-settings.png",
    "chat-settings.png",
    "chat-settings.png",
    "chat-settings.png"
  }
status_tooltips =
  {
    "Brave",
    "PK Flag",
    "Poisoned",
    "Confused",
    "Hallucinating",
    "Drunk"
  }

function on_status_box_press(section)
  for index = 1, #status_sections do
    local section_value = menu_sections[index]
		
    if section_value == section then
			GUI.CurrentStatus = section
      --GUI[console_value]:show()
    else
      --GUI[console_value]:hide()
    end
  end
end

function GUI.CreateStatus()
  -- The icons will be contained here
  GUI.HBoxStatus =
    Geyser.HBox:new(
      {name = "HBoxStatus", x = 0, y = "95%", width = "100%", height = "5%"}, GUI.Right
    )
  	
  -- Add the icons and events
  for index = 1, #status_sections do
    local section_value = status_sections[index]
    local section_icon = status_icons[index]
    local tooltip_value = status_tooltips[index]
		
    GUI[section_value] =
      Geyser.Container:new(
        {
          name = section_value,
          message = ""
        },
        GUI.HBoxStatus
      )
    
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
		GUI[section_value .. "Icon"]:setClickCallback("on_status_box_press", section_value)
		set_greybox(section_value, "BoxRightCSS", tooltip_value, "on_status_box_press")
  end
	   
	 GUI.BoxTooltip =
    Geyser.Container:new(
      {
        name = "BoxTooltip",
        message = "",
				h_stretch_factor = 6
      },
      GUI.HBoxStatus
    )
  GUI.TooltipLabel =
    Geyser.Label:new(
      {
        name = "TooltipLabel",
        message = "",
				x=0, y=0,
				width="100%", height="100%"
      },
      GUI.BoxTooltip
    )
		GUI.TooltipLabel:setStyleSheet(GUI.TooltipLabelCSS:getCSS())
		GUI.TooltipLabel:setOnEnter(
      "enable_tooltip",
      "<b><font size=\""..GUI.FontSize.."\">Displays info on the current UI element.</font></b></center>"
    )
    GUI.TooltipLabel:setOnLeave(
      "disable_tooltip",
      ""
    )
	
end