function castSpell(name, userArgs) 
    if name then
          if userArgs == nil then
              userArgs = {}
          end
          local args = GUI.Commands.Spells[name]
          if not args then args = {} end
          --display(args)
          cmd = "cast "..name
          
          if #args > 0 then	
              cmd = cmd.." on "..Character.Selector
          end
          for index = 1, #args do
              if userArgs[index] then
                  cmd = cmd.." "..userArgs[index]
              else
                  local t = args[index]
                  if t == "Enemy" and (Character.Enemy == "" or Character.Enemy == "No Enemy") then
                      t = "Target"
                  elseif t == "Ally" and (Character.Ally == nil or Character.Ally == "") then
                      t = "Name"
                  end 
                  if Character[t] then cmd = cmd.." "..Character[t] end
              end
          end
          Character.ActiveSkill = ""
          Character.ActiveSpell = name
          send(cmd)
      end
  end