content_sections =
  {
		"BoxCharacter", 
		"BoxCombat", 
		"BoxEquipment", 
		"BoxQuickwalk", 
		"BoxMap", 
		"BoxInfo"
	}
content_icons = 
	{
		"content-character.png", 
		"content-combat.png", 
		"content-equipment.png", 
		"content-quickwalk.png", 
		"content-map.png", 
		"content-info.png"
	}
content_tooltips = {"Score", "Combat", "Equipment", "Quickwalk", "Map", "Info"}
content_consoles =
  {
    "CharacterConsole",
    "CombatConsole",
    "EquipmentConsole",
    "QuickwalkConsole",
    "MapperConsole",
    "InfoConsole"
  }

function on_content_box_press(section)
  for index = 1, #content_sections do
    local section_value = content_sections[index]
    local console_value = content_consoles[index]
		local delay = delay or GUI.TabTimersDelay
				
    if section_value == section then
			if section == "CharacterConsole" then
				render_console("CharacterConsole", content_body["CharacterConsole"])
				delay  = TabTimersDelay * 6
			end
			GUI.CurrentContent = section
      GUI[console_value]:show()
			GUI[section_value.."Grey"]:hide()
			startTabTimer(console_value, delay)
    else
      GUI[console_value]:hide()
			GUI[section_value.."Grey"]:show()
			killTabTimer(console_value)
    end
  end
end

function GUI.CreateContent()
  GUI.BoxContentButtonCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
    border-style: solid;
    border-color: #31363b;
    border-width: 1px;
		qproperty-alignment: 'AlignBottom';
  ]])
  
  -- The icons will be contained here
  GUI.HBoxContent =
    Geyser.HBox:new(
      {name = "HBoxContent", x = 0, y = "45%", width = "50%", height = "5%"}, GUI.Right
    )
  	
  -- Add the icons and events
  for index = 1, #content_sections do
    local section_value = content_sections[index]
    local section_icon = content_icons[index]
    local tooltip_value = content_tooltips[index]
  	
		GUI[section_value] =
    Geyser.Label:new(
      {
        name = section_value,
        message = ""
      },
      GUI.HBoxContent
    )
		GUI[section_value]:setStyleSheet(GUI.BoxChatButtonCSS:getCSS())
		
    GUI[section_value.."Icon"] =
      Geyser.Label:new(
        {
          name = section_value.."Icon",
          message = "",
					x=3, y=0,
					width=GUI.button_height, height=GUI.button_height
        },
        GUI[section_value]
      )
  	set_icon(section_value.."Icon", "BoxRightCSS", section_icon, tooltip_value)
		GUI[section_value .. "Icon"]:setClickCallback("on_content_box_press", section_value)
		set_greybox(section_value, "BoxRightCSS", tooltip_value, "on_content_box_press")
  end
  
  -- The consoles will be contained here
  GUI.ContentBox =
    Geyser.Label:new(
      {name = "ContentBox", x = 0, y = "50%", width = "50%", height = "40%"}, GUI.Right
    )
  GUI.ContentBox:setStyleSheet(GUI.BoxRightCSS:getCSS())
  
  -- Add the consoles (except the Mapper, because it is so special)
  for index = 1, #content_sections do
    local console_value = content_consoles[index]
		if not table.contains(GUI.consoles, console_value) then
  		table.insert(GUI.consoles, console_value)
  	end
    if console_value ~= "MapperConsole" then
		  GUI[console_value] =
        GUI[console_value] or
        Geyser.MiniConsole:new(
          {
            name = console_value,
            x = GUI.ContentBox:get_x()+tonumber(string.format("%.0f", GUI.ContentBox:get_width()*0.02)),
            y = GUI.ContentBox:get_y()+tonumber(string.format("%.0f", GUI.ContentBox:get_width()*0.02)),
            height = GUI.ContentBox:get_height()-tonumber(string.format("%.0f", GUI.ContentBox:get_width()*0.02)),
            width = GUI.ContentBox:get_width()-tonumber(string.format("%.0f", GUI.ContentBox:get_width()*0.02))
          }
        )
			setBackgroundColor(console_value, 0, 0, 0, 0)
      setMiniConsoleFontSize(console_value, GUI.ConsoleFontSize)
      setFgColor(console_value, 192, 192, 192)
      setBgColor(console_value, 0, 0, 0)
      GUI[console_value]:enableAutoWrap()
			-- Add each section's internals
			render_console(console_value, content_body[console_value])
      GUI[console_value]:hide()
		end
  end  	
end

