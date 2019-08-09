--// Written by chaserks (chaserks @ v3rmillion.net, chaserks#3441 @ Discord)
--// Lua U compatible Remote Spy (Also works on non-Lua U games)
--// Required functions to run this script: getrawmetatable, hookfunction / detour_function / replace_closure, getnamecallmethod
--// If you need assistance with anything related to this script then go ahead and message me on Discord, I'll be glad to help if you're a willing learner

_G.Settings = {
    SetToClipboard = false, --// Set remote calls to clipboard as code
    RemoteBlacklist = { --// Ignore remote calls made with these remotes
        CharacterSoundEvent = true,
    },
    ShowCaller = true --// Print out the script that made the remote call
}
 
local metatable = getrawmetatable(game)
local LuaUEnabled = select(2, pcall(game)) == "attempt to call a userdata value"

local Original = {}
local Settings = _G.Settings
local Methods = {
    RemoteEvent = "FireServer",
    RemoteFunction = "InvokeServer"
}

local getnamecallmethod, newcclosure, hookfunction = getnamecallmethod or function(obj)
    local Method = obj and Methods[obj.ClassName]
    if Method then
        return Method
    end
end, newcclosure or protect_function or function(...)
    return ...
end, hookfunction or replace_closure or detour_function

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
    elseif Type == "CFrame" or Type == "Vector3" or Type == "Vector2" or Type == "UDim2" or Type == "Color3" or Type == "Vector3int16" then
        return ("%s.%s(%s)"):format(Type, Type == "Color3" and "fromRGB" or "new", tostring(Object))
    else
        return tostring(Object)
    end
end

local Write = function(Remote, Arguments)
    local Stuff = ("%s:%s(unpack%s)"):format(Parse(Remote), Methods[metatable.__index(Remote, "ClassName")], Parse(Arguments))
    warn(Stuff)
    local _ = Settings.SetToClipboard and pcall(setclipboard, Stuff)
    local Script = Settings.ShowCaller and getfenv(3).script
    if typeof(Script) == "Instance" then
        warn(("Script: %s"):format(Parse(Script)))
    end
end

do
    local original_function = tostring
	local new_function = newcclosure(function(obj)
        local Metatable, __tostring = obj and getrawmetatable(obj)
        if Metatable and Metatable ~= metatable and getfenv(2).script == script then
            __tostring = Metatable.__tostring
			setreadonly(Metatable, false)
			Metatable.__tostring = nil
		end
        local Success, Result = pcall(original_function, Original[obj] or obj)
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
    original_function = hookfunction(original_function, new_function)
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
    original_function = hookfunction(original_function, new_function)
end

do
    local original_function = metatable.__namecall
    local new_function = newcclosure(function(self, ...)
        local Arguments = {...}
        local Method = (LuaUEnabled and getnamecallmethod(self) or table.remove(Arguments))
        if typeof(Method) == "string" and Methods[metatable.__index(self, "ClassName")] == Method and not Settings.RemoteBlacklist[metatable.__index(self, "Name")] then
            Write(self, Arguments)
        end
        return original_function(self, ...);
    end)
    Original[new_function] = original_function
    setreadonly(metatable, false)
    metatable.__namecall = new_function
    setreadonly(metatable, true)
end

print("Lua U Enabled:", LuaUEnabled)
warn("Settings:")
table.foreach(Settings, print)
warn("----------------")
