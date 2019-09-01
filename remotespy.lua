--[[
	Lua U Remote Spy written by chaserks (chaserks @ v3rmillion.net, superdude914#3441 @ Discord)
	Exploits supported: Synapse X, ProtoSmasher (Sirhurt?, Elysian?)
	Remote calls are printed to the dev console by default (F9 window)
	View line 20 for instructions on how to use the Synapse roblox console
]]

_G.Settings = { --// You can change these settings
	Enabled = true, --// Remote spy is enabled
	Copy = false, --// Set remote calls to clipboard as code
	Blacklist = { --// Ignore remote calls made with these remotes
		CharacterSoundEvent = true,
	},
	ShowScript = true, --// Print out the script that made the remote call (Unfunctional with ProtoSmasher)
	ShowReturns = true, --// Display what the remote calls return
	Output = warn --// Function used to output remote calls (Change to rconsoleprint to use Synapse's console)
}

local metatable = getrawmetatable(game)
local IsLuau = select(2, pcall(game)) == "attempt to call a userdata value"

--// Custom functions aliases
local setreadonly = setreadonly or set_readonly or make_writeable
local getrawmetatable = getrawmetatable or debug.getmetatable
local hookfunction = hookfunction or replace_closure or detour_function
local setclipboard = setclipboard or set_clipboard or writeclipboard
local getnamecallmethod = getnamecallmethod or function(o)
	return typeof(o) == "Instance" and Methods[o.ClassName] or nil
end
local newcclosure = newcclosure or protect_function or function(...)
	return ...
end

--// Localize
local getfenv = getfenv
local typeof = typeof or type
local pcall = pcall
local select = select
local rawget = rawget

--// \\--

local Original = {}
local Settings = _G.Settings
local Methods = {
	RemoteEvent = "FireServer",
	RemoteFunction = "InvokeServer"
}

local GetInstanceName = function(Object) --// Returns proper string wrapping for instances
	local Name = Object.Name
	return ((#Name == 0 or Name:match("[^%w]+") or Name:sub(1, 1):match("[^%a]")) and "[\"%s\"]" or ".%s"):format(Name)
end

local function Parse(Object) --// Convert the types into strings
	local Type = typeof(Object)
	if Type == "string" then
		return ("\"%s\""):format(Object)
	elseif Type == "Instance" then --// Instance:GetFullName() except it's not handicapped
		local Path = GetInstanceName(Object)
		local Parent = metatable.__index(Object, "Parent")
		while Parent and Parent ~= game do
			Path = GetInstanceName(Parent) .. Path
			Parent = metatable.__index(Parent, "Parent")
		end
		return (Object:IsDescendantOf(game) and "game" or "NIL") .. Path
	elseif Type == "table" then
		local Str = ""
		local Counter = 0
		for Idx, Obj in next, Object do
			Counter = Counter + 1
			local Obj = Obj ~= Object and Parse(Obj) or "THIS_TABLE"
			if Counter ~= Idx then
				Str = Str .. ("[%s] = %s, "):format(Idx ~= Object and Parse(Idx) or "THIS_TABLE", Obj) --maybe
			else
				Str = Str .. ("%s, "):format(Obj)
			end
		end
		return ("{%s}"):format(Str:sub(1, -3))
	elseif Type == "CFrame" or Type == "Vector3" or Type == "Vector2" or Type == "UDim2" or Type == "Color3" or Type == "Vector3int16" then
		return ("%s.%s(%s)"):format(Type, Type == "Color3" and "fromRGB" or "new", tostring(Object))
	elseif Type == "userdata" then --// Remove __tostring fields to counter traps
		local Result
		local Metatable = getrawmetatable(Object)
		local __tostring = Metatable and Metatable.__tostring
		if __tostring then
			setreadonly(Metatable, false)
			Metatable.__tostring = nil
			Result = tostring(Object)
			rawset(Metatable, "__tostring", __tostring)
			setreadonly(Metatable, rawget(Metatable, "__metatable") ~= nil)
		else
			Result = tostring(Object)
		end
		return Result
	else
		return tostring(Object)
	end
end

local Write = function(Remote, Arguments, Returns) --// Remote (Instance), Arguments (Table), Returns (Table)
	local Stuff = ("%s:%s(%s)\r\n"):format(Parse(Remote), Methods[metatable.__index(Remote, "ClassName")], Parse(Arguments):sub(2, -2))
	Settings.Output(Stuff) --// Output the remote call
	local _ = Settings.Copy and pcall(setclipboard, Stuff)
	if Settings.ShowScript and not PROTOSMASHER_LOADED then
		local Env = getfenv(3) --// ProtoSmasher HATES this line (detour_function breaks)
		local Script = rawget(Env, "script")
		if typeof(Script) == "Instance" then
			Settings.Output(("Script: %s"):format(Parse(Script)))
		end
	end
	if Returns and #Returns > 0 then
		Settings.Output(("Returned: %s"):format(Parse(Returns):sub(2, -2)))
	end
end

do --// Anti detection for tostring ( tostring(FireServer, InvokeServer) )
	local ORIG = tostring
	local new_function = newcclosure(function(obj)
		local Success, Result = pcall(ORIG or original_function, Original[obj] or obj)
		if Success then
			return Result
		else
			error(Result:gsub(script.Name .. ":%d+: ", ""))
		end
	end)
	Original[new_function] = ORIG
	ORIG = hookfunction(ORIG, new_function, true)
end

for Class, Method in next, Methods do --// FireServer and InvokeServer hooking ( FireServer(Remote, ...) )
	local ORIG = Instance.new(Class)[Method]
	local new_function = newcclosure(function(self, ...)
		local Returns = {(ORIG or original_function)(self, ...)}
		if typeof(self) == "Instance" and Methods[self.ClassName] == Method and not Settings.Blacklist[self.Name] and Settings.Enabled then
			Write(self, {...}, Settings.ShowReturns and Returns)
		end
		return unpack(Returns)
	end)
	Original[new_function] = ORIG
	ORIG = hookfunction(ORIG, new_function)
end

do --// Namecall hooking ( Remote:FireServer(...) )
	local ORIG = metatable.__namecall
	local new_function = newcclosure(function(self, ...)
		local Returns = {(ORIG or original_function)(self, ...)}
		local Arguments = {...}
		local Method = IsLuau and getnamecallmethod(self) or table.remove(Arguments)
		if typeof(Method) == "string" and Methods[self.ClassName] == Method and not Settings.Blacklist[self.Name] and Settings.Enabled then
			Write(self, Arguments, Settings.ShowReturns and Returns)
		end
		return unpack(Returns)
	end)
	Original[new_function] = ORIG
	setreadonly(metatable, false)
	metatable.__namecall = new_function
	setreadonly(metatable, true)
end

print("Lua U Enabled:", IsLuau)
warn("Settings:")
table.foreach(Settings, print)
warn("----------------")
