money_sections = 
	{
		"CurrentGold",
		"CurrentExp"
	}
money_icons = 
	{
		"money-coins.png",
		"money-exp.png"
	}
money_tooltips = 
	{
		"Current Gold", 
		"Current Experience"
	}

function GUI.CreateMoney()
  GUI.HBoxMoney =
    Geyser.Container:new(
      {name = "HBoxMoney", x = 0, y = "90%", width = "50%", height = "5%"}, GUI.Right
    )

	-- Add the icons and events
	xPos = {"0%", "50%"}
  for index = 1, #money_sections do
    local section_value = money_sections[index]
    local section_icon = money_icons[index]
    local tooltip_value = money_tooltips[index]  	

		GUI[section_value.."Container"] =
    Geyser.Container:new(
      {
        name = section_value.."Container",
        message = "",
				x = xPos[index], y = 0,
				height = "100%",
    		width = "50%"
      },
      GUI.HBoxMoney
    )
		
		GUI["Box"..section_value] =
    Geyser.Label:new(
      {
        name = "Box"..section_value,
        message = "",
				x = 0, y = 0,
				height = "100%",
    		width = "30%"
      },
      GUI[section_value.."Container"]
    )
		GUI["Box"..section_value]:setStyleSheet(GUI.MoneyBoxCSS:getCSS())
		
    GUI["Box"..section_value .. "Icon"] =
    Geyser.Label:new(
      {
        name = "Box"..section_value .. "Icon",
        message = "",
				x = 0, y = 0,
				height = GUI.button_height,
    		width = GUI.button_height
      },
      GUI["Box"..section_value]
    )
  	set_icon("Box"..section_value.."Icon", "MoneyBoxCSS", section_icon, tooltip_value)
    GUI["Box"..section_value .. "Icon"]:setClickCallback("on_money_box_press", section_value)
		if not table.contains(GUI.icons, "Box"..section_value.."Icon") then
  		table.insert(GUI.icons, "Box"..section_value.."Icon")
  	end
		
		local key = string.split(section_value, "Current")[2]
		sectionObj = Character[key]
	 	GUI[section_value .. "Value"] =
   	Geyser.Label:new(
      {
        name = section_value .. "Value",
        message = string.format("<b><font size=\""..GUI.FontSize.."\">%12s<br>%-12s</font></b>", format_num(sectionObj.Current, 0), key),
				x = "30%", y = "0%",
				height="100%", width="70%"
      },
      GUI[section_value.."Container"]
    )
		GUI[section_value .. "Value"]:setStyleSheet(GUI.MoneyLabelCSS:getCSS())
  end
end

function on_money_box_press()
	on_menu_box_press("BoxProgress")
end