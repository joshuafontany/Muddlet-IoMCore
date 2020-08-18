if matches[2] and matches[3] and matches[4] then
	Character.Stats.Wis.Current = tonumber(matches[2])
	local val = matches[3]
	local num = GUI.Lookup.Growth[val]
	Character.Growth = tonumber(num)
	local pval = matches[4]
	local pnum = GUI.Lookup.Poisoned[pval]
	Character.Poisoned = tonumber(pnum)
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end