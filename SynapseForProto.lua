syn = {
	crypt = {
		custom = {
			hash = protect_function(function(alg, s)
				return Hash[alg:sub(1, 1):upper() .. alg:sub(2):lower()](s)
			end)
		},
		base64 = {
			encode = Base64.Encode,
			decode = Base64.Decode
		}
	},
	get_thread_identity = get_thread_context
}
isreadonly = protect_function(function(o)
	return not is_writeable(o)
end)
is_readonly = isreadonly
fireclickdetector = click_detector
printoutput = add_to_console
newcclosure = protect_function
firesignal = fire_signal
mouse1click = MOUSE_CLICK
getnilinstances = get_nil_instances
getscripts = protect_function(function()
	local l = {}
	for script,  env in next, getscriptenvs() do
		l[#l+1] = script
	end
	return l
end)
checkcaller = is_protosmasher_caller
islclosure = is_l_closure
unlockmodulescript = unlock_modulescript
mousemoverel = Input.MoveMouse
replaceclosure = detour_function
getgc = get_gc_objects
firetouchinterest = fake_touch
getconnections = get_signal_cons
getreg = debug.getregistry
hookfunction = protect_function(function(a, b)
	local func = b
	detour_function(a, func, true)
	return getfenv(func).original_function
end)

for i, v in next, getfenv() do
	if i ~= "script" then
		getgenv()[i] = v
	end
end
