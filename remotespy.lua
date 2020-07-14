--[[
	Lua U Remote Spy written by TheExtreme (TheExtreme#6073 @ Discord)
	This remote spy has no user interface, settings are changed via _G (Look at line 15 for them)
	If you are an experienced scripter, you may add a user interface yourself and simply make your own Output function
	Remote calls are printed to the dev console by default (F9 window)
	To use Synapse's console, change Output to rconsoleprint
	The Output function can't be saved, it's set to 'warn' by default
]]

local Output = warn --// Function used to output remote calls (Change to rconsoleprint to use Synapse's console)
local CustomIgnoreFunction = function(Remote, Method, Arguments) --// If this returns true, then the remote call will not be displayed / recorded (You can edit this)
	return false
end

local Settings = { --// You can change these settings
	Enabled = true, --// Remote spy is enabled
	Copy = false, --// Set remote calls to clipboard as code
	Blacklist = { --// Ignore remote calls made with these remotes
		CharacterSoundEvent = true,
	},
	ShowScript = true, --// Print out the script that made the remote call (Unfunctional with ProtoSmasher)
	ShowReturns = true, --// Display what the remote calls return
	Record = false, --// Save remote calls to a text file (Uses writefile every second to save performance)
	TabCharacter = "    ", --// Character(s) to use between items in tables / tuples (The repetition of this character is calculated)
	NewlineCharacter = "\n" --// Character(s) to use between items in tables / tuples
}

local metatable = getrawmetatable(game)

--// Custom functions aliases

local setreadonly = setreadonly or set_readonly
local make_writeable = make_writeable or function(t)
	setreadonly(t, false)
end
local make_readonly = make_readonly or function(t)
	setreadonly(t, true)
end
local detour_function = detour_function or replace_closure or hookfunction
local setclipboard = setclipboard or set_clipboard or writeclipboard
local get_namecall_method = get_namecall_method or getnamecallmethod
local protect_function = protect_function or newcclosureyield or newcclosure or function(...)
	return ...
end
--// \\--

local Original = {}
local Recorded = ""
local Methods = {
	RemoteEvent = "FireServer",
	RemoteFunction = "InvokeServer"
}

do --// Handle 'Output' Setting
	Settings = setmetatable(Settings, {
		__newindex = function(self, index, value)
			if index == "Output" then
				Output = value
			elseif index == "CustomIgnoreFunction" or index == "IgnoreFunction" then
				CustomIgnoreFunction = value
			else
				rawset(self, index, value)
			end
		end
	})
end

local function IsValidCall(Remote, Method, Arguments)
	return Settings.Enabled and (Methods[Remote.ClassName] == Method) and not (Settings.Blacklist[Remote.Name] or CustomIgnoreFunction(Remote, Method, Arguments))
end

local function GetInstanceName(Object) --// Returns proper string wrapping for instances
	if Object == nil then
		return ".NIL"
	end
	local IsService = Object.Parent == game
	local Name = IsService and Object.ClassName or Object.Name
	return (Object ~= game and GetInstanceName(Object.Parent) or "") .. (IsService and ":GetService(\"%s\")" or (#Name == 0 or Name:match("[^%w]+") or Name:sub(1, 1):match("[^%a]")) and "[\"%s\"]" or ".%s"):format(Name)
end

local function Find(Table, Object, LastIndex)
	LastIndex = LastIndex or ""
	for Idx, Value in next, Table do
		if Object == Value then
			return LastIndex .. Idx
		elseif type(Value) == "table" then
			local Result = Find(Value, Object, Idx .. ".")
			if Result ~= nil then
				return LastIndex .. Result
			end
		end
	end
end

local renv = getrenv()

local function Parse(Object, TabCount) --// Convert the types into strings
	local Type = typeof(Object)
	local ParsedResult
	local TabCount = TabCount or 0
	if Type == "string" then
		ParsedResult = ("\"%s\""):format(Object)
	elseif Type == "Instance" then --// GetFullName except it's not handicapped
		ParsedResult = GetInstanceName(Object):sub(2)
	elseif Type == "table" then
		local Str = ""
		local Counter = 0
		TabCount = TabCount + 1
		for Idx, Obj in next, Object do
			Counter = Counter + 1
			Obj = Obj == Object and "THIS_TABLE" or Parse(Obj, TabCount)
			local TabCharacter = (Counter > 1 and "," or "") .. Settings.NewlineCharacter .. Settings.TabCharacter:rep(TabCount)
			if Counter ~= Idx then
				Str = Str .. ("%s[%s] = %s"):format(TabCharacter, Idx ~= Object and Parse(Idx, TabCount) or "THIS_TABLE", Obj)	 --maybe
			else
				Str = Str .. ("%s%s"):format(TabCharacter, Obj)
			end
		end
		TabCount = TabCount - 1
		ParsedResult = ("{%s}"):format(Str .. (#Str > 0 and Settings.NewlineCharacter .. Settings.TabCharacter:rep(TabCount) or ""))
	elseif Type == "CFrame" or Type == "Vector3" or Type == "Vector2" or Type == "UDim2" or Type == "Color3" or Type == "Vector3int16" or Type == "UDim" or Type == "Vector2int16" then
		ParsedResult = ("%s.new(%s)"):format(Type, tostring(Object))
	elseif Type == "userdata" then --// Remove __tostring fields to counter traps
		local Result
		local Metatable = getrawmetatable(Object)
		local __tostring = Metatable and rawget(Metatable, "__tostring")
		if __tostring then
			make_writeable(Metatable)
			Metatable.__tostring = nil
			ParsedResult = tostring(Object)
			rawset(Metatable, "__tostring", __tostring)
			if rawget(Metatable, "__metatable") ~= nil then
				make_readonly(Metatable)
			end
		else
			ParsedResult = tostring(Object)
		end
	elseif Type == "function" then
		ParsedResult = Find(renv, Object) or (
		[[(function()
			for Idx, Value in next, %s() do
				if type(Value) == "function" and tostring(Value) == "%s" then
					return Value
				end
			end
		end)()]]
		):gsub(
			"\n", 
			Settings.NewlineCharacter
		):gsub(
			"\t", 
			Settings.TabCharacter:rep(TabCount)
		):format(
			getgc and "getgc" or get_gc_objects and "get_gc_objects" or "debug.getregistry", 
			tostring(Object)
		)
	else
		ParsedResult = tostring(Object)
	end
	return ParsedResult
end

local function Write(Remote, Method, Arguments) --// Remote (Multiple types), Arguments (Table)
	local Stuff = ("\n\n%s:%s(%s)"):format(typeof(Remote) == "Instance" and Parse(Remote) or ("(%s)"):format(Parse(Remote)), Method, Parse(Arguments):sub(2, -2))
	if Settings.Copy then
		pcall(setclipboard, Stuff)
	end
	if Settings.ShowScript and not PROTOSMASHER_LOADED then
		local Script = getcallingscript and getcallingscript() or rawget(getfenv(2), "script")
		if typeof(Script) == "Instance" then
			Stuff = Stuff .. ("\nScript: %s"):format(Parse(Script))
		end
	end
	if Settings.Record then
		Recorded = Recorded .. Stuff
	end
	Output("-- REMOTE CALLED! --")
	Output(Stuff) --// Output the remote call
end

local CustomGamesSpy = {
	[606849621] = function() --// Jailbreak's custom FireServer
		local Script = game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript
		local RemoteTable
		for Idx, Value in next, debug.getregistry() do
			if type(Value) == "function" and getfenv(Value).script == Script then
				for UpvalIdx, Upval in next, debug.getupvalues(Value) do
					if type(Upval) == "table" and rawget(Upval, "FireServer") then
						RemoteTable = Upval
						break
					end
				end
				if RemoteTable ~= nil then
					break
				end
			end
		end
		assert(RemoteTable ~= "nil", "Remote not found")
		local ORIG = debug.getupvalues(RemoteTable.FireServer)[1]
		RemoteTable = setmetatable({
			FireServer = RemoteTable.FireServer
		}, {
			__index = {
				ClassName = "RemoteEvent"
			}
		})
		local new_function = function(...)
			local Arguments = {...}
			if IsValidCall(RemoteTable, "FireServer", Arguments) then
				Write(RemoteTable, "FireServer", Arguments)
			end
			return ORIG(...)
		end
		debug.setupvalue(RemoteTable.FireServer, 1, new_function)
	end
}

do --// Anti detection for tostring ( tostring(FireServer, InvokeServer) )
	local original_function = tostring
	local new_function = function(obj)
		local Success, Result = pcall(original_function, Original[obj] or obj)
		if Success then
			return Result
		else
			error(Result:gsub(script.Name .. ":%d+: ", ""))
		end
	end
	original_function = detour_function(original_function, new_function)
	Original[new_function] = original_function
end

do --// Function hooks
	local CustomSpy = CustomGamesSpy[game.PlaceId]
	if CustomSpy then
		CustomSpy()
	else
		for Class, Method in next, Methods do --// FireServer and InvokeServer hooking ( FireServer(Remote, ...) )
			local original_function = Instance.new(Class)[Method]
			local function new_function(self, ...)
				local Arguments = {...}
				if typeof(self) == "Instance" and IsValidCall(self, Method, Arguments) then
					Write(self, Method, Arguments)
				end
				return original_function(self, ...)
			end
			new_function = protect_function(new_function)
			original_function = detour_function(original_function, new_function)
			Original[new_function] = original_function
			print("Hooked", Method)
		end
	end
end

do --// Namecall hooking ( Remote:FireServer(...) )
	if get_namecall_method then
		local __namecall = metatable.__namecall
		local function new_function(self, ...)
			local Arguments = {...}
			local Method = get_namecall_method()
			if typeof(Method) == "string" and IsValidCall(self, Method, Arguments) then
				Write(self, Method, Arguments)
			end
			return __namecall(self, ...)
		end
		new_function = protect_function(new_function)
		make_writeable(metatable)
		metatable.__namecall = new_function
		make_readonly(metatable)
		Original[new_function] = __namecall
		print("Hooked namecall")
	else
		warn("Couldn't hook namecall because exploit doesn't support 'getnamecallmethod'")
	end
end

do --// Save remote calls and settings to their files
	local Folder = "RemoteSpy files"
	if makefolder == nil then
		Folder = ""
	else
		Folder = Folder .. "\\"
		makefolder(Folder)
	end
	local HttpService = game:GetService("HttpService")
	local GotSettingsJSON, LastSettingsJSON = pcall(readfile, Folder .. "RemoteSpySettings.json")
	if GotSettingsJSON then
		local GotSettings, LoadedSettings = pcall(HttpService.JSONDecode, HttpService, LastSettingsJSON)
		if GotSettings then
			for Name, Value in next, LoadedSettings do
				Settings[Name] = Value
			end
			Output("Loaded settings from file")
		else
			Output("Could get saved settings file, but couldn't decode from JSON")
		end
	else
		Output("Couldn't get saved settings file")
	end
	Output("Settings: " .. Parse(Settings) .. "\n---------------------")
	_G.Settings = Settings
	while wait(1) do
		if #Recorded > 0 then
			if not pcall(appendfile, Folder .. "RemoteSpyRecords.lua", Recorded) then
				pcall(writefile, Folder .. "RemoteSpyRecords.lua", Recorded)
			end
			Recorded = ""
		end
		local SettingsJSON = HttpService:JSONEncode(Settings)
		if SettingsJSON ~= LastSettingsJSON then
			pcall(writefile, Folder .. "RemoteSpySettings.json", SettingsJSON)
			LastSettingsJSON = SettingsJSON
		end
	end
end
