local newcclosure = newcclosure or protect_function or function(...)
	return ...
end
local GAME = getrawmetatable(game)
local __INDEX = GAME.__index
local __NEWINDEX = GAME.__newindex
local __NAMECALL = GAME.__namecall
local HttpService = __NAMECALL(game, "HttpService", "GetService")
local Players = __NAMECALL(game, "Players", "GetService")
local Client = __INDEX(Players, "LocalPlayer")
local Games = {
	[285291913] = "Traitor Town",
	[606849621] = "Jailbreak",
	[863266079] = "Apocalypse Rising 2",
	[286090429] = "Arsenal",
	[292439477] = "Phantom Forces"
}
local UI = Instance.new("ScreenGui")
local VRUGS = Instance.new("Frame")
local Save = Instance.new("TextButton")
local Title = Instance.new("TextLabel")
local Tabs = Instance.new("Frame")
local Player = Instance.new("TextButton")
local Block = Instance.new("Frame")
local Game = Instance.new("TextButton")
local Player_2 = Instance.new("Frame")
local State = Instance.new("TextButton")
local Game_2 = Instance.new("Frame")
local EXAMPLE = Instance.new("TextLabel")
local Input = Instance.new("TextBox")
__NEWINDEX(VRUGS, "Name", "VRUGS")
__NEWINDEX(VRUGS, "Parent", UI)
__NEWINDEX(VRUGS, "BackgroundColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(VRUGS, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(VRUGS, "BorderSizePixel", 0)
__NEWINDEX(VRUGS, "Position", UDim2.new(0.5, -150, 0.5, -125))
__NEWINDEX(VRUGS, "Size", UDim2.new(0, 300, 0, 250))
__NEWINDEX(Title, "Name", "Title")
__NEWINDEX(Title, "Parent", VRUGS)
__NEWINDEX(Title, "BackgroundColor3", Color3.fromRGB(15, 15, 15))
__NEWINDEX(Title, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(Title, "BorderSizePixel", 0)
__NEWINDEX(Title, "Size", UDim2.new(1, 0, 0, 25))
__NEWINDEX(Title, "Font", Enum.Font.SourceSansItalic)
__NEWINDEX(Title, "Text", " VRUGS" .. " // " .. (Games[__INDEX(game, "PlaceId")] or "NULL"))
__NEWINDEX(Title, "TextColor3", Color3.new(1, 1, 1))
__NEWINDEX(Title, "TextSize", 20)
__NEWINDEX(Title, "TextStrokeColor3", Color3.new(1, 1, 1))
__NEWINDEX(Title, "TextStrokeTransparency", .8)
__NEWINDEX(Title, "TextXAlignment", Enum.TextXAlignment.Left)
__NEWINDEX(Title, "TextYAlignment", Enum.TextYAlignment.Top)
__NEWINDEX(Save, "Name", "Save")
__NEWINDEX(Save, "Parent", Title)
__NEWINDEX(Save, "BackgroundColor3", Color3.fromRGB(25,25,25))
__NEWINDEX(Save, "BorderColor3", Color3.fromRGB(42,42,42))
__NEWINDEX(Save, "Position", UDim2.new(0.7, -5, 0.25, 0))
__NEWINDEX(Save, "Size", UDim2.new(0.3, 0, 0.5, 0))
__NEWINDEX(Save, "Font", Enum.Font.SourceSansBold)
__NEWINDEX(Save, "Text", "SAVE SETTINGS ")
__NEWINDEX(Save, "TextColor3", Color3.new(1, 1, 1))
__NEWINDEX(Save, "TextSize", 14)
__NEWINDEX(Save, "TextXAlignment", Enum.TextXAlignment.Right)
__NEWINDEX(Tabs, "Name", "Tabs")
__NEWINDEX(Tabs, "Parent", VRUGS)
__NEWINDEX(Tabs, "BackgroundColor3", Color3.new(1, 1, 1))
__NEWINDEX(Tabs, "BackgroundTransparency", 1)
__NEWINDEX(Tabs, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(Tabs, "BorderSizePixel", 0)
__NEWINDEX(Tabs, "Position", UDim2.new(0, 10, 0, 40))
__NEWINDEX(Tabs, "Size", UDim2.new(1, -20, 0, 25))
__NEWINDEX(Player, "Name", "Player")
__NEWINDEX(Player, "Parent", Tabs)
__NEWINDEX(Player, "BackgroundColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(Player, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(Player, "Size", UDim2.new(0.5, 0, 1, 0))
__NEWINDEX(Player, "Font", Enum.Font.SourceSans)
__NEWINDEX(Player, "Text", "PLAYER")
__NEWINDEX(Player, "TextColor3", Color3.new(1, 1, 1))
__NEWINDEX(Player, "TextSize", 20)
__NEWINDEX(Player, "TextStrokeColor3", Color3.new(1, 1, 1))
__NEWINDEX(Player, "TextStrokeTransparency", .9)
__NEWINDEX(Block, "Name", "Block")
__NEWINDEX(Block, "Parent", Player)
__NEWINDEX(Block, "BackgroundColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(Block, "BorderColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(Block, "Position", UDim2.new(0, 1, 1, 0))
__NEWINDEX(Block, "Size", UDim2.new(1, -3, 0, 0))
__NEWINDEX(Block, "ZIndex", 2)
__NEWINDEX(Game, "Name", "Game")
__NEWINDEX(Game, "Parent", Tabs)
__NEWINDEX(Game, "BackgroundColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(Game, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(Game, "Position", UDim2.new(0.5, 0, 0, 0))
__NEWINDEX(Game, "Size", UDim2.new(0.5, 0, 1, 0))
__NEWINDEX(Game, "Font", Enum.Font.SourceSans)
__NEWINDEX(Game, "Text", "GAME")
__NEWINDEX(Game, "TextColor3", Color3.new(1, 1, 1))
__NEWINDEX(Game, "TextSize", 20)
__NEWINDEX(Game, "TextStrokeColor3", Color3.new(1, 1, 1))
__NEWINDEX(Game, "TextStrokeTransparency", .9)
__NEWINDEX(Player_2, "Name", "Player")
__NEWINDEX(Player_2, "Parent", VRUGS)
__NEWINDEX(Player_2, "BackgroundColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(Player_2, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(Player_2, "Position", UDim2.new(0, 10, 0, 65))
__NEWINDEX(Player_2, "Size", UDim2.new(1, -20, 1, -75))
__NEWINDEX(Game_2, "Name", "Game")
__NEWINDEX(Game_2, "Parent", VRUGS)
__NEWINDEX(Game_2, "BackgroundColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(Game_2, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(Game_2, "Position", UDim2.new(0, 10, 0, 65))
__NEWINDEX(Game_2, "Size", UDim2.new(1, -20, 1, -75))
__NEWINDEX(Game_2, "Visible", false)
__NEWINDEX(EXAMPLE, "Name", "EXAMPLE")
__NEWINDEX(EXAMPLE, "BackgroundColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(EXAMPLE, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(EXAMPLE, "Position", UDim2.new(0, 5, 0, 5))
__NEWINDEX(EXAMPLE, "Size", UDim2.new(0.5, -10, 0, 25))
__NEWINDEX(EXAMPLE, "Font", Enum.Font.SourceSans)
__NEWINDEX(EXAMPLE, "Text", " SETTING:")
__NEWINDEX(EXAMPLE, "TextColor3", Color3.new(1, 1, 1))
__NEWINDEX(EXAMPLE, "TextSize", 16)
__NEWINDEX(EXAMPLE, "TextXAlignment", Enum.TextXAlignment.Left)
__NEWINDEX(State, "Name", "State")
__NEWINDEX(State, "Parent", EXAMPLE)
__NEWINDEX(State, "BackgroundColor3", Color3.new(1, 1, 1))
__NEWINDEX(State, "BackgroundTransparency", 1)
__NEWINDEX(State, "Size", UDim2.new(1, 0, 1, 0))
__NEWINDEX(State, "Font", Enum.Font.SourceSans)
__NEWINDEX(State, "Text", "OFF")
__NEWINDEX(State, "TextColor3", Color3.new(1, 0, 0))
__NEWINDEX(State, "TextSize", 16)
__NEWINDEX(State, "TextStrokeColor3", Color3.new(1, 0, 0))
__NEWINDEX(State, "TextStrokeTransparency", .8)
__NEWINDEX(State, "TextXAlignment", Enum.TextXAlignment.Right)
__NEWINDEX(Input, "Name", "Input")
__NEWINDEX(Input, "Parent", UI)
__NEWINDEX(Input, "BackgroundColor3", Color3.fromRGB(25, 25, 25))
__NEWINDEX(Input, "BorderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(Input, "BorderSizePixel", 2)
__NEWINDEX(Input, "Position", UDim2.new(0.5, -100, 0.5, -20))
__NEWINDEX(Input, "Size", UDim2.new(0, 200, 0, 40))
__NEWINDEX(Input, "Font", Enum.Font.GothamBlack)
__NEWINDEX(Input, "PlaceholderColor3", Color3.fromRGB(42, 42, 42))
__NEWINDEX(Input, "PlaceholderText", "Input")
__NEWINDEX(Input, "Text", "")
__NEWINDEX(Input, "TextColor3", Color3.fromRGB(178, 178, 178))
__NEWINDEX(Input, "TextSize", 16)
__NEWINDEX(Input, "Visible", false)
local UIS = __NAMECALL(game, "UserInputService", "GetService")
local Buttons = {}
local SettingsG = {
	["Traitor Town"] = {
		["Detector"] = {
			Category = "Game",
			Enabled = true
		},
		["Steal Credits"] = {
			Category = "Game",
			Enabled = false
		},
		["Advertise"] = {
			Category = "Game",
			Enabled = false
		},
		["Call Outs"] = {
			Category = "Game",
			Enabled = false
		},
		["Call Detective"] = {
			Category = "Game",
			Enabled = false
		},
		["Burn Corpses"] = {
			Category = "Game",
			Enabled = false
		},
		["ESP"] = {
			Category = "Game",
			Enabled = false
		},
		["Infinite Ammo"] = {
			Category = "Player",
			Enabled = false
		},
		["No Fall"] = {
			Category = "Player",
			Enabled = false
		},
		["Fast Crouch"] = {
			Category = "Player",
			Enabled = false
		},
		["No Recoil"] = {
			Category = "Player",
			Enabled = false
		},
		["No Spread"] = {
			Category = "Player",
			Enabled = false
		}
	},
	["Jailbreak"] = {
		["Instant Act"] = {
			Category = "Game",
			Enabled = false
		},
		["Infinite Nitro"] = {
			Category = "Game",
			Enabled = false
		},
		["No Recoil"] = {
			Category = "Player",
			Enabled = false
		},
		["Infinite Ammo"] = {
			Category = "Player",
			Enabled = false
		},
		["Machine Gun"] = {
			Category = "Player",
			Enabled = false
		},
		["Anti Ragdoll"] = {
			Category = "Player",
			Enabled = false
		}
	},
	["Apocalypse Rising 2"] = {
		["Item ESP"] = {
			Category = "Game",
			Enabled = false
		},
		["No Fog"] = {
			Category = "Player",
			Enabled = false
		},
		["ESP"] = {
			Category = "Game",
			Enabled = false
		}
	},
	["Arsenal"] = {
		["No Particles"] = {
			Category = "Game",
			Enabled = false
		},
		["All Headshot"] = {
			Category = "Game",
			Enabled = false
		},
		["No Spread"] = {
			Category = "Player",
			Enabled = false
		},
		["No Recoil"] = {
			Category = "Player",
			Enabled = false
		},
		["Inf Ammo"] = {
			Category = "Game",
			Enabled = false
		}
	},
	["Phantom Forces"] = {
		["No Spread"] = {
			Category = "Player",
			Enabled = false
		},
		["No Recoil"] = {
			Category = "Player",
			Enabled = false
		},
		["Inf Ammo"] = {
			Category = "Player",
			Enabled = false
		},
		["Firerate"] = {
			Category = "Player",
			Enabled = false
		},
		["No Slowdown"] = {
			Category = "Player",
			Enabled = false
		}
	}
}
local GameName = Games[__INDEX(game, "PlaceId")] or "NULL"
local c = SettingsG[GameName]
assert(c, "Invalid game!")
local Exists, File = pcall(readfile, "vrugs_v_v_v_v_vEsc.json")
if Exists then
	local SavedSettings = __NAMECALL(HttpService, File, "JSONDecode")[GameName]
	for a, b in next, SavedSettings or {} do
		if c[a] then
			c[a] = b
		end
	end
end
local Settings = setmetatable(c, {
	__index = {
		Hook = function(a, b, c)
			return __NAMECALL(__INDEX(Buttons[b], "State"), "Text", "GetPropertyChangedSignal"):Connect(function()
				c(a[b].Enabled)
			end)
		end,
		Set = function(a, b, c)
			a[b].Enabled = c
			local Button = Buttons[b]
			local State = __INDEX(Button, "State")
			__NEWINDEX(State, "Text", c and "ON" or "OFF")
			__NEWINDEX(State, "TextColor3", c and Color3.new(0,1,0) or Color3.new(1,0,0))
			__NEWINDEX(State, "TextStrokeColor3", __INDEX(State, "TextColor3"))
		end
	}
})
__INDEX(Player, "MouseButton1Click"):Connect(function()
	__NEWINDEX(Game_2, "Visible", false)
	__NEWINDEX(Player_2, "Visible", true)
	__NEWINDEX(Block, "Parent", Player)
end)
__INDEX(Game, "MouseButton1Click"):Connect(function()
	__NEWINDEX(Game_2, "Visible", true)
	__NEWINDEX(Player_2, "Visible", false)
	__NEWINDEX(Block, "Parent", Game)
end)
local getPlayer = function(str)
	for _, v in next, __NAMECALL(Players, "GetPlayers") do
		if __INDEX(v, "Name"):lower():sub(1, #str) == str then
			return v
		end
	end
end
local addESP = function(Pos, Active)
	Pos = Pos or Vector3.new(0, 0, 0)
	local Pos2D = __NAMECALL(__INDEX(workspace, "CurrentCamera"), Pos, "WorldToViewportPoint")
	local CoreGui = __NAMECALL(game, "CoreGui", "GetService")
	DumbESPMemeUI_Iterations = DumbESPMemeUI_Iterations or __NAMECALL(HttpService, true, "GenerateGUID")
	local UI = __NAMECALL(CoreGui, DumbESPMemeUI_Iterations, "FindFirstChild") or Instance.new("ScreenGui", CoreGui)
	__NEWINDEX(UI, "Name", DumbESPMemeUI_Iterations)
	__NEWINDEX(UI, "IgnoreGuiInset", true)
	local ESP = Instance.new("TextLabel")
	__NEWINDEX(ESP, "Name", "DumbESPMeme_Iterations")
	__NEWINDEX(ESP, "BackgroundTransparency", 1)
	__NEWINDEX(ESP, "Position", UDim2.new(0, Pos2D.X, 0, Pos2D.Y))
	__NEWINDEX(ESP, "Size", UDim2.new(0, 1, 0, 1))
	__NEWINDEX(ESP, "Visible", Active ~= false)
	__NEWINDEX(ESP, "TextColor3", Color3.new(1, 1, 1))
	__NEWINDEX(ESP, "TextStrokeColor3", Color3.new(0, 0, 0))
	__NEWINDEX(ESP, "Font", Enum.Font.GothamBlack)
	__NEWINDEX(ESP, "TextStrokeTransparency", .1)
	__NEWINDEX(ESP, "Parent", UI)
	return ESP
end
local draggable = function(a) 
	local b
	local c
	__INDEX(a, "InputBegan"):Connect(function(a) 
		if __INDEX(a, "UserInputType") == Enum.UserInputType.MouseButton1 then 
			b = true
			c = __INDEX(a, "Position")
			__INDEX(a, "Changed"):Connect(function()
				if __INDEX(a, "UserInputType") == Enum.UserInputType.MouseButton1 then 
					b = false
				end 
			end)
		end 
	end)
	__INDEX(UIS, "InputChanged"):Connect(function(d) 
		if __INDEX(d, "UserInputType") == Enum.UserInputType.MouseMovement and b then
			local b = __INDEX(d, "Position")
			__NEWINDEX(a, "Position", __INDEX(a, "Position") + UDim2.new(0, b.X - c.X, 0, b.Y - c.Y))
			c = b
		end
	end)
end
local ApocItemESPMaxDist = 999999
local ServerEvents
local SavedWalkSpeed, SavedJumpPower, SavedHipHeight = 16, 50, 0
for Setting, Table in next, Settings do
	local Button = __NAMECALL(EXAMPLE, "Clone")
	local Frame = __INDEX(VRUGS, Table.Category)
	local Count = #__NAMECALL(Frame, "GetChildren")/2
	__NEWINDEX(Button, "Parent", Frame)
	Buttons[Setting] = Button
	__NEWINDEX(Button, "Name", Setting)
	__NEWINDEX(Button, "Text", " " .. Setting:upper() .. ":")
	Settings:Set(Setting, Settings[Setting].Enabled)
	__NEWINDEX(Button, "Position", UDim2.new(Count % 1, 5, 0, 5 + math.floor(Count) * 35))
	__INDEX(__INDEX(Button, "State"), "MouseButton1Click"):Connect(function()
		Settings:Set(Setting, not Settings[Setting].Enabled)
	end)
end
if GameName == "Traitor Town" then
	SavedJumpPower = 21
	Env = getsenv(__NAMECALL(__INDEX(Client, "PlayerGui"), "Client", "WaitForChild"))
	ServerEvents = Env._s.ServerEvents
	local Children = __NAMECALL(ServerEvents, "GetChildren")
	local Sayings = {
		"Gameplay sponsored by Vrugs, Disk cord: 6bvKCNK",
		"Nice 1 dollar logitech mouse! Disk cord: 6bvKCNK",
		"Features: Speed, Traitor Detect, Inf Ammo and much more! 6bvKCNK",
		"Buy Vrugs now! Disk cord: 6bvKCNK",
		"19 inch monitor, 0 IQ monkey"
	}
	local Fall = __INDEX(ServerEvents, "Fall")
	local BlankRemote = Instance.new("RemoteEvent")
	local T1 = {
		Fall = BlankRemote,
		Crush = BlankRemote,
		TriggerSelfDefense = BlankRemote,
		ErrorReport = BlankRemote
	}
	local MetaT1 = {
		__index = ServerEvents
	}
	Env._s.ServerEvents = setmetatable(T1, MetaT1)
	local takePush = Env.takePush
	local rayWithDamage = Env.rayWithDamage
	local updateWalkSpeed = Env.updateWalkSpeed
	local setRecoil = Env.setRecoil
	Env.groupStats[__INDEX(Client, "Name")] = "Administrator"
	Env.discombobulatorTurn = Vector3.new()
	Env.takePush = function(...)
		Env.discombobulatorTurn = Vector3.new()
		return takePush(...)
	end
	Env.rayWithDamage = function(len, spread, dmg, headshots, weapon, removeAmmo)
		return rayWithDamage(500, Settings["No Spread"].Enabled and 0.01 or spread, dmg, true, weapon, not Settings["Infinite Ammo"].Enabled)
	end
	Env.setRecoil = Settings["No Recoil"].Enabled and function() end or setRecoil
	Env.crash = function() end
	Env.updateWalkSpeed = Settings["Fast Crouch"].Enabled and function() end or updateWalkSpeed
	__NEWINDEX(__INDEX(Env._s.ClientEvents, "Ping"), "OnClientInvoke", function()
		if Env._s.dataReady(Client) then
			if Env._s.parented(__INDEX(Client, "Character")) then
				return __INDEX(Client, "UserId"), __INDEX(Client, "Name"), Env.gameTeams[__INDEX(Client, "Name")], Env.round, 21, 100, 16, __NAMECALL(Env._s.ClientEvents, "GetChildren"), Children
			else
				return __INDEX(Client, "UserId"), __INDEX(Client, "Name"), Env.gameTeams[__INDEX(Client, "Name")], Env.round, true, true, true, __NAMECALL(Env._s.ClientEvents, "GetChildren"), Children
			end
		else
			return __INDEX(Client, "UserId"), __INDEX(Client, "Name"), true, Env.round, true, true, true, __NAMECALL(Env._s.ClientEvents, "GetChildren"), Children
		end
	end)
	local makeTraitor = function(Player)
		if (Client == Player) or (Env.gameTeams[__INDEX(Client, "Name")] == "Traitor") or (not Settings.Detector.Enabled) or (__INDEX(__INDEX(__INDEX(Client, "Data"), "AliveStatus"), "Value") == "Spectator") or (Env.round ~= Env.LuaEnum.Round.InProgress) then return end
		__NEWINDEX(__INDEX(__INDEX(__INDEX(Player, "Character"), "HumanoidRootPart"), "NameLabel"), "Enabled", true)
		if Settings["Call Outs"].Enabled then
			__NAMECALL(__INDEX(ServerEvents, "SendChat"), Env.securityKey, Env._s.trimLeft(("%s is a Traitor!"):format(__INDEX(Player, "Name")), 0), "FireServer")
		end
		Env.takeNotification("Traitor found: " .. __INDEX(Player, "Name"), 2)
	end
	local doPlayer = function(Player)
		local doChar = function(Char)
			local IsInnocent = false
			local IsDetective = false
			local IsTraitor = false
			local IsFreekill = false
			local currKarma = __INDEX(__INDEX(__INDEX(Player, "Data"), "Karma"), "Value")
			local TraitorStock = __NAMECALL(__NAMECALL(Char, "Stock", "WaitForChild"), "Traitor", "WaitForChild")
			local oldValues = {}
			for i,v in next, __NAMECALL(TraitorStock, "GetChildren") do
				oldValues[__INDEX(v, "Name")] = __INDEX(v, "Value")
				__INDEX(v, "Changed"):Connect(function(a)
					if not IsDetective and a < oldValues[__INDEX(v, "Name")] then
						IsTraitor = true
						makeTraitor(Player)
					end
				end)
			end
			__INDEX(__NAMECALL(__NAMECALL(Char, "CorpseData", "WaitForChild"), "Kills", "WaitForChild"), "ChildAdded"):Connect(function(a)
				local dead = __NAMECALL(__NAMECALL(__INDEX(workspace, "Ragdolls"), __INDEX(a, "Value"), "WaitForChild"), "CorpseData", "WaitForChild")
				if __INDEX(__NAMECALL(dead, "LeftoverCredits", "WaitForChild"), "Value") > 0 and Settings["Steal Credits"].Enabled then
					__NAMECALL(__INDEX(ServerEvents, "StealCredits"), Env.securityKey, __INDEX(dead, "Parent"), "FireServer")
				end
				if Settings["Call Detective"].Enabled then
					__NAMECALL(__INDEX(ServerEvents, "SendDetectiveCall"), Env.securityKey, __INDEX(a, "Value"), "FireServer")
				end
				if not __INDEX(__INDEX(dead, "IsSelfDefense"), "Value") and not IsDetective then
					local Team = __INDEX(__INDEX(dead, "Team"), "Value")
					local Karma = __INDEX(__INDEX(__INDEX(Player, "Data"), "Karma"), "Value")
					if Team == "Innocent" and Karma >= currKarma then
						makeTraitor(Player)
						IsTraitor = true
					elseif Team == "Traitor" and Karma >= currKarma then
						IsInnocent = true
					elseif Team == "Innocent" and Karma < currKarma then
						IsInnocent = true
					end
					currKarma = Karma
				end
				if Player == Client and Settings["Burn Corpses"].Enabled then
					__NAMECALL(__INDEX(ServerEvents, "BurnCorpse"), Env.securityKey, __INDEX(dead, "Parent"), "FireServer")
				end
			end)
			__INDEX(__NAMECALL(__INDEX(Player, "Data"), "Evildoer", "WaitForChild"), "Changed"):Connect(function(a)
				IsInnocent = a
				IsFreekill = a
			end)
			local DetHat = __NAMECALL(Char, "Detective", "WaitForChild")
			IsDetective = __NEWINDEX(__INDEX(DetHat, "Handle"), "Transparency", 0)
			IsInnocent = __INDEX(__INDEX(__INDEX(Player, "Data"), "Evildoer"), "Value")
			IsFreekill = IsInnocent
			__NAMECALL(__INDEX(DetHat, "Handle"), "Transparency", "GetPropertyChangedSignal"):Connect(function()
				IsDetective = __INDEX(__INDEX(DetHat, "Handle"), "Transparency") == 0
			end)
			if Client ~= Player then
				local NameLabel = __NAMECALL(__NAMECALL(Char, "HumanoidRootPart", "WaitForChild"), "NameLabel", "WaitForChild")
				__NEWINDEX(NameLabel, "Enabled", Env.updateNames_enabled or Settings.ESP.Enabled)
				local Label = __NAMECALL(NameLabel, "TextLabel", "FindFirstChildOfClass")
				__NAMECALL(NameLabel, "Enabled", "GetPropertyChangedSignal"):Connect(function()
					__NEWINDEX(NameLabel, "Enabled", Env.updateNames_enabled or Settings.ESP.Enabled)
					Env.updateShadowText(Label, __INDEX(Player, "Name") .. " | " .. (IsDetective and "DETECTIVE" or IsTraitor and "TRAITOR" or IsInnocent and "INNOCENT" or "Unconfirmed") .. (IsFreekill and " (FREEKILL)" or ""))
				end)
				Settings:Hook("ESP", function(a)
					__NEWINDEX(NameLabel, "Enabled", a)
				end)
			end
		end
		local Char = __INDEX(Player, "Character")
		if Char then 
			doChar(Char) 
		end
		__INDEX(Player, "CharacterAdded"):Connect(doChar)
	end
	for i,v in next, __NAMECALL(Players, "GetPlayers") do
		doPlayer(v)
	end
	__INDEX(Players, "PlayerAdded"):Connect(doPlayer)
	spawn(function()
		while wait(15) do
			if Settings.Advertise.Enabled then
				__NAMECALL(__INDEX(ServerEvents, "SendChat"), Env.securityKey, Sayings[Random.new(tick()):NextInteger(1,#Sayings)], true, "FireServer")
			end
		end
	end)
	Settings:Hook("No Fall", function(State)
		Env._s.ServerEvents.Fall = State and BlankRemote or Fall
	end)
	Settings:Hook("No Recoil", function(State)
		Env.setRecoil = State and function() end or setRecoil
	end)
	Settings:Hook("Fast Crouch", function(State)
		Env.updateWalkSpeed = State and function() end or updateWalkSpeed
	end)
elseif GameName == "Jailbreak" then
	local d = {}
	local Framework = __INDEX(__INDEX(Client, "PlayerScripts"), "LocalScript")
	local hookspec = function(spec)
		return setmetatable({}, {
			__index = function(self, index)
				if index == "Timed" and Settings["Instant Act"].Enabled then
					return false
				else
					return spec[index]
				end
			end,
			__newindex = spec
		})
	end
	for _, f in next, debug.getregistry() do
		if typeof(f) == "function" and getfenv(f).script == Framework then
			for a, u in next, debug.getupvalues(f) do
				if typeof(u) == "table" then
					if u.Specs and not d.Specs then
						for ll, tt in next, u.Specs do
							u.Specs[ll] = hookspec(tt)
						end
						local Add = u.Specs.Add
						u.Specs.Add = function(a, b)
							return Add(hookspec(a), b)
						end	
						print("-INSTANT ACT-")
						d.Specs = true
					elseif u.LastVehicleExit and not d.Nitro then
						debug.setupvalue(f, a, setmetatable({}, {
							__index = function(_, a)
								if a == "Nitro" and Settings["Infinite Nitro"].Enabled then
									return 250
								elseif a == "LastVehicleExit" and Settings["Anti Ragdoll"].Enabled then
									return tick()
								else
									return u[a]
								end
							end,
							__newindex = u
						}))
						print("-INFINITE NITRO-")
						d.Nitro = true
					elseif typeof(u[1]) == "table" and u[1].c and not d.AC then
						table.remove(u)
						print("-AC BYPASS-")
						d.AC = true
					elseif u.TimeAccumDiff and not d.NoClip then
						u.TimeAccumDiff = function() return 0 end
						print("-NOCLIP BYPASS-")
						d.NoClip = true
					end
				elseif typeof(u) == "function" and not d.WS then
					for _, V in next, debug.getupvalues(u) do
						if V == math.log then
							debug.setupvalue(f, a, function() end)
							print("-WS BYPASS-")
							d.WS = true
						end
					end
				end
			end
		end
	end
	local a, b = pcall(require, __INDEX(__INDEX(__NAMECALL(game, "ReplicatedStorage", "GetService"), "Game"), "ItemConfig"))
	if a then
		for a, c in next, b do
			b[a] = setmetatable({}, {
				__index = function(_, a)
					if (a == "MagSize" and Settings["Infinite Ammo"].Enabled) or (a == "FireFreq" and Settings["Machine Gun"].Enabled) then
						return math.huge
					elseif a == "FireAuto" and Settings["Machine Gun"].Enabled then
						return true
					elseif a == "CamShakeMagnitude" and Settings["No Recoil"].Enabled then
						return 0
					end
					return c[a]
				end,
				__newindex = c
			})
			print("-" .. a:upper() .. " SETTINGS HOOK-")
		end
	end
	__INDEX(UIS, "InputBegan"):Connect(function(a, b)
		if b then return end
		if __INDEX(a, "KeyCode") == Enum.KeyCode.LeftShift then
			local a = __INDEX(Client, "Character") and __NAMECALL(__INDEX(Client, "Character"), "Humanoid", "FindFirstChildOfClass")
			if a then
				__NEWINDEX(a, "WalkSpeed", __INDEX(a, "WalkSpeed") * 1.5)
			end
		end
	end)
	__INDEX(UIS, "InputEnded"):Connect(function(a, b)
		if b then return end
		if __INDEX(a, "KeyCode") == Enum.KeyCode.LeftShift then
			local a = __INDEX(Client, "Character") and __NAMECALL(__INDEX(Client, "Character"), "Humanoid", "FindFirstChildOfClass")
			if a then
				__NEWINDEX(a, "WalkSpeed", __INDEX(a, "WalkSpeed") / 1.5)
			end
		end
	end)
elseif GameName == "Apocalypse Rising 2" then
	local Framework = _G.ClientFramework or getrenv()._G.ClientFramework
	local API = debug.getupvalues(Framework).api
	local Camera = __INDEX(workspace, "CurrentCamera")
	local ItemESPs = {}
	local PlayerESPs = {}
	local addItemESP = function(a)
		if __INDEX(a, "ClassName") == "CFrameValue" then
			local ESP = addESP(__INDEX(__INDEX(a, "Value"), "Position"), Settings["Item ESP"].Enabled)
			__NEWINDEX(ESP, "Text", __INDEX(a, "Name"))
			ItemESPs[a] = ESP
		end
	end
	local addPlayerESP = function(a)
		if __INDEX(a, "Parent") == __INDEX(workspace, "Characters") and __INDEX(Character, "Name") ~= __INDEX(Client, "Name") then
			local ESP = addESP(__INDEX(__INDEX(a, "Head"), "Position"), Settings.ESP.Enabled)
			__NEWINDEX(ESP, "Text", __INDEX(a, "Name"))
			PlayerESPs[a] = ESP
		end
	end
	local Loot = __INDEX(workspace, "Loot")
	local Characters = __INDEX(workspace, "Characters")
	for _, a in next, __NAMECALL(Loot, "GetDescendants") do
		addItemESP(a)
	end
	for _, a in next, __NAMECALL(Characters, "GetChildren") do
		addPlayerESP(a)
	end
	__INDEX(Loot, "DescendantAdded"):Connect(addItemESP)
	__INDEX(Loot, "DescendantRemoving"):Connect(function(a)
		if __INDEX(a, "ClassName") == "CFrameValue" and ItemESPs[a] then
			__NAMECALL(ItemESPs[a], "Destroy")
			ItemESPs[a] = nil
		end
	end)
	__INDEX(Characters, "ChildAdded"):Connect(addPlayerESP)
	__INDEX(Characters, "ChildRemoved"):Connect(function(a)
		if PlayerESPs[a] then
			__NAMECALL(PlayerESPs[a], "Destroy")
			PlayerESPs[a] = nil
		end
	end)
	local ItemESPRS
	local ToggleItemESP = function(a)
		if a then
			ItemESPRS = __INDEX(__NAMECALL(game, "RunService", "GetService"), "RenderStepped"):Connect(function()
				for a, b in next, ItemESPs do
					local a = __INDEX(__INDEX(a, "Value"), "Position")
					local c, d = __NAMECALL(Camera, a, "WorldToViewportPoint")
					__NEWINDEX(b, "Position", UDim2.new(0, c.X, 0, c.Y))
					__NEWINDEX(b, "Visible", d and (a - __INDEX(__INDEX(Camera, "Focus"), "Position")).Magnitude <= ApocItemESPMaxDist)
				end
			end)
		elseif ItemESPRS then
			__NAMECALL(ItemESPRS, "Disconnect")
			ItemESPRS = nil
			for _, a in next, ItemESPs do
				__NEWINDEX(a, "Visible", false)
			end
		end
	end
	local PlayerESPRS
	local TogglePlayerESP = function(a)
		if a then
			PlayerESPRS = __INDEX(__NAMECALL(game, "RunService", "GetService"), "RenderStepped"):Connect(function()
				for a, b in next, PlayerESPs do
					local a = __NAMECALL(a, "Head", "FindFirstChild")
					if a then
						local a, c = __NAMECALL(Camera, __INDEX(a, "Position"), "WorldToViewportPoint")
						__NEWINDEX(b, "Position", UDim2.new(0, a.X, 0, a.Y))
						__NEWINDEX(b, "Visible", c)
					else
						__NAMECALL(b, "Destroy")
					end
				end
			end)
		elseif PlayerESPRS then
			__NAMECALL(PlayerESPRS, "Disconnect")
			PlayerESPRS = nil
			for _, a in next, PlayerESPs do
				__NEWINDEX(a, "Visible", false)
			end
		end
	end
	for _, a in next, debug.getregistry() do
		if typeof(a) == "function" and debug.getupvalues(a).adjustDistances then
			debug.setupvalue(a, "adjustDistances", function() end)
			break
		end
	end
	ToggleItemESP(Settings["Item ESP"].Enabled)
	Settings:Hook("Item ESP", ToggleItemESP)
	TogglePlayerESP(Settings.ESP.Enabled)
	Settings:Hook("ESP", TogglePlayerESP)
	local Lighting = __NAMECALL(game, "Lighting", "GetService")
	local Old = __INDEX(Lighting, "FogEnd")
	local ToggleNoFog = function(a)
		__NEWINDEX(Lighting, "FogEnd", a and 9999999 or Old)
	end
	ToggleNoFog(Settings["No Fog"].Enabled)
	Settings:Hook("No Fog", ToggleNoFog)
elseif GameName == "Arsenal" then
	local Env = getsenv(__INDEX(__INDEX(__INDEX(Client, "PlayerGui"), "GUI"), "Client"))
	local Events = __INDEX(Env.rstorage, "Events")
	local Meta = {}
	local HitPart = Events.HitPart
	local HitPartSpoof = {
		FireServer = newcclosure(function(self, ...)
			local args = {...}
			args[4] = 2
			args[7] = true
			return HitPart:FireServer(unpack(args))
		end)
	}
	local blankRemote = Instance.new("RemoteEvent")
	for Index, Method in next, GAME do
		Meta[Index] = Method
	end
	Meta.__index = newcclosure(function(self, index)
		if index == "BeanBoozled" then
			return blankRemote
		elseif index == "RemoteEvent" and Settings["No Particles"].Enabled then
			return blankRemote
		elseif index == "HitPart" and Settings["All Headshot"].Enabled then
			return HitPartSpoof
		else
			return GAME.__index(self, index)
		end
	end)
	local getammo = Env.getammo
	local RotCamera = Env.RotCamera
	Env.getammo = function(ammo)
		if Settings["Inf Ammo"].Enabled then
			Env.ammocount = 999
			Env.ammocount2 = 999
			Env.ammocount3 = 999
			Env.ammocount4 = 999
			return 999
		else
			return getammo(ammo)
		end
	end
	Env.RotCamera = function(...)
		return not Settings["No Recoil"].Enabled and RotCamera(...)
	end
	(setrawmetatable or debug.setmetatable)(Events, Meta);
	Settings:Hook("No Spread", function(State)
		Env.spreadmodifier = State and 0 or 1.2
	end)
elseif GameName == "Phantom Forces" then
	local Framework = game:GetService("ReplicatedFirst").Framework
	local Env = getsenv(Framework)
	local Functions = {}
	local setupvalue = setupval or setupvalue or debug.setupvalue
	local getupvalue = getupval or getupvalue or debug.getupvalue
	local getupvalues = getupvalues or getupvalues or debug.getupvalues

	local getfenv = getfenv
	local typeof = typeof
	local next = next
	local function doFunction(Function)
		if typeof(Function) == "function" and getfenv(Function).script == Framework and not Functions[Function] then
			local Upvalues = getupvalues(Function)
			Functions[Function] = Upvalues
			doFunction(Upvalues)
		elseif typeof(Function) == "table" then
			for i, v in next, Function do
				doFunction(v)
			end
		end
	end
	local reg = getreg or debug.getregistry
	local gc = getgc or get_gc_objects
	if gc then
		doFunction(gc())
	end
	if reg then
		doFunction(reg())
	end
	local setupvalue = function(Name, Value)
		for Function, Values in next, Functions do
			if Values[Name] then
				return setupvalue(Function, Name, Value)
			end
		end
	end
	local getupvalue = function(Name)
		for Function, Values in next, Functions do
			if Values[Name] then
				return Values[Name]
			end
		end
	end
	setupvalue("netkick", function() end)
	setupvalue("dontjump", function() end)
	setupvalue("dealwithit", function() end)
	network = getupvalue("network")
	local camera = getupvalue("camera")
	local hud = getupvalue("hud")
	local spread = getupvalue("spreadspring")
	local fireround = getupvalue("fireround")
	local updatewalkspeed = Env.updatewalkspeed
	--// \\--
	local shake = camera.shake
	local updateammo = hud.updateammo
	local statechange = Env.statechange
	local spreadaccelerate = spread.accelerate
	camera.shake = function(...)
		if not Settings["No Recoil"].Enabled then
			return shake(...)
		end
	end
	hud.updateammo = function(...)
		if Settings["Inf Ammo"].Enabled then
			setupvalue("mag", getupvalue("magsize") or 25)
		end
		return updateammo(...)
	end
	spread.accelerate = function(...)
		if Settings["No Spread"].Enabled then
			return
		end
		return spreadaccelerate(...)
	end
	setupvalue("fireround", function(aim)
		if Settings.Firerate.Enabled then
			setupvalue("nextshot", 0)
		end
		return fireround(aim)
	end)
	Env.updatewalkspeed = function(...)
		if Settings["No Slowdown"].Enabled then
			setupvalue("movementmode", "stand")
		end
		return updatewalkspeed(...)
	end
end
__INDEX(UIS, "InputBegan"):Connect(function(a, b)
	local Keycode = not b and __INDEX(a, "KeyCode")
	if Keycode == Enum.KeyCode.Semicolon then
		__NEWINDEX(VRUGS, "Visible", false)
		__NEWINDEX(Input, "Visible", true)
		__NAMECALL(Input, "CaptureFocus")
		__NEWINDEX(Input, "Text", "")
	elseif Keycode == Enum.KeyCode.Tab and __NAMECALL(UIS, Enum.KeyCode.LeftControl, "IsKeyDown") then
		__NEWINDEX(VRUGS, "Visible", not __INDEX(VRUGS, "Visible"))
	end
end)
__INDEX(Input, "FocusLost"):Connect(function(a)
	if a then
		__NEWINDEX(Input, "Visible", false)
		__NEWINDEX(VRUGS, "Visible", true)
		local a = __INDEX(Input, "Text"):split(" ")
		local b = table.remove(a, 1):lower()
		if not b then return end
		if b == "ws" or b == "speed" or b == "walkspeed" then
			local b = __INDEX(Client, "Character") and __NAMECALL(__INDEX(Client, "Character"), "Humanoid", "FindFirstChildOfClass")
			if b then
				local VAL = tonumber(a[1] or 100)
				__NEWINDEX(b, "WalkSpeed", VAL)
				SavedWalkSpeed = VAL
			end
		elseif b == "jp" or b == "jumppower" then
			local b = __INDEX(Client, "Character") and __NAMECALL(__INDEX(Client, "Character"), "Humanoid", "FindFirstChildOfClass")
			if b then
				local VAL = tonumber(a[1] or 100)
				__NEWINDEX(b, "JumpPower", VAL)
				SavedJumpPower = VAL
			end
		elseif b == "hipheight" then
			local b = __INDEX(Client, "Character") and __NAMECALL(__INDEX(Client, "Character"), "Humanoid", "FindFirstChildOfClass")
			if b then
				local VAL = tonumber(a[1] or 100)
				__NEWINDEX(b, "HipHeight", VAL)
				SavedHipHeight = VAL
			end
		elseif GameName == "Traitor Town" then
			if b == "kill" then
				local b = getPlayer(a[1]:lower())
				local a = b and __INDEX(b, "Character")
				if a then
					for _ = 1,10 do
						__NAMECALL(__INDEX(ServerEvents, "SendDamage"), Env.securityKey, a, Env.weapons[Env.weaponSelection].Damage, Env.weapons[Env.weaponSelection], true, __INDEX(__INDEX(a, "HumanoidRootPart"), "Position"), nil, 1, "FireServer")
					end
				end
			end
		elseif GameName == "Apocalypse Rising 2" then
			if b == "espdistance" or b == "setespmaxdistance" or b == "espdist" then
				ApocItemESPMaxDist = tonumber(Args[1] or "250")
			end
		end
	end
end)
draggable(VRUGS)
for _, a in next, __NAMECALL(UI, "GetDescendants") do
	__NEWINDEX(a, "ZIndex", __INDEX(a, "ZIndex") + 10)
end
__NEWINDEX(UI, "Parent", __NAMECALL(game, "CoreGui", "GetService"))
warn("Hello everyone, this is... Running on Empty, Food, REVIEW!")
assert(writefile and readfile, "File manipulation functions not found! Your ability to save will be hindered.")
__INDEX(Save, "MouseButton1Click"):Connect(function()
	writefile("vrugs_v_v_v_v_vEsc.json", __NAMECALL(HttpService, SettingsG, "JSONEncode"))
end)
