if matches[2] then
    local section = string.trim(matches[2])
    GUI.InvSection = section
    Character.Inventory[section] = {}
    
    selectString(section, 1)
    local r,g,b = getBgColor()
    echo("bg: "..r..","..g..","..b.." ")
    Character.InventoryHeadersBg[section] = {["r"] = tonumber(r), ["g"] = tonumber(g), ["b"] = tonumber(b)}
    r,g,b = getFgColor()
    echo("fg: "..r..","..g..","..b.."\n")
    Character.InventoryHeadersFg[section] = {["r"] = tonumber(r), ["g"] = tonumber(g), ["b"] = tonumber(b)}
    
    if table.contains(GUI.Mute, "Character.Inventory") then
            selectCurrentLine()
        deleteLine()
    end
end