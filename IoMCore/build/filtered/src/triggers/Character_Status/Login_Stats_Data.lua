if multimatches[2][1] then
    local statArray = string.split(string.trim(multimatches[2][1]), "   ")
    for index = 1, #statArray do
        local item = statArray[index]
        local itemArray = string.split(item, ": ")
        --echo("Stat: "..itemArray[1].." Value: "..itemArray[2].."\n")
        local name = itemArray[1]
        local value = tonumber(string.format("%i", itemArray[2]))
        if not Character.Stats[name] then Character.Stats[name] = {} end
        Character.Stats[name].Base = value
        Character.Stats[name].Current = value
    end
end