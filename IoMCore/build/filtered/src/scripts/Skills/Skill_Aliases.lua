function skillAlias(alias)
	--echo(alias.."\n")
	local name = Character.Aliases.Skills[alias]
	if name == nil or name == "" then name = alias end
	return name
end

Character.Aliases.Skills = GUI.Aliases.Skills or {
	["sb"] = "spirit blessing",
	["wood"] = "scavenge wood",
	["fire"] = "fire building",
	["campfire"] = "build campfire",
	["hunt"] = "hunting"
}

GUI.Commands.Skills = GUI.Commands.Skills or {
	["spirit blessing"] = {[1]="Ally"},
	["scavenge wood"] = {},
	["fire building"] = {},
	["hunting"] = {},
	
}