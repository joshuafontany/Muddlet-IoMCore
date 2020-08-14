RDMP.handlers = 
		{
			HEALTH = function() doRDMP_Health() end,
			PARTY_HEALTH = function() doRDMP_PHealth() end,
			MONSTER_HEALTH = function() doRDMP_MHealth() end,
			TARGET_DEATH = function() doRDMP_TDeath() end,
			MONSTER_DEATH = function() doRDMP_MDeath() end,
			default = function() doRDMP_Default() end
		}

function doRDMP(data)
	RDMP.line = data
	RDMP.args = data:split(" ")
	switch(RDMP.args[2], RDMP.handlers)()
end

function doRDMP_Default()
	display(RDMP.args)
end

function doRDMP_Health()
	--display(RDMP.args)
	Character["Hp"] = {Current = tonumber(RDMP.args[3]), Max = tonumber(RDMP.args[4])}
	Character["Sp"] = {Current = tonumber(RDMP.args[5]), Max = tonumber(RDMP.args[6])}
	Character["Ep"] = {Current = tonumber(RDMP.args[7]), Max = tonumber(RDMP.args[8])}
	Character["Hunger"] = tonumber(RDMP.args[9])
	update_statusbars()
end

function doRDMP_PHealth()
	--display(RDMP.args)
	stringArray = {}
	for i=3,#RDMP.args do	
    table.insert(stringArray, RDMP.args[i])
  end
	string = table.concat(stringArray, " ")
	selectCurrentLine()
	copy()
	appendBuffer("ChatPartyStatusConsole")
end

function doRDMP_MHealth()
	--display(RDMP.args)
	
	if #RDMP.args == 4 then
		enemyName = RDMP.args[3]
		Character.Enemy = enemyName
	elseif #RDMP.args > 4 then
		enemyName = {}
		for i=3,#RDMP.args-1 do	
    	table.insert(enemyName, RDMP.args[i])
  	end
		Character.Enemy = table.concat(enemyName, " ")
	end
	enemyHp = RDMP.args[#RDMP.args]
	Character.EHp = tonumber(enemyHp)
	GUI.EHpBar:setValue(Character.EHp)
	GUI.EHpBarLabel:echo("<b>"..Character.Enemy.." ("..Character.EHp.."%)</b>")
end

function doRDMP_TDeath()
	Character.Enemy = "No Enemy"
	Character.EHp = 0
	GUI.EHpBar:setValue(Character.EHp)
	GUI.EHpBarLabel:echo("<b>"..Character.Enemy.." ("..Character.EHp.."%)</b>")
end

function doRDMP_MDeath()
	--[[stringArray = {}
	for i=3,#RDMP.args do	
    table.insert(stringArray, RDMP.args[i])
  end
	string = table.concat(stringArray, " ")
	send("p' "..string)]]
end