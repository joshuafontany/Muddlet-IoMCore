if matches[2] then
	local cmdArr = {}
	local target
	if string.match(matches[2], " at ") ~= nil then
		cmdArr = string.split(matches[2], " at ")		
	elseif string.match(matches[2], " on ") ~= nil then
		cmdArr = string.split(matches[2], " on ")
	else
		cmdArr = {matches[2]}
	end
	if #cmdArr > 1 then
		targetArr = string.split(cmdArr[2], " ")
	else
		targetArr = {}
	end
	--display(cmdArr)
	local name = cmdArr[1]
	name = spellAlias(name)
	castSpell(name, targetArr)
end