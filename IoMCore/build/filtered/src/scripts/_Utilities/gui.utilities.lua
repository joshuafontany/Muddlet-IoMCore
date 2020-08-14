function enable_tooltip(message)
	--echo(message.."\n")
	GUI.TooltipLabel:echo(message)
end

function disable_tooltip(message)
	GUI.TooltipLabel:echo(message)
end

function set_icon(iconName, iconCSS, section_icon, tooltip_value)
  iconURL = 'url("'..getMudletHomeDir():gsub("\\","/")..'/IoMCore/images/static-icons/'..section_icon..'")'
 	GUI[iconCSS]:set("border-image", iconURL)
  GUI[iconName]:setStyleSheet(GUI[iconCSS]:getCSS())
  GUI[iconCSS]:set("border-image", "")

  GUI[iconName]:setOnEnter(
    "enable_tooltip",
    "<b><font size=\"4\">" .. tooltip_value .. "</font></b>"
  )
  GUI[iconName]:setOnLeave(
    "disable_tooltip",
    ""
  )
	if not table.contains(GUI.icons, iconName) then
		table.insert(GUI.icons, iconName)
	end
end

function set_greybox(section_value, refCSS, tooltip_value, callback)
	GUI[section_value.."Grey"] =
    Geyser.Label:new(
      {
        name = section_value.."Grey",
        message = "",
				x=0, y=0,
				width=GUI[section_value]:get_width(), height=GUI[section_value.."Icon"]:get_height()
      },
      GUI[section_value]
    )
  	GUI[refCSS]:set("background-color", "rgba(0,0,0,160)")
    GUI[section_value.."Grey"]:setStyleSheet(GUI[refCSS]:getCSS())
    GUI[refCSS]:set("background-color", "rgba(0,0,0,0)")
		GUI[section_value.."Grey"]:setOnEnter(
      "enable_tooltip",
      "<b><font size=\"4\">" .. tooltip_value .. "</font></b>"
    )
    GUI[section_value.."Grey"]:setOnLeave(
      "disable_tooltip",
      ""
    )
    GUI[section_value .. "Grey"]:setClickCallback(callback, section_value)
		if not table.contains(GUI.greys, section_value.."Grey") then
  		table.insert(GUI.greys, section_value.."Grey")
  	end
end