content_body = content_body or {
 CharacterConsole = {
 	function(console_value)
		local newString =  {}
		if Character.Name ~= "" and Character.Surname ~= "" then
			table.insert(newString, string.format("<$header>%s %s<reset>", Character.Name, Character.Surname))
		else
			table.insert(newString, string.format("<$header>%s<reset>", Character.Name))
		end
	
		if Character.Title ~= "" and Character.GuildName ~= "" then
			table.insert(newString, string.format("<$item> %-6s: %s\n %6s: %s<reset>", "Title", Character.Title, "Guild", Character.GuildName))
		elseif Character.Title ~= "" then
			table.insert(newString, string.format("<$item> %-6s: %s<reset>", "Title", Character.Title))
		elseif Character.GuildName ~= "" then
			table.insert(newString, string.format("<$item> %-6s: %s<reset>", "Guild", Character.GuildName))
		end  		
		table.insert(newString, string.format("<$item> %-6s: <$value>%s<reset>", "Race", Character.Race))
		if Character.OpenLevels > 0 then
			table.insert(newString, string.format(
				"<$item> %-6s: <$value>%-i<$item> (<$bonus>%i<$item> Open Levels)<reset>",  
				"Level", Character.Level, Character.OpenLevels
				)
			)
		else
			table.insert(newString, string.format("<$item> %-6s: <$value>%i<reset>",  "Level", Character.Level))
		end
		local hungerValue = lookupHunger(Character.Hunger)
		local hungerColor = "<"..lookupHungerColor(Character.Hunger)..">"
		local alignColor = "<"..GUI.Lookup.AlignColors[Character.Alignment]..">"
		table.insert(newString, string.format(
			"<$item> %-6s: %s%s\n<$item> %-6s: %s%s (%3s%%)<reset>", 
			"Align.", alignColor, GUI.Lookup.Alignment[Character.Alignment], "Hunger", hungerColor or "", hungerValue or "", Character.Hunger
			)
		)
		GUI[console_value]:cecho(string.gsub(table.concat(newString, "\n"), "%$([%w_]+)", GUI.colors).."\n")
	end,
	function(console_value)
		local newString =  {}
		table.insert(newString, string.format("<$subheader>%-16s%-16s<reset>", "STATS", "TRAITS"))
		local stats = {"Str", "Dex", "Con", "Sta", "Int", "Wis", "Cha"}
		local traitKeys = {"AC", "Wimpy", "Poisoned", "Hiding", "Growth","Height", "Weight"}
		for index = 1, #stats do
			local stat = stats[index]
			local trait = traitKeys[index]
			local statObj = Character.Stats[stat]
			
			if statObj.Current == statObj.Base then bonusStr = "<$value>+0"
			elseif statObj.Current > statObj.Base then 
				bonusStr = "<$bonus>+"..(statObj.Current - statObj.Base)
			else bonusStr = "<$penalty>-"..(statObj.Base - statObj.Current) end

			
			local tColors = {
				["AC"] = "<"..GUI.Lookup.ACColors[Character.AC]..">",
				["Wimpy"] = "<$value>",
				["Poisoned"] = "<"..GUI.Lookup.PoisonedColors[Character.Poisoned]..">",
				["Hiding"] = "<$value>",
				["Growth"] = "<yellow>",
				["Height"] = "<$value>",
				["Weight"] = "<$value>",
			}
			local tColor = tColors[trait]
			local tValue = Character[trait]
			local tWord = tValue
			if GUI.Lookup[trait] ~= nil then
				tWord = GUI.Lookup[trait][tValue]
			elseif trait == "Height" then
				tWord = Character.Height	
			end
			local t =  string.format(" %-8s: ", trait)
			local str = "<$item>%4s: <$value>%-3s <$item>(%2s<$item>)  "
			if trait == "Hiding" then 
				str = str..t.."%s%s<$item> (<$value>%3s%%<$item>)"
			elseif trait == "Wimpy" then
				str = str..t.."%s%s%%<reset>"
			elseif trait == "Weight" then
				str = str..t.."%s%s lb<reset>"
			else
				str = str..t.."%s%s<reset>"
			end
			if trait ~= "Hiding" then
				table.insert(newString, string.format(str, stat, statObj.Current, bonusStr, tColor, tWord))
			else
				table.insert(newString, string.format(str, stat, statObj.Current, bonusStr, tColor, tWord, Character.Stealth))
			end
		end
		GUI[console_value]:cecho(string.gsub(table.concat(newString, "\n"), "%$([%w_]+)", GUI.colors).."\n")
	end,
	function(console_value)
		local newString =  {}
		table.insert(newString, string.format("<$subheader>%s<reset>", "GUILDS"))
		
		local guildTiers = {"alpha", "gamma", "bravo", "omicron"}
		for index = 1, #guildTiers do
  		local tier = guildTiers[index]
  		local str = string.format("<$item> %-7s: <$value>", tier)
  		local i = 0
			if Character.Guilds[tier] ~= nil then
  			local tierGuilds = Character.Guilds[tier]
    		for k,v in pairs(tierGuilds) do
    			str = str..firstToUpper(k).." ("..v..")"
    			if i < #Character.Guilds[tier] then str = str..", " end
  			end
			end
			str = str.."<reset>"
			table.insert(newString, str)
		end
		GUI[console_value]:cecho(string.gsub(table.concat(newString, "\n"), "%$([%w_]+)", GUI.colors).."\n")
	end
	},
	CombatConsole = {
	
	}
}