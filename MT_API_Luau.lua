if getgenv().MTAPIMutex ~= nil then
	return 
end
local is_protosmasher_caller = is_protosmasher_caller or checkcaller
local get_namecall_method = get_namecall_method or getnamecallmethod
local protect_function = protect_function or newcclosure or function(...)
	return ...
end
local type, assert = type, assert
local metatable = getrawmetatable(game);
(make_writeable or setreadonly or set_readonly)(metatable, false)

local d = {}
local e = {}
local f = {}
local g = {}
local h = {}
local i = {}
local j = {}
local k = {}
local __index = metatable.__index
local __newindex = metatable.__newindex
local __namecall = metatable.__namecall
metatable.__index = protect_function(function(self, index)
	if not is_protosmasher_caller() then
		if d[self] and d[self][index] then
			local u = d[self][index]
			return u.IsCallback and u.Value(self) or u.Value
		end
		if g[index] then
			local v = g[index]
			return v.IsCallback and v.Value(self) or v.Value
		end
		if j[self] and j[self][index] then 
			return k[self][index]
		end
	end
	return __index(self, index)
end)
metatable.__newindex = protect_function(function(self, index, value)
	if not is_protosmasher_caller() then
		if e[self] and e[self][index] then
			local z = e[self][index]
			return z.Callback and z.Callback(self, value) or nil
		end;
		if h[index] then
			local A = h[index]
			return A.Callback and A.Callback(self, value) or nil
		end
		if j[self] and j[self][index] then
			local type = type(value)
			local B = j[self][index]
			if type ~= B["Type"] then
				error("bad argument #3 to '".. index .."' ("..B["Type"].." expected, got ".. type ..")")
			end
			k[self][index] = value
			return
		end
	end
	return __newindex(self, index, value)
end)
metatable.__namecall = protect_function(function(self, ...)
	local E = {...}
	local F = get_namecall_method()
	if is_protosmasher_caller() then
		if F == "AddGetHook" then
			assert(#E > 0, "mt-api: Invalid argument count")
			local G = E[1]
			local H = E[2]
			local I = E[3]
			assert(type(G) == "string", "mt-api: Invalid hook type")
			d[self] = d[self] or {}
			if I then
				assert(type(H) == "function", "mt-api: Invalid callback function")
			end
			d[self][G] = {
				Value = H,
				IsCallback = I
			}
			local J = function()
				d[self][G] = nil
			end
			return {
				remove = J,
				Remove = J
			}
		end
		if F == "AddGlobalGetHook" then
			local K = E[1]
			local L = E[2]
			local M = E[3]
			assert(type(K) == "string", "mt-api: Invalid hook type")
			if M then
				assert(type(L) == "function", "mt-api: Invalid callback function")
			end
			g[K] = {
				Value = L,
				IsCallback = M
			}
			local N = function()
				g[K] = nil
			end;
			return {
				remove = N,
				Remove = N
			}
		end
		if F == "AddSetHook" then
			assert(#E > 0, "mt-api: Invalid argument count")
			local O = E[1]
			local P = E[2]
			assert(type(O) == "string", "mt-api: Invalid hook type")
			e[self] = e[self] or {}
			e[self][O] = {
				Callback = type(P) == "function" and P or nil
			}
			local Q = function()
				e[self][O] = nil
			end
			return {
				remove = Q,
				Remove = Q
			}
		end;
		if F == "AddGlobalSetHook" then
			assert(#E > 0, "mt-api: Invalid argument count")
			local R = E[1]
			local S = E[2]
			assert(type(R) == "string", "mt-api: Invalid hook type")
			h[R] = {
				Callback = type(S) == "function" and S or nil
			}
			local T = function()
				h[R] = nil
			end
			return {
				remove = T,
				Remove = T
			}
		end;
		if F == "AddCallHook" then
			assert(#E > 1, "mt-api: Invalid argument count")
			local U = E[1]
			local V = E[2]
			assert(type(U) == "string", "mt-api: Invalid hook type")
			assert(type(V) == "function", "mt-api: Invalid argument #2 (not function)")
			f[self] = f[self] or {}
			f[self][U] = {
				Callback = V
			}
			local W = function()
				f[self][U] = nil
			end
			return {
				remove = W,
				Remove = W
			}
		end;
		if F == "AddGlobalCallHook" then
			assert(#E > 1, "mt-api: Invalid argument count")
			local X = E[1]
			local Y = E[2]
			assert(type(X) == "string", "mt-api: Invalid hook type")
			assert(type(Y) == "function", "mt-api: Invalid argument #2 (not function)")
			i[X] = {
				Callback = Y
			}
			local Z = function()
				i[X] = nil
			end
			return {
				remove = Z,
				Remove = Z
			}
		end;
		if F == "AddPropertyEmulator" then
			assert(#E > 0, "mt-api: Invalid argument count")
			local _ = E[1]
			assert(type(_) == "string", "mt-api: Invalid hook type")
			local a0 = self[_]
			j[self] = j[self] or {}
			k[self] = k[self] or {}
			j[self][_] = {
				Type = type(a0)
			}
			k[self][_] = a0
			local a2 = function()
				j[self][_] = nil
				k[self][_] = nil
			end
			return {
				remove = a2,
				Remove = a2
			}
		end
		return __namecall(self, ...)
	end
	if f[self] and f[self][F] then
		local a3 = f[self][F]
		return a3["Callback"](self[F], unpack(E))
	end
	if i[F] then
		local a4 = i[F]
		return a4["Callback"](self, self[F], unpack(E))
	end
	return __namecall(self, ...)
end)
(make_readonly or setreadonly or set_readonly)(metatable, true)
getgenv().MTAPIMutex = true
