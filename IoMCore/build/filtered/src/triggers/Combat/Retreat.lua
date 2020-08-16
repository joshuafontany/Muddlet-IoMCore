local cmd = "do"
if Character.ActiveSkill ~= "" and Character.ActiveSkill ~= nil then
    Character.ActiveSkill = ""
    cmd = cmd.." use stop;"
elseif Character.ActiveSpell ~= "" and Character.ActiveSpell ~= nil then
    Character.ActiveSpell = ""
    cmd = cmd.." cast stop;"
end
if cmd ~= "do" then
    send(cmd)
end
flashButtonBox("BoxEnemy", 0.5, 1)
tempTimer( 2, function () flashButtonBox("BoxEnemy", 0.5, 1) end )
tempTimer( 4, function () GUI.resetEnemy() end )