GUI.FlashTimers = GUI.FlashTimers or {}
GUI.Flashing = GUI.Flashing or {}

function flashButtonBox(name, time, delay)
	time = time or 1
	delay = delay or 1
	--setup "flashing" state
	if GUI.Flashing[name] ~= true or not GUI.Flashing[name] then
		GUI[name]:flash(time)
		GUI.Flashing[name] = true
		if GUI.FlashTimers[name] then killTimer(GUI.FlashTimers[name]) end		
		GUI.FlashTimers[name] = tempTimer(delay, [[
  		GUI["]]..name..[["]:flash(]]..time..[[)
  		GUI.Flashing["]]..name..[["] = false 
		]] )				
	end
end