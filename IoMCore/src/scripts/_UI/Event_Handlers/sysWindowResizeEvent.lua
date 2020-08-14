-- function called by the temptimer to do the work
function GUI.handleWindowResize()
    if (GUI.window_width == nil or GUI.window_height == nil) or (GUI.window_width ~= x or GUI.window_height ~= y) then
       if GUI.UpdateBorderSizes() then
           GUI.RefreshResize()
       end
   end
end

-- sysWindowResizeEvent handler
function GUI.updatecontent( event, x, y )
   if( GUI.eventtimer ) then killTimer( GUI.eventtimer ) end
   GUI.eventtimer = tempTimer(0.1, [[killTimer( "GUI.eventtimer" ) GUI.handleWindowResize()]])
end

-- register our function as an event handler
registerAnonymousEventHandler("sysWindowResizeEvent", "GUI.updatecontent")