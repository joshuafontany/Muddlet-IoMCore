if matches[2] then
    test = string.starts(matches[2], Character.RDMPCode.."")
    --if (test) then echo("True") else echo ("False") end
    if(test) then
        if table.contains(GUI.CustomChannels, "RDMP") then
            selectString("RDMP "..Character.RDMPCode.." ", 1)
            replace("")
          selectCurrentLine()
          copy()
          appendBuffer("ChatCustomConsole")
        end
        doRDMP(matches[2])
        deleteLine()
    end
  end