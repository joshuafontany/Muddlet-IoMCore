if matches[2] and matches[3] then
    local section = GUI.InvSection
    local start, stop = string.find(matches[3], "%(")
    local objName = ""
    if start then
        objName = string.trim(string.cut(string.trim(matches[3]), start-1))
    else
        objName = string.trim(matches[3])
    end
    local obj = {
        name = objName,
        quantity = tonumber(matches[2]),
        ["section"] = section,
        kept = not not string.match(matches[3], "kept"),
        worn = not not string.match(matches[3], "worn"),
        wielded = not not string.match(matches[3], "wielded")
    }
    --display(section)
    table.insert(Character.Inventory[section], obj)
    if table.contains(GUI.Mute, "Character.Inventory") then
    selectCurrentLine()
        deleteLine()
    end
end