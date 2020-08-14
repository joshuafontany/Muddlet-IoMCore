function GUI.RefreshResize()

    for index = 1, #GUI.icons do
        local icon = GUI.icons[index]
        --echo(string.format("%s, %d, %d\n", icon, GUI.button_height, GUI.button_height))
        GUI[icon]:resize(GUI.button_height, GUI.button_height)
    end
    
    for index = 1, #GUI.greys do
        local grey = GUI.greys[index]
        local boxName = string.split( grey, "Grey")[1]
        --display(boxName)
        --echo(grey.." "..boxName.."\n")			
        GUI[grey]:resize(GUI[boxName]:get_width(), GUI.button_height)
    end
    
    --[[for index = 1, #GUI.gauges do
        local gauge = GUI.gauges[index]
        local wrapper = gauge.."Wrapper"
        GUI[gauge]:resize(GUI[wrapper]:get_width(), GUI[wrapper]:get_height())
        GUI[gauge]:move(GUI[wrapper]:get_x(), GUI[wrapper]:get_y())
    end]]
    
    local boxname = ""
    for index = 1, #GUI.consoles do
        local console = GUI.consoles[index]
        if table.contains(chat_consoles, console) then
            boxname = "ChatBox"
        elseif table.contains(content_consoles, console) then
            boxname = "ContentBox"
        elseif table.contains(menu_consoles, console) then
            boxname = "MenuBox"
        end
        --seperate the types if we need it later
        if GUI[console].type == "miniConsole" then
            GUI[console]:resize(GUI[boxname]:get_width()-tonumber(string.format("%.0f", GUI.ContentBox:get_width()*0.02)), 
                GUI[boxname]:get_height()-tonumber(string.format("%.0f", GUI.ContentBox:get_width()*0.02)))
            GUI[console]:move(GUI[boxname]:get_x()+tonumber(string.format("%.0f", GUI.ContentBox:get_width()*0.02)), 
                GUI[boxname]:get_y()+tonumber(string.format("%.0f", GUI.ContentBox:get_width()*0.02)))
            GUI[console]:setFontSize(GUI.ConsoleFontSize)
        elseif GUI[console].type == "container" or GUI[console].type == "mapper" then
            GUI[console]:resize(GUI[boxname]:get_width(), GUI[boxname]:get_height())
            GUI[console]:move(GUI[boxname]:get_x(), GUI[boxname]:get_y())
        end
    end
    
    on_chat_box_press(GUI.CurrentChat)
    on_content_box_press(GUI.CurrentContent)
    on_menu_box_press(GUI.CurrentMenu)
end