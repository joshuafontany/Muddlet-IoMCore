if matches[2] then
	send( "examine " .. matches[2])
else
	send("do x; search;")
end