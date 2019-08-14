if getgenv().MTAPIMutex ~= nil then
	return
end
local a = function()
	if is_protosmasher_caller ~= nil then
		return 0
	end
	if elysianexecute ~= nil then
		return 1
	end
	if fullaccess ~= nil then
		return 2
	end
	if Synapse ~= nil then
		return 3
	end
	return 4
end
local a, b = a, function()
	local c = a()
	if c == 0 then
		return is_protosmasher_caller
	end
	if c == 1 or c == 3 then
		return checkcaller
	end
	if c == 2 then
		return IsLevel7
	end
	return nil
end
if a() == 2 then
	error("mt-api: Exploit not supported")
end
local d = {}
local e = {}
local f = {}
local g = {}
local h = {}
local i = {}
local j = {}
local k = {}
a = a
a = b
a = d
a = g
a = j
a = k
a = e
a = h
a = f
local a, l = i, function()
	local deg = select(2, pcall(game)) == "attempt to call a userdata value"
	local c = a()
	local m = b()
	local n = getrawmetatable(game)
	if c == 0 then
		make_writeable(n)
	elseif c == 2 then
		fullaccess(n)
	else
		setreadonly(n, false)
	end
	local o = n.__index
	local p = n.__newindex
	local q = n.__namecall
	c = m
	c = o
	c = d
	c = g
	c = j
	c = k
	n.__index = newcclosure(function(r, s)
		if m() then
			return o(r, s)
		end
		if d[r] and d[r][s] then
			local t = d[r][s]
			if t.IsCallback == true then
				return t.Value(r)
			else
				return t.Value
			end
		end
		if g[s] then
			local t = g[s]
			if t.IsCallback == true then
				return t.Value(r)
			else
				return t.Value
			end
		end
		if j[r] and j[r][s] then
			return k[r][s]
		end
		return o(r, s)
	end)
	c = m
	c = p
	c = e
	c = h
	c = j
	c = k
	n.__newindex = newcclosure(function(r, s, u)
		if m() then
			return p(r, s, u)
		end
		if e[r] and e[r][s] then
			local t = e[r][s]
			if t.Callback == nil then
				return
			else
				t.Callback(r, u)
				return
			end
		end
		if h[s] then
			local t = h[s]
			if t.Callback == nil then
				return
			else
				t.Callback(r, u)
				return
			end
		end
		if j[r] and j[r][s] then
			local t = j[r][s]
			if type(u) ~= t.Type then
				error("bad argument #3 to '" .. s .. "' (" .. t.Type .. " expected, got " .. type(s) .. ")")
			end
			k[r][s] = u
			return
		end
		return p(r, s, u)
	end)
	c = m
	c = d
	c = g
	c = e
	c = h
	c = f
	c = i
	c = o
	c = j
	c = k
	c = q
	n.__namecall = newcclosure(function(r, ...)
		local v = {
			...
		}
		local w = deg and getnamecallmethod() or table.remove(v)
		if m() then
			if w == "AddGetHook" then
				if #v < 1 then
					error("mt-api: Invalid argument count")
				end
				do
					local x = v[1]
					local u = v[2]
					local y = v[3]
					if type(x) ~= "string" then
						error("mt-api: Invalid hook type")
					end
					if not d[r] then
						d[r] = {}
					end
					if y == true and type(u) ~= "function" then
						error("mt-api: Invalid callback function")
					end
					d[r][x] = {Value = u, IsCallback = y}
					r = d
					r = r
					local r, z = x, function()
						d[r][x] = nil
					end
					return {remove = z, Remove = z}
				end
			end
			if w == "AddGlobalGetHook" then
				do
					local x = v[1]
					local u = v[2]
					local y = v[3]
					if type(x) ~= "string" then
						error("mt-api: Invalid hook type")
					end
					if y == true and type(u) ~= "function" then
						error("mt-api: Invalid callback function")
					end
					g[x] = {Value = u, IsCallback = y}
					r = g
					local r, z = x, function()
						g[x] = nil
					end
					return {remove = z, Remove = z}
				end
			end
			if w == "AddSetHook" then
				if #v < 1 then
					error("mt-api: Invalid argument count")
				end
				do
					local x = v[1]
					local u = v[2]
					if type(x) ~= "string" then
						error("mt-api: Invalid hook type")
					end
					if not e[r] then
						e[r] = {}
					end
					if type(u) == "function" then
						e[r][x] = {Callback = u}
					else
						e[r][x] = {Callback = nil}
					end
					r = e
					r = r
					local r, z = x, function()
						e[r][x] = nil
					end
					return {remove = z, Remove = z}
				end
			end
			if w == "AddGlobalSetHook" then
				if #v < 1 then
					error("mt-api: Invalid argument count")
				end
				do
					local x = v[1]
					local u = v[2]
					if type(x) ~= "string" then
						error("mt-api: Invalid hook type")
					end
					if type(u) == "function" then
						h[x] = {Callback = u}
					else
						h[x] = {Callback = nil}
					end
					r = h
					local r, z = x, function()
						h[x] = nil
					end
					return {remove = z, Remove = z}
				end
			end
			if w == "AddCallHook" then
				if #v < 2 then
					error("mt-api: Invalid argument count")
				end
				do
					local x = v[1]
					local u = v[2]
					if type(x) ~= "string" then
						error("mt-api: Invalid hook type")
					end
					if type(u) ~= "function" then
						error("mt-api: Invalid argument #2 (not function)")
					end
					if not f[r] then
						f[r] = {}
					end
					f[r][x] = {Callback = u}
					r = f
					r = r
					local r, z = x, function()
						f[r][x] = nil
					end
					return {remove = z, Remove = z}
				end
			end
			if w == "AddGlobalCallHook" then
				if #v < 2 then
					error("mt-api: Invalid argument count")
				end
				do
					local x = v[1]
					local u = v[2]
					if type(x) ~= "string" then
						error("mt-api: Invalid hook type")
					end
					if type(u) ~= "function" then
						error("mt-api: Invalid argument #2 (not function)")
					end
					i[x] = {Callback = u}
					r = i
					local r, z = x, function()
						i[x] = nil
					end
					return {remove = z, Remove = z}
				end
			end
			if w == "AddPropertyEmulator" then
				if #v < 1 then
					error("mt-api: Invalid argument count")
				end
				do
					local x = v[1]
					if type(x) ~= "string" then
						error("mt-api: Invalid hook type")
					end
					local u = o(r, x)
					local A = type(u)
					if not j[r] then
						j[r] = {}
					end
					if not k[r] then
						k[r] = {}
					end
					j[r][x] = {Type = A}
					k[r][x] = o(r, x)
					r = j
					r = r
					r = x
					local r, z = k, function()
						j[r][x] = nil
						k[r][x] = nil
					end
					return {remove = z, Remove = z}
				end
			end
			return v[1](r, ...)
		end
		if f[r] and f[r][w] then
			local t = f[r][w]
			return t.Callback(o(r, w), unpack(v))
		end
		if i[w] then
			local t = i[w]
			return t.Callback(r, o(r, w), unpack(v))
		end
		return q(r, ...)
	end)
	if c == 0 then
		make_readonly(n)
	elseif c == 2 then
	else
		setreadonly(n, true)
	end
end
l()
getgenv().MTAPIMutex = true
