--Sets a custom prompt specific to Ilsands of Mtyh

--[[
		complex prompt for use without GUI
		local promptCode = "%^BOLD%^%^GREEN%^%N%^RESET%^ %^CYAN%^%x%^RESET%^(%X) %^ORANGE%^%G%^RESET%^g%RHP%^BOLD%^%^GREEN%^%h%^RESET%^/%^BOLD%^%^GREEN%^%H%^RESET%^ SP%^BOLD%^%^CYAN%^%s%^RESET%^/%^BOLD%^%^CYAN%^%S%^RESET%^ EP%^BOLD%^%^MAGENTA%^%e%^RESET%^/%^BOLD%^%^MAGENTA%^%E%^RESET%^ %^BOLD%^%^GREEN%^$%^RESET%^"
	]]
	
-- simple prompt for use with GUI

local promptCode = "%^BOLD%^%^GREEN%^$%^RESET%^"
function setPrompt()
	send("prompt '"..promptCode.."'")
end