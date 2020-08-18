if matches[2] then
	if string.len(string.trim(matches[2])) == 0 then return end
	local function setGuild(gStr)
		local gArray = string.split(string.gsub(gStr, "%)", ""), " %(")
		if #gArray == 2 then
			local tierArray = {"alpha", "gamma", "bravo", "omicron"}
			for index = 1, #tierArray do
				local tier = tierArray[index]
				local gName = gArray[1]
				if table.contains(GUI.Lookup.Guilds[tier], gName) and tonumber(gArray[2]) then
					Character.Guilds[tier][gName] = gArray[2]
				end
			end
		end
	end		
	
	local lineArray = string.split(string.trim(matches[2]), ", ")
	if #lineArray > 1 then
		for index = 1, #lineArray do
			setGuild(lineArray[index])
		end
	else
		setGuild(lineArray[1])
	end
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end