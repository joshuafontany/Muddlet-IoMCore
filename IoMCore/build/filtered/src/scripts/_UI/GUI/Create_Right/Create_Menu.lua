menu_sections = 
	{
		"BoxAbilities", 
		"BoxInventory", 
		"BoxParty",
		"BoxProgress",
		"BoxConfig", 
		"BoxHelp"
	}
menu_icons = 
	{
		"menu-abilities.png", 
		"menu-inventory.png", 
		"menu-party.png",
		"menu-progress.png",
		"menu-config.png", 
		"menu-help.png"
	}
menu_tooltips = 
	{
		"Abilities (Skills/Spells)", 
		"Inventory", 
		"Party Status",
		"Progress (Exp/Gold/Rewards)",
		"Hotkey Configuration", 
		"Help Topics"
		}
menu_consoles =
  {
		"AbilitiesConsole", 
		"InventoryConsole", 
		"PartyConsole", 
		"ProgressContainer",
		"ConfigConsole", 
		"HelpContainer"
	}

progress_sections = 
	{
		"Gold",
		"Bank",
		"Exp",
		"NextAdvLevel",
		"NextGuildLevel",
		"Kills",
		"Rooms",
		"MudPercent",
		"NextReward",
		"TaskPoints"
	}
progress_icons = 
	{
		"money-coins.png",
		"progress-bank.png",
		"money-exp.png",
		"progress-adv.png",
		"progress-guild.png",
		"progress-kills.png",
		"progress-rooms.png",
		"progress-mudpercent.png",
		"progress-nextreward.png",
		"progress-taskpoints.png"
	}
progress_tooltips = 
	{
		"Current Gold", 
		"Gold in Bank",
		"Current Experience", 
		"To Next Adventurer Level",
		"To Next Guild Level",
		"Total Kills",
		"Rooms Explored",
		"% of Mud Explored",
		"% to next Exploration Reward",
		"Task Points",
	}
	
function on_menu_box_press(section)
  for index = 1, #menu_sections do
    local section_value = menu_sections[index]
    local console_value = menu_consoles[index]
		local delay = GUI.TabTimersDelay
		
    if section_value == section then
			if section == "BoxAbilities" then
				delay = GUI.TabTimersDelay * 3
				render_console("AbilitiesConsole", menu_body["AbilitiesConsole"] )
			elseif section == "BoxInventory" then
				render_console("InventoryConsole", menu_body["InventoryConsole"] )
			elseif section == "BoxParty" then
				delay = GUI.TabTimersDelay / 2
			elseif section == "BoxProgress" then
				if GUI.NextAdvLevelBar then GUI.NextAdvLevelBar:show() end
				if GUI.NextGuildLevelBar then GUI.NextGuildLevelBar:show() end
			end
			GUI.CurrentMenu = section
      GUI[console_value]:show()
			GUI[section_value.."Grey"]:hide()
			startTabTimer(console_value, delay)
    else
      GUI[console_value]:hide()
			GUI[section_value.."Grey"]:show()
			killTabTimer(console_value)
    end
  end
	if section ~= "BoxProgress" then
		if GUI.NextAdvLevelBar then GUI.NextAdvLevelBar:hide() end
		if GUI.NextGuildLevelBar then GUI.NextGuildLevelBar:hide() end
	end
end

