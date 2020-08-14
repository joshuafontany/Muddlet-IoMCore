--table.find()
function table.find(t, val, recursive, metatables, keys, returnBool)
    if (type(t) ~= "table") then
        return nil
    end

    local checked = {}
    local _findInTable
    local _checkValue
    _checkValue = function(v)
        if (not checked[v]) then
            if (v == val) then
                return v
            end
            if (recursive and type(v) == "table") then
                local r = _findInTable(v)
                if (r ~= nil) then
                    return r
                end
            end
            if (metatables) then
                local r = _checkValue(getmetatable(v))
                if (r ~= nil) then
                    return r
                end
            end
            checked[v] = true
        end
        return nil
    end
    _findInTable = function(t)
        for k,v in pairs(t) do
            local r = _checkValue(t, v)
            if (r ~= nil) then
                return r
            end
            if (keys) then
                r = _checkValue(t, k)
                if (r ~= nil) then
                    return r
                end
            end
        end
        return nil
    end

    local r = _findInTable(t)
    if (returnBool) then
        return r ~= nil
    end
    return r
end