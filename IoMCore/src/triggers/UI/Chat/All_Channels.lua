if GUI.CaptureChat == true then
    echo("/n"..tostring(table.contains(GUI.Channels, matches[3])))
    if matches[3] ~= Party.Name and table.contains(GUI.Channels, matches[3]) and not table.contains(GUI.CustomChannels, matches[3]) then
        selectString(matches[2], 1)
        setBold(true)
        resetFormat()
        selectCurrentLine()
        copy()
        appendBuffer("ChatAllConsole")
        deleteLine()
        if GUI.CurrentChat ~= "BoxChatAll" then
            flashButtonBox("BoxChatAllIcon", 0.25, 0.5)
        end
    elseif table.contains(GUI.CustomChannels, matches[3]) then
        selectString(matches[2], 1)
        setBold(true)
        resetFormat()
        selectCurrentLine()
        copy()
        appendBuffer("ChatCustomConsole")
        deleteLine()
        if GUI.CurrentChat ~= "BoxChatCustom" then
            flashButtonBox("BoxChatCustomIcon", 0.25, 0.5)
        end
    elseif matches[3] == Party.Name then
        selectString(matches[2], 1)
        setBold(true)
        resetFormat()
        selectCurrentLine()
        copy()
        appendBuffer("ChatPartyConsole")
        deleteLine()
        if GUI.CurrentChat ~= "BoxChatParty" then
            flashButtonBox("BoxChatPartyIcon", 0.25, 0.5)
        end
    end
  end