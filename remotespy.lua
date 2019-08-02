--// Written by chaserks (chaserks @ v3rmillion.net, chaserks#3441 @ Discord)
--// Lua U compatible Remote Spy (Also works on non-Lua U games)
--// Requires getnamecallmethod (When used on a Lua U game), hookfunction / detour_function, getrawmetatable, setclipboard (When used with the SetToClipboard setting enabled)
--// LATEST UPDATE: Offers detection protection against tostring and rawequal (You will not be able to detect FireServer & InvokeServer spoofs with these functions anymore)
 
--// This script has a high chance of not functioning on the ProtoSmasher exploit software
--// If you need assistance with anything related to this script then go ahead and message me on Discord, I'll be glad to help if you're a willing learner

_G.Settings = {
    SetToClipboard = false, --// Set remote calls to clipboard as code
    RemoteBlacklist = { --// Ignore remote calls made with these remotes
        CharacterSoundEvent = true,
    }
}
 
local metatable = getrawmetatable(game)
local LuaU = select(2, pcall(game)) == "attempt to call a userdata value"
print("Lua U Enabled:", LuaU)
local getnamecallmethod = getnamecallmethod or function()
    return "FireServer"
end
local hookfunction = hookfunction or detour_function
local newcclosure = newcclosure or protect_function or function(...)
    return ...
end
local game, typeof, setreadonly, getmetatable, setmetatable, pcall, tostring, remove, next, setclipboard, warn = game, typeof, setreadonly or set_readonly, debug.getmetatable or getrawmetatable, debug.setmetatable or setrawmetatable, pcall, tostring, table.remove, next, setclipboard, warn
local Methods = {
    RemoteEvent = "FireServer",
    RemoteFunction = "InvokeServer"
}
local Original = {}
local Settings = _G.Settings
local GetInstanceName = function(Object)
    local Name = metatable.__index(Object, "Name")
    return ((#Name == 0 or Name:match("[^%w]+") or Name:sub(1, 1):match("[^%a]")) and "[\"%s\"]" or ".%s"):format(Name)
end
local function Parse(Object)
    local Type = (typeof or type)(Object);
    if Type == "string" then
        return ("\"%s\""):format(Object)
    elseif Type == "Instance" then
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
    else
        return tostring(Object)
    end
end
local Write = function(Remote, Arguments)
    local Stuff = ("%s:%s(unpack%s)"):format(Parse(Remote), Methods[metatable.__index(Remote, "ClassName")], Parse(Arguments))
    warn(Stuff)
    local _ = Settings.SetToClipboard and setclipboard(Stuff)
end
do
    local original_function = tostring
	local new_function = newcclosure(function(...)
		local Metatable, __tostring = (...) and getmetatable(...)
		if Metatable and Metatable.__tostring then
			__tostring = Metatable.__tostring
			setreadonly(Metatable, false)
			Metatable.__tostring = nil
		end
        local Success, Result = pcall(original_function, Original[...] or ...)
		if Success then
			if __tostring then
				Metatable.__tostring = __tostring
				setreadonly(Metatable, Metatable.__metatable ~= nil)
			end
            return Result
        else
            error(Result:gsub(script.Name .. ":%d+: ", ""))
        end
    end)
    Original[new_function] = original_function
    original_function = hookfunction(original_function, new_function, true)
end
do
    local original_function = rawequal
    local new_function = newcclosure(function(...)
        local obj1, obj2 = ...
        local Success, Result = pcall(original_function, ...)
        if Success then
            return Result or (original_function(obj1,  Original[obj2]) or original_function(obj2, Original[obj1]))
        else
            error(Result:gsub(script.Name .. ":%d+: ", ""))
        end
    end)
    Original[new_function] = original_function
    original_function = hookfunction(original_function, new_function, true)
end
do
    local original_function = metatable.__namecall
    local new_function = newcclosure(function(self, ...)
        local Arguments = {...}
        local Method = (LuaU and getnamecallmethod() or remove(Arguments))
        if typeof(Method == "string") and Methods[metatable.__index(self, "ClassName")] == Method and not Settings.RemoteBlacklist[metatable.__index(self, "Name")] then
            Write(self, Arguments)
        end
        return original_function(self, ...);
    end)
    Original[new_function] = original_function
    original_function = hookfunction(original_function, new_function, true)
end
for Class, Method in next, Methods do
    local original_function = Instance.new(Class)[Method]
    local new_function = newcclosure(function(self, ...)
        if typeof(self) == "Instance" and Methods[metatable.__index(self, "ClassName")] == Method and not Settings.RemoteBlacklist[metatable.__index(self, "Name")] then
            Write(self, {...})
        end
        return original_function(self, ...)
    end)
    Original[new_function] = original_function
    original_function = hookfunction(original_function, new_function, true)
end