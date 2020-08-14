function GUI.disconnected()
	killAllTabTimers()
	-- other stuff --
	
end



-- register our function as an event handler
registerAnonymousEventHandler("sysDisconnectionEvent", "GUI.disconnected")