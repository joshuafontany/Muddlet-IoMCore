--RDMP
Character.RDMPCode = RDMPCode or "2332"
Character.RDMPStatus = RDMPStatus or "ON"
--Combat
Character.Aliases = Character.Aliases or {}
Character.Target = Character.Target or ""
Character.Selector = Character.Selector or "first"
Character.Enemy = Character.Enemy or ""
Character.Loot = Character.Loot or true
Character.DigGrave = Character.DigGrave or false
Character.EatCorpse = Character.EatCorpse or false
--CharacterConsole
Character.Name = Character.Name or "UnNamed"
Character.Surname = Character.Surname or ""
Character.Title = Character.Title or ""
Character.GuildName = Character.GuildName or ""
Character.Race = Character.Race or "Unknown"
Character.Level = Character.Level or 0
Character.OpenLevels = Character.OpenLevels or 0
--Stats
Character.Stats = Character.Stats or {
	Str = {Current = 0, Base = 0},
	Dex = {Current = 0, Base = 0},
	Con = {Current = 0, Base = 0},
	Sta = {Current = 0, Base = 0},
	Int = {Current = 0, Base = 0},
	Wis = {Current = 0, Base = 0},
	Cha = {Current = 0, Base = 0},
}
Character.Hpr = Character.Hpr or 0
Character.Spr = Character.Spr or 0
Character.Epr = Character.Epr or 0
Character.Hunger = Character.Hunger or 100
Character.Hp = Character.Hp or {
	Current = 0,
	Max = 0
}
Character.Sp = Character.Sp or {
	Current = 0,
	Max = 0
}
Character.Ep = Character.Ep or {
	Current = 0,
	Max = 0
}
--Traits
Character.AC = Character.AC or 0
Character.Wimpy = Character.Wimpy or 30
Character.Poisoned = Character.Poisoned or 0
Character.Hiding = Character.Hiding or 0
Character.Stealth = Character.Stealth or 0
Character.Height = Character.Height or ""
Character.Weight = Character.Weight or 0
Character.Growth = Character.Growth or 0
Character.Alignment = Character.Alignment or 0
Character.Scars = Character.Scars or 0
--GUILDS
Character.Guilds = Character.Guilds or 
{
	alpha = {},
	gamma = {},
	bravo = {},
	omicrom = {}
}
--GOLD
Character.Gold = Character.Gold or {
	Current = 0,
	Bank = 0
}
--EXP
Character.Exp = Character.Exp or {
	Current = 0,
	NextAdvLevel = 100,
	NextGuildLevel = 100,		
}
--HIGHSCORES
Character.TaskPoints = Character.TaskPoints or 0
Character.Kills = Character.Kills or 0
Character.Explored = Character.Explored or {
	Rooms = 0,
	MudPercent = 0,
	NextReward = 0
}
--MAIL
Character.Mail = Character.Mail or {
	New = 0,
	Total = 0
}
--EQUIPMENT
Character.Eq = Character.Eq or {
	Weapons = {},
	Armor = {}
}
--INVENTORY
Character.InventoryWeight = Character.InventoryWeight or 0
Character.InventoryCapacity = Character.InventoryCapacity or 0
Character.Inventory = Character.Inventory or {}
Character.InventoryHeadersBg = Character.InventoryHeadersBg or {}
Character.InventoryHeadersFg = Character.InventoryHeadersFg or {}
--SKILLS
Character.Skills = Character.Skills or {}
--SPELLS
Character.Spells = Character.Spells or {}

