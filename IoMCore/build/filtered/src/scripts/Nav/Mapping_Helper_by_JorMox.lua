mapAddOns = mapAddOns or {}

local function safeDelete(ids)
    for _, id in ipairs(ids) do
        id = tonumber(id)
        local rooms = {}
        for _, room in ipairs(getAllRoomEntrances(id)) do
            for dir, exit in pairs(getRoomExits(room)) do
                if exit == id then
                    if rooms[room] then
                        if type(rooms[room]) == "table" then
                            table.insert(rooms[room],dir)
                        else
                            rooms[room] = {rooms[room], dir}
                        end
                    else
                        rooms[room] = dir
                    end
                end
            end
        end
        deleteRoom(id)
        for rid, dirs in pairs(rooms) do
            if type(dirs) == "table" then
                for _, dir in ipairs(dirs) do
                    setExitStub(rid, dir, true)
                end
            else
                setExitStub(rid, dirs, true)
            end
        end
    end
    updateMap()
end

local keys = {['1'] = 'sw', ['2'] = 's', ['3'] = 'se', ['4'] = 'w', ['5'] = 'done', ['6'] = 'e', ['7'] = 'nw',
    ['8'] = 'n', ['9'] = 'ne', ['Plus'] = 'd', ['Minus'] = 'u'}
mapAddOns.keysEnabled = false
mapAddOns.keyIds = mapAddOns.keyIds or {}
mapAddOns.roomIds = mapAddOns.roomIds or {}

local function toggleMapKeys()
    mapAddOns.keysEnabled = not mapAddOns.keysEnabled
    if mapAddOns.keysEnabled then
        for key, val in pairs(keys) do
            table.insert(mapAddOns.keyIds, tempKey(mudlet.keymodifier.Keypad, mudlet.key[key],
                string.format("raiseEvent('tempMapKey','%s')",val)))
        end
    else
        for _,id in ipairs(mapAddOns.keyIds) do
            killKey(id)
        end
        mapAddOns.keyIds = {}
    end
end

local coordmap = {
    n = {0,1,0},    ne = {1,1,0},   nw = {-1,1,0},  e = {1,0,0},    w = {-1,0,0},
    s = {0,-1,0},   se = {1,-1,0},  sw = {-1,-1,0}, u = {0,0,1},    d = {0,0,-1},
}

local function shiftRooms(dir)
    local dx,dy,dz = unpack(coordmap[dir])
    for _,id in ipairs(mapAddOns.roomIds) do
        local x,y,z = getRoomCoordinates(id)
        setRoomCoordinates(id,x+dx,y+dy,z+dz)
    end
    updateMap()
end

function mapAddOns.eventHandler(event, mapEvent, ...)
    if event == "mapAddOnEvent" then
        if mapEvent == "safeDelete" then
            safeDelete(arg)
        elseif mapEvent == "shiftRooms" then
            mapAddOns.roomIds = arg
            toggleMapKeys()
            cecho("\n<green>Please use the keypad keys to shift the selected rooms around.<reset>")
        elseif mapEvent == "teleportHere" then
            if arg.n == 1 then
                centerview(arg[1])
            else
                cecho("\n<red>Cannot teleport to multiple rooms at once.<reset>")
            end
        end
    elseif event == "tempMapKey" and mapAddOns.keysEnabled then
        if mapEvent == "done" then
            toggleMapKeys()
            mapAddOns.roomIds = {}
            cecho("\n<green>Room shifting completed.<reset>")
        else
            shiftRooms(mapEvent)
        end
    elseif event == "mapOpenEvent" then
        local events = {safeDelete = "safe delete", shiftRooms = "shift rooms", teleportHere = "teleport here"}
        local mapEvents = getMapEvents()
        for event, name in pairs(events) do
            if not mapEvents[event] then
                addMapEvent(event, "mapAddOnEvent","",name)
            end
        end
    end
end

registerAnonymousEventHandler("mapAddOnEvent","mapAddOns.eventHandler")
registerAnonymousEventHandler("tempMapKey","mapAddOns.eventHandler")
registerAnonymousEventHandler("mapOpenEvent","mapAddOns.eventHandler")