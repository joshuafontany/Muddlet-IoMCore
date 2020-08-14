header_sections =
  {
    "Box0",
    "Box1",
    "Box2",
    "Box3",
    "Box4",
    "Box5",
    "Box6",
    "Box7",
    "Box8",
    "Box9",
    "Box10",
    "Box11",
		"Box12",
    "Box12",
    "Box14",
    "Box15",
  }
header_icons =
  {
    "0",
    "1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		"10",
		"11",
		"12",
		"13",
		"14",
		"15",
  }
header_tooltips =
  {
    "Score",
    "Key 1",
    "Key 2",
    "Key 3",
    "Key 4",
    "Key 5",
    "Key 6",
    "Key 7",
    "Key 8",
    "Key 9",
    "Key 0",
    "Shift+1",
    "Shift+2",
    "Shift+3",
    "Shift+4",
    "Shift+5",
  }
header_stretch = {1.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}

function GUI.CreateHeader()
  GUI.BoxHeaderCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
  	qproperty-wordWrap: true;
  ]])
  
  -- The icons will be contained here
  GUI.HBoxHeader =
    Geyser.HBox:new(
      {name = "HBoxHeader", x = 0, y = 0, width = "100%", height = "100%"}, GUI.Top
    )
  	
  -- Add the icons and events
  for index = 1, #header_sections do
    local section_value = header_sections[index]
    local icon_value = header_icons[index]
    local tooltip_value = header_tooltips[index]
    local stretch_value = header_stretch[index]
  	
    if section_value ~= "Score" then
      GUI[section_value] =
        GUI[section_value] or
        Geyser.Label:new(
          {
            name = "Top" .. section_value,
            message = "<center><b><font size=\""..(GUI.FontSize+2).."\">" .. icon_value .. "</font></b>",
            h_stretch_factor = stretch_value,
          },
          GUI.HBoxHeader
        )
      GUI[section_value]:setStyleSheet(GUI.BoxHeaderCSS:getCSS())
      GUI[section_value]:setOnEnter(
        "enable_tooltip",
        "<center><b><font size=\""..GUI.FontSize.."\">" .. icon_value .. "</font></b><br>" .. tooltip_value
      )
      GUI[section_value]:setOnLeave(
        "disable_tooltip",
        "<center><b><font size=\""..(GUI.FontSize+2).."\">" .. icon_value .. "</font></b>"
      )
    else
      GUI[section_value] =
        GUI[section_value] or
        Geyser.Label:new(
          {
            name = "Top" .. section_value,
            message = "<center><b><font size=\""..GUI.FontSize.."\">" .. icon_value .. "</font></b>",
            h_stretch_factor = stretch_value,
          },
          GUI.HBoxHeader
        )
      GUI[section_value]:setStyleSheet(GUI.BoxHeaderCSS:getCSS())
      GUI[section_value]:setOnEnter(
        "enable_tooltip",
        "<center><b><font size=\""..GUI.FontSize.."\">" .. icon_value .. "</font></b><br>" .. tooltip_value
      )
      GUI[section_value]:setOnLeave(
        "disable_tooltip",
        "<center><b><font size=\""..GUI.FontSize.."\">" .. icon_value .. "</font></b>"
      )
    end
  end
end