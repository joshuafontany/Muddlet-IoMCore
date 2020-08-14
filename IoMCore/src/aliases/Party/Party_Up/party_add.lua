names = {}
s = matches[2]
for substring in s:gmatch("%S+") do
   table.insert(names, substring)
end
display(names)

for i = 1, #names do
  name = names[i]
	if table.find(Party.Roster, name) ~= true then
		table.insert(Party.Roster, name)
	end
end

echo("Party (" .. #Party.Roster .. ")")
display(Party.Roster)