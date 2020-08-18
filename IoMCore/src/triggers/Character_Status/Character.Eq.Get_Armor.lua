if matches[2] and matches[3] then
    local name = matches[2]
    Character.Eq.Armor[name] = {
        worn = false,
        kept = false,
        slot = ""
    }
    local tagString = string.trim(matches[3])
    if string.match(tagString, "%(([%w%s]+)%)") ~= nil then
        for tag in string.gmatch(tagString, "%(([%w%s]+)%)") do
            if 
                tag == "worn" then Character.Eq.Armor[name]["worn"] = true 
        elseif
                tag == "kept" then Character.Eq.Armor[name]["kept"] = true
            else
                local item = Character.Eq.Armor[name]
                item.slot = tag
            end
        end
    end
    
    if table.contains(GUI.Mute, "Character.Eq") then
    deleteLine()
    end
    end