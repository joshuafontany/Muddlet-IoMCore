function Character_io(event)
    if event == "Load" then
        cecho("<green>sys<DimGrey>:<white> Character Data Loading..\n")
        if not json then
            cecho("<firebrick>json<DimGrey>:<white> json Not Loaded\n")
            end
        if GUI.Initialized == false then
            cecho("<firebrick>sys<DimGrey>:<white> GUI not initialized\n")
        end
        --test for character and party files
        
        if json and GUI.Initialized == true then
            local Temp = {Character= {}, Party = {}, Hotkeys = {}}
            Temp.Character = sys.table(Character.Name..".Character", Character, event)
            Temp.Party = sys.table(Character.Name..".Party", Party, event)
              Temp.Hotkeys = sys.table(Character.Name..".Hotkeys", Hotkeys, event)
            if Temp.Character == nil or Temp.Party == nil then
                cecho("<firebrick>sys<DimGrey>:<white> Character_load() error with sys.table()\n")
                return nil
            elseif Temp.Character == false then  			
                local saveCharacter = sys.table(Character.Name..".Character", Character, "Save")
                local saveParty = sys.table(Character.Name..".Party", Party, "Save")
                  local saveHotkeys = sys.table(Character.Name..".Hotkeys", Hotkeys, "Save")
                if saveCharacter == true and saveParty == true and saveHotkeys == true then
                      cecho("<green>sys<DimGrey>:<white> New Save Data created for "..Character.Name.."\n")
                  end
                return false
            else
                Character = table.deepcopy(Temp.Character)
                Party = table.deepcopy(Temp.Party)
                  Hotkeys = table.deepcopy(Temp.Hotkeys)
                cecho("<green>sys<DimGrey>:<white> Character Data for "..Character.Name.." loaded.\n")
                return true
            end	
        end
      elseif event == "Save" then
          local saveCharacter = sys.table(Character.Name..".Character", Character, "Save")
        local saveParty = sys.table(Character.Name..".Party", Party, "Save")
          local saveHotkeys = sys.table(Character.Name..".Hotkeys", Hotkeys, "Save")
        if saveCharacter == true and saveParty == true then cecho("<green>sys<DimGrey>:<white> Data saved for "..Character.Name.."\n") end
      end	
  end