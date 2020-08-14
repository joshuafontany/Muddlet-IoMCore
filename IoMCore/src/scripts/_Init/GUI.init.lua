-- Setup all of our lobal objects here --

-- These tables are saved to Json
Character = Character or {}

Party = Party or {}
	Party.Roster = Party.Roster or {}

-- Not saved
GUI = GUI or {}
	GUI.Initialized = false
	GUI.Debug = GUI.Debug or false
	GUI.icons = GUI.icons or {}
	GUI.greys = GUI.greys or {}
	GUI.consoles = GUI.consoles or {}
	GUI.gauges = GUI.gauges or {}
	GUI.colors = GUI.colors or 
		{
  		header = "purple",
			subheader = "purple",
    	item = "medium_purple",
			eq_item = "DarkOrchid",
    	value = "light_grey",
    	bonus = "lime_green",
    	penalty = "red",
			combat_crit = "LimeGreen",
			combat_enemycrit = "OrangeRed",
			skill_start = "DeepSkyBlue",
			skill_ready = "DeepSkyBlue",
			spell_start = "MediumPurple",
			spell_ready = "MediumPurple",
		}
	GUI.ConsoleFontSize = GUI.ConsoleFontSize or 10
	GUI.FontSize = GUI.FontSize or 3
		
	GUI.Aliases = GUI.Aliases or {}
	GUI.Commands = GUI.Commands or {}
	GUI.Mute = GUI.Mute or {}
	GUI.CaptureChat = GUI.CaptureChat or true
	GUI.HideTells = GUI.HideTells or false
	
	GUI.InvSection = GUI.InvSection or ""
	GUI.InventoryHidEq = GUI.InventoryHidEq or false


RDMP = RDMP or {}
	RDMP.handlers = RDMP.handlers or {}
	
sys = sys or {};