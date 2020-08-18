if matches[2] and matches[3] and matches[4] and matches[5] then
	Character.Stats.Str.Current = tonumber(matches[2])
	Character.Hp.Current = tonumber(matches[3])
	Character.Hp.Max = tonumber(matches[4])
	local val = matches[5]
	local num = GUI.Lookup.AC[val]
	--echo("AC:"..val.."("..num..")\n")
	Character.AC = tonumber(num)
end

if table.contains(GUI.Mute, "Character.Score") then
selectCurrentLine()
deleteLine()
end