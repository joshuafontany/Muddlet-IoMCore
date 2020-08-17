--json.encode(table, {indent = ##})
--json.decod(string)

if not json then
	cecho("<green>json<DimGrey>:<white> Loading modules...\n")

	local resourcesURL = ""
	homeDirectory = getMudletHomeDir():gsub("\\", "/")
	local homeDirectoryTable = homeDirectory:split("/profiles")
	resourceDirectory = string.format("%s/%s", homeDirectoryTable[1], [[resources/IoMCore]])
	
	local fileInfo = lfs.attributes(resourceDirectory)
	if fileInfo and fileInfo.mode == "directory" then
		--display(fileInfo) -- to see the detailed information
	else
		echo("The Resource path is invalid (file/directory doesn't exist)...")
		echo("Downloading Resources from: "..resourcesURL)
	end

	local path = package.path	
	local luaDirectory = string.format("%s/%s", resourceDirectory, [[libraries/?.lua]])
	package.path = string.format("%s;%s;%s", resourceDirectory, luaDirectory, path)

	local okay, content = pcall(require, "json")
	if okay then
		json = content
	else
		cecho(string.format("<firebrick>json<DimGrey>:<white>  Error loading module: %s.\n", content))
	end
	if json then
		cecho("<green>json<DimGrey>:<white> Resources successfully loaded.\n")
		tempTimer( 1, function () raiseEvent( "jsonLoadEvent" ) end )
	end
end


function sys.echo(stuff)
  stuff = stuff or ""
  moveCursorEnd("main") if getCurrentLine() ~= "" then echo"\n" end
  cecho("<DimGrey>(<slate_grey>sys<DimGrey>)<DimGrey>:<white> " .. tostring(stuff))
  echo("\n")
end -- function

function sys.save(n, t)
	if string.find(getMudletHomeDir(), "/") then _sep = "/" else  _sep = "\\" end
	local f = getMudletHomeDir() .. _sep .. "IoMCore" .. _sep .. "data" .. _sep .. n .. ".json"
	--table.save(f, t)
	--if io.exists(f) then
  	local str = json.encode (t, { indent = 2 })
  	local file,err = io.open(f, "w")
    if file and err == nil then
        file:write(str)
        file:close()
				cecho("<green>saved<DimGrey>:<white> " .. f.."\n")
				return true
    else
        cecho("<firebrick>save failed<DimGrey>:<white> "..err.."\n")
				return false
    end
	--end
end -- function

function sys.load(n, t)
	if string.find(getMudletHomeDir(), "/") then _sep = "/" else  _sep = "\\" end
	local f = getMudletHomeDir() .. _sep .. "IoMCore" .. _sep .. "data" .. _sep .. n .. ".json"
	if io.exists(f) then
		--table.load(f, t)
		local file = io.open(f)
    local s = file:read("*a")
    file:close()
		local obj, pos, err = json.decode (s, 1, nil)
    if err then
      cecho ("<firebrick>Error<DimGrey>:<white> ".. err.."\n")
			return nil
    else
		 cecho("<green>loaded<DimGrey>:<white> " .. f.."\n")
		 --display(t)
		 return obj
    end
	else
		sys.echo("<firebrick>load failed<DimGrey>:<white> " .. f .. " does not exist.\n")
		return false
	end -- if
end -- function

function sys.init(event)
	if event == "sysLoadEvent" then
		initGUI()
	elseif event == "sysExitEvent" then
		local characterSaved = sys.table(Character.Name..".Character", Character, "Save")
		local partySaved = sys.table(Character.Name..".Party", Party, "Save")
		local hotkeysSaved = sys.table(Character.Name..".Hotkeys", Hotkeys, "Save")
		if characterSaved and partySaved and hotkeysSaved then
			cecho("<green>exit<DimGrey>:<white> SAVE SUCCESSFUL!\n")
		end
	end
end -- function

function sys.table(loc, table, event)
	if event == "Load" then
		local result = sys.load(loc, table)
  	return result
	elseif event == "Save" then
		return sys.save(loc, table)
	end
end