footer_top_sections =
  {
    "Health",
    "Spell",
    "Endurance",
    "Enemy"
  }
footer_top_icons =
  {
    "health-points.png",
    "spell-points.png",
    "endurance-points.png",
    "enemy-points"
  }
footer_top_colors =
  {
    "red",
    "blue",
    "darkorange",
    "purple"
  }
 footer_top_tooltips =
  {
    "Hp",
    "Sp",
    "Ep",
    "EHp"
  }
	
	
footer_bottom_sections =
  {
    "Room",
    "Area",
    "Exits"
  }

function GUI.CreateFooter()
  GUI.Footer = Geyser.VBox:new({
    name = "Footer",
    x = 0, y = 0,
    width = "100%",
    height = "100%",
  },GUI.Bottom)
  
  GUI.FooterTop = Geyser.Container:new({
    name = "FooterTop",
  },GUI.Footer)
  
  GUI.FooterBottom = Geyser.HBox:new({
    name = "FooterBottom",
  },GUI.Footer)
  
  GUI.GaugeBackCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
    border-style: solid;
    border-color: white;
    border-width: 1px;
    border-radius: 5px;
    margin: 5px;
  ]])
  
  GUI.GaugeFrontCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
    border-style: solid;
    border-color: white;
    border-width: 1px;
    border-radius: 5px;
    margin: 5px;
  ]])
	
	 GUI.BoxFooterCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
  	margin: 2px;
  	qproperty-wordWrap: true;
  	qproperty-alignment: 'AlignBottom';
  ]])
	
	GUI.BoxFooterIconCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
  	margin: 2px;
  	qproperty-wordWrap: true;
  	qproperty-alignment: 'AlignBottom';
  ]])
	
	GUI.BarLabelCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
  	margin: 10px;
  	qproperty-alignment: 'AlignCenter';
  ]])
	
	-- Add the icons and events
  for index = 1, #footer_top_sections do
		local section_value = footer_top_sections[index]
		local section_color = footer_top_colors[index]
    local section_icon = footer_top_icons[index]
    local tooltip_value = footer_top_tooltips[index]
		boxName = "Box" .. section_value
		iconName = boxName .. "Icon"
		boxPos = (index*25)-25
		
    GUI[boxName] =
      GUI[boxName] or
      Geyser.Label:new(
        {
          name = boxName,
          message = "",
          x = boxPos.."%", y = 0,
          width = "5%",
          height = "100%"
        },GUI.FooterTop)
		GUI[boxName]:setStyleSheet(GUI.BoxFooterCSS:getCSS())
				
		GUI[iconName] =
      GUI[iconName] or
      Geyser.Label:new(
        {
          name = iconName,
          message = "",
          x = 0, y = 0,
          height = GUI.button_height,
    			width = GUI.button_height
        },GUI[boxName])
		set_icon(iconName, "BoxFooterIconCSS", section_icon, tooltip_value)
		--GUI[section_value .. "Icon"]:setClickCallback("on_boxfooter_press", section_value)
    		
		barName = tooltip_value .. "Bar"
		
		GUI[barName .. "Wrapper"] =
      GUI[barName .. "Wrapper"] or
      Geyser.Container:new(
        {
          name = barName .. "Wrapper",
          message = "",
          x = (boxPos+5).."%", y = 0,
          width = "20%",
          height = "100%",
        },GUI.FooterTop)		
		
		GUI[barName] =
      GUI[barName] or
      Geyser.Gauge:new(
        {
          name = barName,
          message = "",
          x = 0, y = 0,
          width = "100%",
          height = "100%",
        },GUI[barName.."Wrapper"])
    GUI[barName].back:setStyleSheet(GUI.GaugeBackCSS:getCSS())
    GUI.GaugeFrontCSS:set("background-color",section_color)
    GUI[barName].front:setStyleSheet(GUI.GaugeFrontCSS:getCSS())
	
		barLabel = barName.."Label"
		GUI[barLabel] =
      GUI[barLabelame] or
      Geyser.Label:new(
        {
          name = barLabel,
          message = "",
          x = 0, y = 0,
          width = "100%",
          height = "100%"
        },GUI[barName])
		GUI[barLabel]:setStyleSheet(GUI.BarLabelCSS:getCSS())
		
		if not table.contains(GUI.gauges, barName) then
			table.insert(GUI.gauges, barName)
		end
		
		if barName ~= "EHpBar" then GUI[barName]:setValue(math.random(100),100) else
			GUI[barName]:setValue(0,100)
			Character.EHp = 0
			Character.Enemy = "No Enemy"
			GUI[barLabel]:echo("<b>"..Character.Enemy.." ("..Character.EHp.."%)</b>")
		end
	end
	
	
   
  GUI.BoxRoom = Geyser.Label:new({
    name = "BoxRoom",
  },GUI.FooterBottom)
  GUI.BoxRoom:setStyleSheet(GUI.BoxFooterCSS:getCSS())
  GUI.BoxRoom:echo("<center><font size=\""..(GUI.FontSize+2).."\">📍</font> <b><font size=\""..GUI.FontSize.."\">Room</font></b>")
  
  GUI.BoxArea = Geyser.Label:new({
    name = "BoxArea",
  },GUI.FooterBottom)
  GUI.BoxArea:setStyleSheet(GUI.BoxFooterCSS:getCSS())
  GUI.BoxArea:echo("<center><font size=\""..(GUI.FontSize+2).."\">🏰</font> <b><font size=\""..GUI.FontSize.."\">Area</font></b>")
  
  GUI.BoxExits = Geyser.Label:new({
    name = "BoxExits",
  },GUI.FooterBottom)
  GUI.BoxExits:setStyleSheet(GUI.BoxFooterCSS:getCSS())
  GUI.BoxExits:echo("<center><font size=\""..(GUI.FontSize+2).."\">🚪</font> <b><font size=\""..GUI.FontSize.."\">Exits</font></b>")
end

function update_statusbars()
	GUI.HpBar:setValue(Character.Hp.Current, Character.Hp.Max, "")
	GUI.SpBar:setValue(Character.Sp.Current, Character.Sp.Max, "")
	GUI.EpBar:setValue(Character.Ep.Current, Character.Ep.Max, "")
	
	GUI.HpBarLabel:echo("<b>"..Character.Hp.Current.."/"..Character.Hp.Max.."</b>")
	GUI.SpBarLabel:echo("<b>"..Character.Sp.Current.."/"..Character.Sp.Max.."</b>")
	GUI.EpBarLabel:echo("<b>"..Character.Ep.Current.."/"..Character.Ep.Max.."</b>")
end