function GUI.CreateMenu()
  GUI.BoxMenuButtonCSS = CSSMan.new([[
    background-color: rgba(0,0,0,0);
    border-style: solid;
    border-color: #31363b;
    border-width: 1px;
  ]])
  
  -- The icons will be contained here
  GUI.HBoxMenu =
    Geyser.HBox:new(
      {name = "HBoxMenu", x = "50%", y = 0, width = "50%", height = "5%"}, GUI.Right
    )
    
  -- Add the icons and events
  for index = 1, #menu_sections do
    local section_value = menu_sections[index]
    local section_icon = menu_icons[index]
    local tooltip_value = menu_tooltips[index]
		
		GUI[section_value] =
      Geyser.Label:new(
        {
          name = section_value,
          message = "",
        },
        GUI.HBoxMenu
      )
		GUI[section_value]:setStyleSheet(GUI.BoxMenuButtonCSS:getCSS())
    
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
		set_icon(section_value.."Icon", "BoxMenuButtonCSS", section_icon, tooltip_value)
		GUI[section_value .. "Icon"]:setClickCallback("on_menu_box_press", section_value)
		set_greybox(section_value, "BoxRightCSS", tooltip_value, "on_menu_box_press")		
  end
  
  -- The consoles will be contained here
  GUI.MenuBox =
    Geyser.Label:new(
      {name = "MenuBox", x = "50%", y = "5%", width = "50%", height = "90%"}, GUI.Right
    )    
  GUI.MenuBox:setStyleSheet(GUI.BoxRightCSS:getCSS())
  
  -- Add the consoles (and containers)
  for index = 1, #menu_consoles do
    local console_value = menu_consoles[index]
    if not table.contains(GUI.consoles, console_value) then
  		table.insert(GUI.consoles, console_value)
  	end
    if console_value ~= "HelpContainer" and console_value ~= "ProgressContainer"  then
      GUI[console_value] =
        GUI[console_value] or
        Geyser.MiniConsole:new(
          {
            name = console_value,
            x = GUI.MenuBox:get_x()+tonumber(string.format("%.0f", GUI.MenuBox:get_width()*0.02)),
            y = GUI.MenuBox:get_y()+tonumber(string.format("%.0f", GUI.MenuBox:get_width()*0.02)),
            height = GUI.MenuBox:get_height()-tonumber(string.format("%.0f", GUI.MenuBox:get_width()*0.02)),
            width = GUI.MenuBox:get_width()-tonumber(string.format("%.0f", GUI.MenuBox:get_width()*0.02))
          }
        )
      setBackgroundColor(console_value, 0, 0, 0, 0)
      setMiniConsoleFontSize(console_value, GUI.ConsoleFontSize)
      setFgColor(console_value, 192, 192, 192)
      setBgColor(console_value, 0, 0, 0)
      GUI[console_value]:enableAutoWrap()
      GUI[console_value]:hide()
		elseif console_value == "ProgressContainer" then
			--Progress Menu 
    	GUI.ProgressContainer =
      Geyser.Container:new(
        {name = "ProgressContainer", 
    			x = GUI.MenuBox:get_x()+tonumber(string.format("%.0f", GUI.MenuBox:get_width()*0.02)),
          y = GUI.MenuBox:get_y()+tonumber(string.format("%.0f", GUI.MenuBox:get_width()*0.02)),
          height = GUI.MenuBox:get_height()-tonumber(string.format("%.0f", GUI.MenuBox:get_width()*0.02)),
          width = GUI.MenuBox:get_width()-tonumber(string.format("%.0f", GUI.MenuBox:get_width()*0.02))
        }
      )
    	
    	GUI.VBoxProgress =
      Geyser.VBox:new(
        {name = "VBoxProgress", 
    		x = "0%", y = "0%",
    		width = "90%", height = "90%"
				}, GUI.ProgressContainer
      )
    	GUI.do_progress_build(progress_sections, progress_icons, progress_tooltips)	
    	GUI.ProgressContainer:hide()
    else
      GUI[console_value] =
        GUI[console_value] or
        Geyser.Container:new(
          {
            name = console_value,
            x = GUI.MenuBox:get_x(),
            y = GUI.MenuBox:get_y(),
            height = GUI.MenuBox:get_height(),
            width = GUI.MenuBox:get_width()
          }
        )      
			setBackgroundColor(console_value, 0, 0, 0, 0)
			GUI[console_value]:hide()
    end
  end
end

