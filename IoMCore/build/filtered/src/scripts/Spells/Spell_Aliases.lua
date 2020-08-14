function spellAlias(alias)
	--echo(alias.."\n")
	local name = Character.Aliases.Spells[alias]
	if name == nil or name == "" then name = alias end
	return name
end

Character.Aliases.Spells = GUI.Aliases.Spells or {
	["sw"] = "spirit wind",
	["grow"] = "magical growth"
}

GUI.Commands.Spells = GUI.Commands.Spells or {
	["spirit wind"] = {[1]="Enemy"},
	["magical growth"] = {[1]="Ally"}
}