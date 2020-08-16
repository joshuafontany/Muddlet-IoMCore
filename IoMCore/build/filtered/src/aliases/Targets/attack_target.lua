if matches[2] then
	Character.Target = matches[2]
	send("kill "..Character.Selector.." "..Character.Target)
elseif Character.Enemy ~= "No Enemy" then
	send("kill "..Character.Selector.." "..Character.Enemy)
elseif Character.Target ~= "" then
	send("kill "..Character.Selector.." "..Character.Target)
else
cecho("<sky_blue>No Enemy or Target provided...")
end