function render_console(console_value, section_table)
	--echo(console_value)
	--display(section_table)
	if section_table ~= nil then
		clearWindow(console_value)
    for index = 1, #section_table do
			section_table[index](console_value)
			--old code to replace GUI.colors, now in every section_table
			--console_string = string.gsub(section_table[index](), "%$([%w_]+)", GUI.colors).."\n"
  	end
	end
end