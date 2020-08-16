local cmd = "do"
    if Character.ActiveSkill ~= "" and Character.ActiveSkill ~= nil then
        Character.ActiveSkill = ""
        cmd = cmd.." use stop;"
    elseif Character.ActiveSpell ~= "" and Character.ActiveSpell ~= nil then
        Character.ActiveSpell = ""
        cmd = cmd.." cast stop;"
    end
    if Character.Loot == true then
        if Character.EatCorpses == true then
            cmd = cmd.." loot; eat first corpse;"
        elseif Character.DigGrave == true then
            cmd = cmd.." loot; dig grave;"
        end
    elseif Character.EatCorpses == true then
        cmd = cmd.." eat first corpse;"
    elseif Character.DigGrave == true then
        cmd = cmd.." dig grave;"
    end
    --display(GUI.Mute)
    enableTrigger("Character.Exp")
    if table.contains(GUI.Mute, "Character.Exp") == false then table.insert(GUI.Mute, "Character.Exp") end
    if table.contains(GUI.Mute, "Character.Inventory") == false then table.insert(GUI.Mute, "Character.Inventory") end
    cmd = cmd.." exp; i;"
    cecho("\n<sky_blue>Looting...<reset>")
    send(cmd, GUI.Debug)
    flashButtonBox("BoxEnemy", 0.25, 0.5)