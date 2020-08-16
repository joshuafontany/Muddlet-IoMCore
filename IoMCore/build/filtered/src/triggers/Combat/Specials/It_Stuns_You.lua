if Character.ActiveSkill and Character.ActiveSkill ~= "" then
	cecho("\n<sky_blue>Retrying "..Character.ActiveSkill"...<reset>\n")
	useSkill(Character.ActiveSkill)
elseif Character.ActiveSkpell and Character.ActiveSpell ~= "" then
	cecho("\n<sky_blue>Recasting "..Character.ActiveSpell"...<reset>\n")
	castSpell(Character.ActiveSpell)
end