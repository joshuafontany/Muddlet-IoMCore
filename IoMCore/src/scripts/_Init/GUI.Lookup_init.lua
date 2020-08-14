function testColors(t)
	for k,v in pairs(t) do
		cecho("<"..v..">TEST:"..v.." "..k.."<reset>\n")
	end
end

function lookupHunger(h)
	if not h then return "Starved" end
	for index = 1, #GUI.Lookup.HungerBreaks-1 do
		local i = GUI.Lookup.HungerBreaks[index]
		if i <= h and h < GUI.Lookup.HungerBreaks[index+1] then
			return GUI.Lookup.Hunger[i]
		elseif h == 100 then
			return GUI.Lookup.Hunger[h]
		end
	end
end

function lookupHungerColor(h)
	local hungerWord = lookupHunger(h)
	local colorWord = GUI.Lookup.HungerColors[hungerWord] or ""
	--echo(colorWord.." "..h.."\n")
	return colorWord
end

function lookupCapacityColor(c)
	if c > 0 and c <= 25 then
		return "lime_green"
	elseif c < 50 then
		return "yellow_green"
	elseif c < 75 then
		return "yellow"
	elseif c < 85 then
		return "dark_orange"
	else
		return "red"
	end
end

--Mud Specific Values

GUI.Lookup = GUI.Lookup or
	{
		StatAb = {
      ["Str"] = "Strength", ["Strength"] = "Str",
      ["Dex"] = "Dexterity", ["Dexterity"] = "Dex",
      ["Con"] = "Constitution", ["Constitution"] = "Con",
      ["Sta"] = "Stamina", ["Stamina"] = "Sta",
      ["Wis"] = "Wisdom", ["Wisdom"] = "Wis",
      ["Int"] = "Intelligence", ["Intelligence"] = "Int",
      ["Cha"] = "Charisma", ["Charisma"] = "Cha", 
		},
		Poisoned = {
			[0] = "No", ["No"] = 0,
			[1] = "Yes", ["Yes"] = 1
		},
		PoisonedColors = { [0] = "lime_green", [1] = "red"},
		Hiding = {
			[0] = "No", ["No"] = 0,
			[1] = "Yes", ["Yes"] = 1
		},
		HidingColors = { "$value", "yellow"},
		Growth = {
			[0] = "Growing", ["Growing"] = 0,
			[1] = "Full", ["Full"] = 1
		},
		GrowthColors = {[0] = "yellow", [1] = "lime_green"},
		Hunger = {
      [100] = "Stuffed",
      [95] = "Full",
      [75] = "Content",
      [50] = "Peckish",
      [20] = "Hungry",
      [10] = "Craving",
      [2] = "Starving",
			[0] = "Starved"
		},
		HungerBreaks = {0, 2, 10, 20, 50, 75, 95, 100},
		HungerColors = {
			["Stuffed"] = "lime_green",
			["Full"] = "green_yellow",
			["Content"] = "yellow",
			["Peckish"] = "dark_orange",
			["Hungry"] = "orange_red",
			["Craving"] = "red",
			["Starving"] = "purple",
			["Starved"] = "magenta"
		},
		Alignment = {
      [10] = "God Like", ["God Like"] = 10,
      [9] = "Saint", ["Saint"] = 9,
      [8] = "Holy man", ["Holy man"] = 8,
      [7] = "Good", ["Good"] = 7,
      [6] = "Sli. Good", ["Sli. Good"] = 6,
      [5] = "Neutral", ["Neutral"] = 5,
      [4] = "Sli. Evil", ["Sli. Evil"] = 4,
      [3] = "Evil", ["Evil"] = 3,
      [2] = "Very Evil", ["Very Evil"] = 2,
      [1] = "Demonic", ["Demonic"] = 1,
      [0] = "Satanic", ["Satanic"] = 0
		},
		AlignColors = {
			[0] = "purple",
			[1] = "red",
			[2] = "orange_red",
			[3] = "dark_orange",
			[4] = "goldenrod",			
			[5] = "light_goldenrod",
			[6] = "beige",
			[7] = "bisque",			
			[8] = "lavender_blush",
			[9] = "lavender",
			[10] = "azure"
		},
		AC = {
      [0] = "None", ["None"] = 0,
      [1] = "Low", ["Low"] = 1,
			[2] = "VLow", ["VLow"] = 2,
      [3] = "Avg", ["Avg"] = 3,
      [4] = "High", ["High"] = 4,
      [5] = "Vhigh", ["Vhigh"] = 5,
      [6] = "Great", ["Great"] = 6,
      [7] = "Super", ["Super"] = 7,
      [8] = "BEST", ["BEST"] = 8
		},
		ACColors = {
      [0] = "dark_orange",
      [1] = "orange",
      [2] = "yellow",
      [3] = "green_yellow",
      [4] = "lime_green",
      [5] = "spring_green",
      [6] = "turquoise",
      [7] = "aquamarine",
		},
		Damage = {
      [0] = "None", ["None"] = 0,
      [1] = "Almost nothing", ["Almost nothing"] = 1,
      [2] = "Negligible", ["Negligible"] = 2,
      [3] = "Noticeable", ["Noticeable"] = 3,
      [4] = "Extremely low", ["Extremely low"] = 4,
      [5] = "Very low", ["Very low"] = 5,
      [6] = "Low", ["Low"] = 6,
      [7] = "Small", ["Small"] = 7,
      [8] = "Under average", ["Under average"] = 8,
      [9] = "Average", ["Average"] = 9,
      [10] = "Above average", ["Above average"] = 10,
      [11] = "Important", ["Important"] = 11,
      [12] = "Impressive", ["Impressive"] = 12,
      [13] = "High", ["High"] = 13,
      [14] = "Very high", ["Very high"] = 14,
      [15] = "Extremely high", ["Extremely high"] = 15,
      [16] = "Enormous", ["Enormous"] = 16,
      [17] = "HUGE", ["HUGE"] = 17,
      [18] = "Incredible", ["Incredible"] = 18
		},
		DamageColors = {},
		DamageType = 
		{
			["1"] = "physical", ["physical"] = "1",
      ["2"] = "psionic", ["psionic"] = "2",
      ["3"] = "poison", ["poison"] = "3",
      ["4"] = "cold", ["cold"] = "4",
      ["5"] = "fire", ["fire"] = "5",
      ["6"] = "electric", ["electric"] = "6",
      ["7"] = "magical", ["magical"] = "7",
      ["8"] = "holy", ["holy"] = "8",
      ["9"] = "unholy", ["unholy"] = "9",
      ["10"] = "acid", ["acid"] = "10",
      ["11"] = "asphyxiation", ["asphyxiation"] = "11"			
		},
		DamageTypeAb =
		{
			["phys"] = "physical", ["physical"] = "phys",
      ["psi"] = "psionic", ["psionic"] = "psi",
      ["pois"] = "poison", ["poison"] = "pois",
      ["cold"] = "cold", ["cold"] = "cold",
      ["fire"] = "fire", ["fire"] = "fire",
      ["elec"] = "electric", ["electric"] = "elec",
      ["mag"] = "magical", ["magical"] = "mag",
      ["holy"] = "holy", ["holy"] = "holy",
      ["unho"] = "unholy", ["unholy"] = "unho",
      ["acid"] = "acid", ["acid"] = "acid",
      ["asph"] = "asphyxiation", ["asphyxiation"] = "asph"
		},
		DamageTypeColors =
		{

		},
		Guilds = {
    	alpha = {
    		"martial artist", 
    		"warrior", 
    		"abjurer", 
    		"elemental", 
    		"evoker", 
    		"necromancer", 
    		"weaver", 
    		"unraveller", 
    		"druid", 
    		"woodsman", 
    		"shapeshifter", 
    		"psychics", 
    		"acrobat", 
    		"lurker"
    	},
    	gamma = {
    		"blacksmith",
    		"mystic warriors",
    		"dragonfist fighter",
    		"traveler",
    		"knight",
    		"defender of the crown",
    		"berserker",
    		"masters of energy",
    		"navigator",
    		"protector of the earth",
    		"irrifletta",
    		"air mage",
    		"earth mage",
    		"water mage",
    		"fire mage",
    		"evoker of ether",
    		"evoker of elements",
    		"bone mage",
    		"voodooist",
    		"necroscope",
    		"confessor",
    		"healer",
    		"martyr",
    		"sacrificer",
    		"magical torturer",
    		"harmer",
    		"animal tamer",
    		"herbalist",
    		"weather watcher",
    		"sylvan guard",
    		"sylvan ward",
    		"bestial seccedaneum",
    		"savager",
    		"telekinetics",
    		"mystics",
    		"street brawler",
    		"bard",
    		"juggler",
    		"poison brewer",
    		"trickster",
    		"assassin"		
    	},
    	bravo = {
    		"order of the crescent moon",
    		"toad master",
    		"tiger master",
    		"snake master",
    		"crane master",
    		"shield master",
    		"thruster",
    		"barbarian",
    		"blade dancer",
    		"flogger",
    		"master abjurer",
    		"master navigators",
    		"enchanter",
    		"harbringer of anguish",
    		"mist mage",
    		"lava mage",
    		"evoker of acid",
    		"evoker of lightning",
    		"evoker of flames",
    		"evoker of poison",
    		"evoker of vacuum",
    		"evoker of force",
    		"evoker of ice",
    		"evoker of magic",
    		"stydian sorcerer",
    		"dreadlord",
    		"scourge",
    		"embalmer",
    		"templar",
    		"exorcist",
    		"avatar",
    		"shields of faith",
    		"servant of shirija",
    		"servant of lloth",
    		"servant of talakh",
    		"servant of mordulak",
    		"adept of the stones",
    		"shaman of the soil",
    		"animal trainer",
    		"sylvan scout",
    		"sylvan protector",
    		"beast lord",
    		"animal healer",
    		"cauldron magic",
    		"psionists",
    		"oneiromancers",
    		"watchers of the night",
    		"bartender",
    		"minstrel",
    		"bannerman",
    		"master assassin",
    		"disciple of shadow"		
    	},
    	omicron = {
    		"dragon master",
    		"champion of the crown",
    		"zerkala maga",
    		"master of disruption",
    		"master enchanter",
    		"guardians",
    		"nether mage",
    		"sorcerer",
    		"blood brother",
    		"lords of undeath",
    		"high priest",
    		"sword of talakh",
    		"elder of mordulak",
    		"primate of lloth",
    		"patriarch of shirija",
    		"chanter of deep earth",
    		"sylvan warlord",
    		"dragon lord",
    		"talisman magic",
    		"troubadour",
    		"gleeman",
    		"silent hand"
    	}
    }
	}