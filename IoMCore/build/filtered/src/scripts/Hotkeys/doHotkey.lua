Hotkeys = Hotkeys or {
	[1] = {1, "sw", {}},
	[2] = {2, "sb", {"myself"}},
	[3] = {3, "dance", {}},
	
}

HotKey0 = {3, "cast stop", {}}

function doHotkey(index)
	echo("Hotkey "..index)
  if index == 0 then
  	local func = Hotkey0[1]
  	local cmd = Hotkey0[2]
  	local args = Hotkey0[3]
		hotkey_functions[func](cmd, args)
  else
  	local func = Hotkeys[index][1]
  	local cmd = Hotkeys[index][2]
  	local args = Hotkeys[index][3]
		hotkey_functions[func](cmd, args)
	end
end

hotkey_functions={
	[1] = function(cmd, args) castSpell(spellAlias(cmd), args) end,
	[2] = function(cmd, args) useSkill(skillAlias(cmd), args) end,
	[3] = function(cmd, args) send(cmd) end,

}