function GUI.do_progress_build(sections, icons, tooltips)
	for index = 1, #sections do
		local section_value = sections[index]
    local section_icon = icons[index]
    local tooltip_value = tooltips[index]
  	

		GUI[section_value.."Container"] =
    Geyser.Label:new(
      {
        name = section_value.."Container",
        message = "",
				x = 0, y = 0,
				height =  GUI.button_height+6,
    		width = "100%"
      },
      GUI.VBoxProgress
    )
		GUI[section_value.."Container"]:setStyleSheet(GUI.MoneyBoxCSS:getCSS())
		
		GUI["Box"..section_value] =
    Geyser.Label:new(
      {
        name = "Box"..section_value,
        message = "",
				x = 3, y = 3,
				height = GUI.button_height,
    		width = GUI.button_height
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
  	set_icon("Box"..section_value.."Icon", "BoxMenuButtonCSS", section_icon, tooltip_value)
    GUI["Box"..section_value .. "Icon"]:setClickCallback("on_progress_box_press", section_value)
		
		if section_value == "NextAdvLevel" or section_value == "NextGuildLevel" then			
	
			barName = section_value .. "Bar"
			section_color = "gold"
  		GUI[barName.."Wrapper"] =
        GUI[barName .. "Wrapper"] or
        Geyser.Container:new(
          {
            name = barName.."Wrapper",
            message = "",
            x = "20%", y = "5%",
            width = "80%",
            height = "100%"
          },GUI[section_value.."Container"])
			
			GUI[barName] =
        GUI[barName] or
        Geyser.Gauge:new(
          {
            name = barName,
            message = "",
            x = "0%", y = "0%",
            width = "100%",
            height = "40%"
          },GUI[barName .. "Wrapper"])
      GUI[barName].back:setStyleSheet(GUI.GaugeBackCSS:getCSS())
      GUI.GaugeFrontCSS:set("background-color",section_color)
      GUI[barName].front:setStyleSheet(GUI.GaugeFrontCSS:getCSS())		
			GUI[barName]:hide()
			
			GUI[section_value .. "Value"] =
     	Geyser.Label:new(
        {
          name = section_value .. "Value",
          message = string.format("<b><font size=\""..GUI.FontSize.."\">%9s %s</font></b>", 0, section_value),
  				x = "0%", y = "30%",
  				height="70%", width="100%"
        },
        GUI[barName.."Wrapper"]
      )
  		GUI[section_value .. "Value"]:setStyleSheet(GUI.ProgressLabelCSS:getCSS())
			
  		if not table.contains(GUI.gauges, barName) then
  			table.insert(GUI.gauges, barName)
  		end
    else
			GUI[section_value .. "Value"] =
     	Geyser.Label:new(
        {
          name = section_value .. "Value",
          message = string.format("<b><font size=\""..GUI.FontSize.."\">%9s %s</font></b>", 0, section_value),
  				x = "20%", y = "0%",
  				height="100%", width="80%"
        },
        GUI[section_value.."Container"]
      )
  		GUI[section_value .. "Value"]:setStyleSheet(GUI.ProgressLabelCSS:getCSS())
		end
  end
		GUI["ProgressFillContainer1"] =
  Geyser.Label:new(
    {
      name = "ProgressFillContainer1",
      message = "",
			x = 0, y = 0,
			height =  "100%",
  		width = "100%"
    },
    GUI.VBoxProgress
  )
	GUI["ProgressFillContainer1"]:setStyleSheet(GUI.MoneyBoxCSS:getCSS())
	
	GUI["ProgressFillContainer2"] =
  Geyser.Label:new(
    {
      name = "ProgressFillContainer2",
      message = "",
			x = 0, y = 0,
			height =  "100%",
  		width = "100%"
    },
    GUI.VBoxProgress
  )
	GUI["ProgressFillContainer2"]:setStyleSheet(GUI.MoneyBoxCSS:getCSS())
	
end

function render_progress()
	for index = 1, #progress_sections do
		local section_value = progress_sections[index]
		--echo("Rendering "..section_value.."\n")
		GUI[section_value .. "Value"]:echo(string.format("<b><font size=\""..GUI.FontSize.."\">%s</font></b>", progressValue(section_value)()))
	end
	GUI.NextAdvLevelBar:setValue(Character.Exp.Current, Character.Exp.NextAdvLevel, "")
	GUI.NextGuildLevelBar:setValue(Character.Exp.Current, Character.Exp.NextGuildLevel, "")
	
	GUI["CurrentGoldValue"]:echo(string.format("<b><font size=\""..GUI.FontSize.."\">%10s %-10s<br></font></b>", format_num(Character.Gold.Current, 0), "Gold"))
	GUI["CurrentExpValue"]:echo(string.format("<b><font size=\""..GUI.FontSize.."\">%10s %-10s<br>( %0.1f%% )</font></b>", format_num(Character.Exp.Current, 0), "Exp", (Character.Exp.Current/Character.Exp.NextGuildLevel)*100))
end

function progressValue(section)
	local progress_handlers = 
	{
		Gold = function() return format_num(Character.Gold.Current, 0).." Gold on hand" end,
		Bank = function() return format_num(Character.Gold.Bank, 0).." Gold in bank" end ,
		Exp = function() return format_num(Character.Exp.Current, 0).." Experience" end,
		NextAdvLevel = function()
			local str = string.format("%s ( %0.3f%% )", format_num(Character.Exp.Current, 0).."/"..format_num(Character.Exp.NextAdvLevel, 0), (Character.Exp.Current/Character.Exp.NextAdvLevel)*100 )
			return str
		end ,
		NextGuildLevel = function()
			local str = string.format("%s ( %0.3f%% )", format_num(Character.Exp.Current, 0).."/"..format_num(Character.Exp.NextGuildLevel, 0), (Character.Exp.Current/Character.Exp.NextGuildLevel)*100)
			return str
		end ,
		Kills = function() return format_num(Character.Kills, 0).." Kills" end ,
		Rooms = function() return format_num(Character.Explored.Rooms, 0).." Rooms Explored" end,
		MudPercent = function() return Character.Explored.MudPercent.."% of Mud Explored" end,
		NextReward = function() return Character.Explored.NextReward.."% to Next Award" end,
		TaskPoints = function() return Character.TaskPoints.." Task Points" end		
	}
	
	return progress_handlers[section]
end

menu_body = menu_body or {
 AbilitiesConsole = {
 	function(console_value)
		local newString = string.format("<$header>..--==| <$bonus>%s<$header> |==--..<reset>", "SKILLS")
		GUI[console_value]:cecho(string.gsub(newString, "%$([%w_]+)", GUI.colors).."\n")		
		gRanks = {[1] = "alpha", [2] = "gamma", [3] = "bravo", [4] = "omicron"}
  	for r = 1, #gRanks do
			local rank = gRanks[r]
			if Character.Guilds[rank] then
				local gKeys = table.keys(Character.Guilds[rank])
				for i = 1, #gKeys do
    			local guild = gKeys[i]
					newString = string.format("<$header> -=-=-| <$value>%s<$header> |-=-=-<reset>", firstToUpper(guild))
					GUI[console_value]:cecho(string.gsub(newString, "%$([%w_]+)", GUI.colors).."\n")
  				local sKeys = {}
					local names = Character.Skills[guild]
					if names then
						for k in pairs(names) do table.insert(sKeys, k) end
  					table.sort(sKeys)
      			for s = 1, #sKeys do
      				local name = sKeys[s]
      				local percent = Character.Skills[guild][name]
							newString = string.format("<$value>%4s%% <$item>| <reset>", percent)
							GUI[console_value]:cecho(string.gsub(newString, "%$([%w_]+)", GUI.colors))
							GUI[console_value]:setUnderline(true)
            	GUI[console_value]:fg(GUI.colors.item)
            	GUI[console_value]:echoPopup(string.format("%s\n", name),
								{
									[[send("help skill ]]..name..[[", true)]], 
									[[send("use ]]..name..[[")]]
								}, {
									"Help", 
									"Use"
								}, true)
            	GUI[console_value]:setUnderline(false)
            	GUI[console_value]:fg(GUI.colors.value)
      			end
					end	
    		end
			end
		end
	end,
	 function(console_value)
		local newString = string.format("\n<$header>..--==| <$bonus>%s<$header> |==--..<reset>", "SPELLS")
		GUI[console_value]:cecho(string.gsub(newString, "%$([%w_]+)", GUI.colors).."\n")		
		gRanks = {[1] = "alpha", [2] = "gamma", [3] = "bravo", [4] = "omicron"}
  	for r = 1, #gRanks do
			local rank = gRanks[r]
			if Character.Guilds[rank] then
				local gKeys = table.keys(Character.Guilds[rank])
				for i = 1, #gKeys do
    			local guild = gKeys[i]
					newString = string.format("<$header> -=-=-| <$value>%s<$header> |-=-=-<reset>", firstToUpper(guild))
					GUI[console_value]:cecho(string.gsub(newString, "%$([%w_]+)", GUI.colors).."\n")
  				local sKeys = {}
					local names = Character.Spells[guild]
					if names then
						for k in pairs(names) do table.insert(sKeys, k) end
  					table.sort(sKeys)
      			for s = 1, #sKeys do
      				local name = sKeys[s]
      				local percent = Character.Spells[guild][name]
							newString = string.format("<$value>%4s%% <$item>| <reset>", percent)
							GUI[console_value]:cecho(string.gsub(newString, "%$([%w_]+)", GUI.colors))
							GUI[console_value]:setUnderline(true)
            	GUI[console_value]:fg(GUI.colors.item)
            	GUI[console_value]:echoPopup(string.format("%s\n", name),
								{
									[[send("help spell ]]..name..[[", true)]], 
									[[send("cast ]]..name..[[")]]
								}, {
									"Help", 
									"Use"
								}, true)
            	GUI[console_value]:setUnderline(false)
            	GUI[console_value]:fg(GUI.colors.value)
      			end
					end	
    		end
			end
		end
	end,
	},
	InventoryConsole = {
 	function(console_value)
		local inv_commands = 
		{
			[[GUI.InventoryHideEq = true
				refreshInventory()]],
			[[GUI.InventoryHideEq = false
				refreshInventory()]]
		}
		local inv_tooltips = 
		{
			"[Click] Hide Eq",
			"[R-Click] Show Eq"
		}
		GUI[console_value]:setBold(false)
		GUI[console_value]:setUnderline(true)
		GUI[console_value]:fg(GUI.colors.item)
		GUI[console_value]:echoPopup("Inventory",
			inv_commands,
			inv_tooltips,
			true
		)
		GUI[console_value]:setBold(true)
		GUI[console_value]:echoPopup(" [Kept] ",
			inv_commands,
			inv_tooltips,
			true
		)
		GUI[console_value]:setBold(false)
		GUI[console_value]:fg(GUI.colors.eq_item)
		local eqText = ""
		if GUI.InventoryHideEq == true then eqText = "[Eq-hidden]"
		else eqText = "[Eq]" end
		GUI[console_value]:echoPopup(eqText.."\n",
			inv_commands,
			inv_tooltips,
			true
		)
    resetFormat()
		GUI[console_value]:cecho(string.gsub(string.format("<$item>Weight: You[<cyan>%4i<$item>] + EQ[<cyan>%4i<$item>] =<reset>", Character.Weight, Character.InventoryWeight), "%$([%w_]+)", GUI.colors).."\n")
		GUI[console_value]:cecho(string.gsub(string.format("<$item>Total[<cyan>%4i<$item>], Capacity[<%s>%3i%%<$item>]<reset>", Character.Weight+Character.InventoryWeight, lookupCapacityColor(Character.InventoryCapacity), Character.InventoryCapacity), "%$([%w_]+)", GUI.colors).."\n")

		local sKeys = {"General items", "Gems", "Armors", "Weapons"}
		for k in pairs(Character.Inventory) do
			if not table.contains(sKeys, k) then table.insert(sKeys, k) end
		end
		for s = 1, #sKeys do
			local section = sKeys[s]
			if Character.Inventory[section] and #Character.Inventory[section] > 0 then
				GUI[console_value]:cecho("      ")
				GUI[console_value]:setFgColor(
					Character.InventoryHeadersFg[section]["r"], 
					Character.InventoryHeadersFg[section]["g"],
					Character.InventoryHeadersFg[section]["b"]	
				)
				GUI[console_value]:setBgColor(
					Character.InventoryHeadersBg[section]["r"], 
					Character.InventoryHeadersBg[section]["g"],
					Character.InventoryHeadersBg[section]["b"]	
				)
				GUI[console_value]:setBold(true)
  			GUI[console_value]:cecho("[+-+ "..section.." +-+]\n")
				resetFormat()
  			for i = 1, #Character.Inventory[section] do
    			local obj = Character.Inventory[section][i]
					local visible = true
					if obj.worn == true and GUI.InventoryHideEq == true then
						visible = false
					elseif obj.wielded == true and GUI.InventoryHideEq == true then
						visible = false
					end
					if visible == true then
    				GUI[console_value]:cecho(string.gsub(string.format("%-18s", "(<cyan>"..obj.quantity.."<reset>)"), "%$([%w_]+)", GUI.colors))
  					local commands = {
    					[[send("examine first ]]..obj.name..[[", true)]]						
    				}
  					local tooltips =  {
    					"Examine"
    				}
  					GUI[console_value]:fg(GUI.colors.item)
  					if obj.worn == true or obj.wielded == true then
  						GUI[console_value]:fg(GUI.colors.eq_item)
  						table.insert(commands, [[send("remove ]]..obj.name..[[", true)]])
  						table.insert(tooltips, "Remove")
  					end
  					if obj.kept == true then
  						GUI[console_value]:setBold(true)
          	else
  						table.insert(commands, [[send("sell a ]]..obj.name..[[", true)]])
  						table.insert(tooltips, "Sell")
  						table.insert(commands, [[send("sell all ]]..obj.name..[[", true)]])
  						table.insert(tooltips, "Sell all")
  					end
  					GUI[console_value]:setUnderline(true)	
          	GUI[console_value]:echoPopup(string.format("%s\n", obj.name), commands, tooltips, true)
          	resetFormat()
					end
  			end
			end
		end
	end
	}
}