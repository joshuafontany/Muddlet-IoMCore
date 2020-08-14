--Refreshes open tabs in the Content or Menu areas (if necessary)
GUI.TabRefresh = GUI.TabRefresh or true
GUI.TabTimers = GUI.TabTimers or {}
GUI.TabTimersDelay = GUI.TabTimersDelay or 10

function killAllTabTimers()
	local keys = table.keys(GUI.TabTimers)
	for index = 1, #keys do
		local name = keys[index]
  	if GUI.TabTimers[name] then
			killTimer(GUI.TabTimers[name])
			GUI.TabTimers[name] = nil
		end
	end
end

function killTabTimer(name)
	if GUI.TabTimers[name] then
		--cecho("\n<sky_blue>killing tab timer: <red>"..name.."<reset>\n")
		killTimer(GUI.TabTimers[name])
		GUI.TabTimers[name] = nil	
	end
end

function startTabTimer(name, delay)
	if GUI.TabRefresh == true then
  	delay = delay or GUI.TabTimersDelay
  	if TabHandlers[name] then
  		--cecho("<sky_blue>starting tab refresh... "..name.."<reset>\n")
  		refreshTab(name, delay)
  	end
	end
end

function refreshTab(name, delay)
	--cecho("\n<sky_blue>updating tab...<reset>")
	delay = delay or GUI.TabTimersDelay
	doTabRefresh(name)
	if GUI.TabTimers[name] then killTimer(GUI.TabTimers[name]) end		
	GUI.TabTimers[name] = tempTimer(delay, [[
		--cecho("\n<sky_blue>timer called...<reset>")
		refreshTab("]]..name..[[", "]]..delay..[[")
	]] )
end

function doTabRefresh(name)
  if GUI.TabRefresh == true then
		enableTrigger("Suppress Prompt")
  	TabHandlers[name]()
	end
end

TabHandlers = TabHandlers or 
		{
			["CharacterConsole"] = function() refreshCharacter() end,
			["AbilitiesConsole"] = function() refreshAbilities() end,
			["InventoryConsole"] = function() refreshInventory() end,
					
			["ProgressContainer"] = function() refreshProgress() end,
		}

function refreshCharacter()
	if table.contains(GUI.Mute, "Character.Score") == false then table.insert(GUI.Mute, "Character.Score") end
	enableTrigger("Character.Score")
	--cecho("<sky_blue>updating score...<reset>")
	send("score", false)
	
	tempTimer( 2, function () render_console("CharacterConsole", content_body["CharacterConsole"] ) end )
end
	
function refreshAbilities()
	if table.contains(GUI.Mute, "Character.Skills") == false then table.insert(GUI.Mute, "Character.Skills") end
	if table.contains(GUI.Mute, "Character.Exp") == false then table.insert(GUI.Mute, "Character.Exp") end
	if table.contains(GUI.Mute, "Character.Spells") == false then table.insert(GUI.Mute, "Character.Spells") end
	if table.contains(GUI.Mute, "Character.Align") == false then table.insert(GUI.Mute, "Character.Align") end
	--cecho("<sky_blue>updating abilities...<reset>")
	enableTrigger("Character.Skills")
	enableTrigger("Character.Exp")
	send("do exp; skills;", false)

	enableTrigger("Character.Spells")
	enableTrigger("Character.Align")
	send("do align; spells;", false)
	
	tempTimer( 2, function () render_console("AbilitiesConsole", menu_body["AbilitiesConsole"] ) end )
end

function refreshInventory()
	if table.contains(GUI.Mute, "Character.Inventory") == false then table.insert(GUI.Mute, "Character.Inventory") end
	--cecho("<sky_blue>updating inventory...<reset>")
	send("i", false)
	
	tempTimer( 2, function () render_console("InventoryConsole", menu_body["InventoryConsole"] ) end )
end

function refreshParty()
	--if table.contains(GUI.Mute, "Character.Abilities") == false then table.insert(GUI.Mute, "Character.Abilities") end
	--cecho("<sky_blue>updating party...<reset>")
	--send("do skills; spells;")
end

function refreshProgress()
	if table.contains(GUI.Mute, "Character.Score") == false then table.insert(GUI.Mute, "Character.Score") end
	--cecho("<sky_blue>updating progress...<reset>")
	enableTrigger("Character.Score")
	send("score", false)
end