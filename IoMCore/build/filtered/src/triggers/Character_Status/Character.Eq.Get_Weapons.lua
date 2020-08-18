if matches[2] and matches[3] then
    local name = matches[2]
    local slot = matches[3]
    Character.Eq.Weapons[name] = {}
    Character.Eq.Weapons[name]["slot"] = slot
    if table.contains(GUI.Mute, "Character.Eq") then
        deleteLine()
    end
    disableTrigger("Character.Eq.Eq_Header")
end