local refresh = false
local npc_matches = {
	"Sisong says",
}

local prompt_matches = {
	"^Help topic%\?",
	"^%[[%w%d%\?]+%]",
	"^%[(%d+) of (%d+)%] mail:",
	"^Please answer Y for yes or N for no:",
	"How much%\? "
}

if GUI.TabRefresh == false then
  if table.contains(npc_matches, matches[2]) then
  	--echo ("npc?")
  	refresh = true
  elseif isPrompt() then
  	--echo ("prompt?")
		selectCurrentLine()
		local prompt = getSelection()
		--display(prompt)
		for i = 1, #prompt_matches do
			local test = prompt_matches[i]
			--display(string.match(prompt, test))
			if string.match(prompt, test) ~= nil then
				return false
			end
		end
  	refresh = true
  end
  if refresh == true then
  	GUI.TabRefresh = true
    on_chat_box_press(GUI.CurrentChat)
    on_content_box_press(GUI.CurrentContent)
    on_menu_box_press(GUI.CurrentMenu)
    disableTrigger("Resume_Tab_Refresh")
    enableTrigger("Pause_Tab_Refresh")
  	cecho("<sky_blue>Resuming tab refresh...<reset>\n")
  end
end
deselect()
moveCursorEnd()