local Games = {
    [301549746] = "Counter Blox",
    [863266079] = "Apocalypse Rising 2",
}
--WHOOPSSSSSSSSSSSSSS I JUST SHAT MYSELF!!!!!!!!!!!!!
local Game = assert(Games[game.PlaceId], "Invalid place!")

local UI = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local PlayerFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Title_4 = Instance.new("TextButton")
local Line = Instance.new("TextLabel")
local List = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Button = Instance.new("TextButton")
local Shadow = Instance.new("TextLabel")
local Input_Label = Instance.new("TextBox")
local TextLabel_Input = Instance.new("TextLabel")
local Shadow_Input = Instance.new("TextLabel")
local ESPFrame = Instance.new("Frame")
local ESPLabel = Instance.new("TextLabel")
local DistanceLabel = Instance.new("TextLabel")

Main.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -275, 0.5, -150)
Main.Size = UDim2.new(0, 550, 0, 300)

PlayerFrame.BackgroundTransparency = 1
PlayerFrame.BorderColor3 = Color3.new(0.196078, 0.196078, 0.196078)
PlayerFrame.Position = UDim2.new(0.5, -250, 0, 30)
PlayerFrame.Size = UDim2.new(0, 150, 1, -40)

ESPFrame.Size = UDim2.new(1, 0, 1, 0)
ESPFrame.BackgroundTransparency = 1
ESPFrame.Visible = false
local ItemESPFrame = ESPFrame:Clone()

ESPLabel.BackgroundTransparency = 1
ESPLabel.Size = UDim2.new(0, 1, 0, 30)
ESPLabel.Font = Enum.Font.GothamSemibold
ESPLabel.TextStrokeTransparency = 0.65
ESPLabel.TextColor3 = Color3.new(0.9, 0.9, 0.9)
ESPLabel.TextSize = 16
ESPLabel.TextYAlignment = Enum.TextYAlignment.Top

DistanceLabel.BackgroundTransparency = 1
DistanceLabel.Size = UDim2.new(1, 0, 1, 0)
DistanceLabel.Font = Enum.Font.GothamSemibold
DistanceLabel.TextStrokeTransparency = 0.9
DistanceLabel.TextYAlignment = Enum.TextYAlignment.Bottom
DistanceLabel.Name = "D"
DistanceLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
DistanceLabel.Parent = ESPLabel

Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, -30)
Title.Size = UDim2.new(0, 150, 0, 30)
Title.Font = Enum.Font.GothamBold
Title.Text = "PLAYER"
Title.TextColor3 = Color3.new(0.882353, 0.882353, 0.882353)
Title.TextSize = 20
Title.Parent = PlayerFrame

Line.BackgroundTransparency = 1
Line.Position = UDim2.new(0, 0, 0, 2)
Line.Size = UDim2.new(1, 0, 1, 0)
Line.Font = Enum.Font.GothamBold
Line.Text = "_________"
Line.TextColor3 = Color3.new(0.882353, 0.882353, 0.882353)
Line.TextSize = 20
Line.Parent = Title

List.BackgroundColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
List.BorderColor3 = Color3.new(0.196078, 0.196078, 0.196078)
List.Size = UDim2.new(1, 0, 1, 0)
List.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
List.CanvasSize = UDim2.new(0, 0, 1, 0)
List.ScrollBarThickness = 5
List.Name = "List"
List.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
List.Parent = PlayerFrame

UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = List

Button.Name = "Button"
Button.BackgroundColor3 = Color3.new(0.0392157, 0.0392157, 0.0392157)
Button.BorderColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Button.Size = UDim2.new(0.85, 0, 0, 30)
Button.Font = Enum.Font.GothamSemibold
Button.Text = "Example Cheat"
Button.TextColor3 = Color3.new(0.882353, 0.882353, 0.882353)
Button.TextSize = 16

local GameFrame = PlayerFrame:Clone()
local AimbotFrame = PlayerFrame:Clone()
GameFrame.Position = UDim2.new(0.5, -75, 0, 30)
AimbotFrame.Position = UDim2.new(0.5, 100, 0, 30)
GameFrame:FindFirstChildOfClass("TextLabel").Text = "GAME"
AimbotFrame:FindFirstChildOfClass("TextLabel").Text = "AIMBOT"
GameFrame.Parent = Main
AimbotFrame.Parent = Main

Title_4.BackgroundTransparency = 1
Title_4.Position = UDim2.new(0, 0, 0, -25)
Title_4.Size = UDim2.new(1, 0, 0, 25)
Title_4.Font = Enum.Font.GothamBlack
Title_4.Text = Game
Title_4.TextColor3 = Color3.new(1, 1, 1)
Title_4.TextSize = 24
Title_4.Parent = Main

Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0, 1, 0, 1)
Shadow.Size = UDim2.new(1, 0, 1, 0)
Shadow.ZIndex = 0
Shadow.Font = Enum.Font.GothamBlack
Shadow.Text = Game
Shadow.TextColor3 = Color3.new(0, 0, 0)
Shadow.TextSize = 24
Shadow.TextStrokeTransparency = 0
Shadow.Parent = Title_4

Input_Label.Visible = false
Input_Label.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
Input_Label.BorderColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Input_Label.Position = UDim2.new(0.5, -75, 0.5, -15)
Input_Label.Size = UDim2.new(0, 150, 0, 30)
Input_Label.Font = Enum.Font.GothamSemibold
Input_Label.PlaceholderColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Input_Label.TextColor3 = Color3.new(0.882353, 0.882353, 0.882353)
Input_Label.TextSize = 14

TextLabel_Input.BackgroundTransparency = 1
TextLabel_Input.Position = UDim2.new(0, 0, -1, 0)
TextLabel_Input.Size = UDim2.new(1, 0, 1, 0)
TextLabel_Input.Font = Enum.Font.Gotham
TextLabel_Input.TextColor3 = Color3.new(1, 1, 1)
TextLabel_Input.TextSize = 18
TextLabel_Input.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_Input.Parent = Input_Label

Shadow_Input.BackgroundTransparency = 1
Shadow_Input.Position = UDim2.new(0, 1, 0, 1)
Shadow_Input.Size = UDim2.new(1, 0, 1, 0)
Shadow_Input.ZIndex = 0
Shadow_Input.Font = Enum.Font.Gotham
Shadow_Input.TextColor3 = Color3.new(0, 0, 0)
Shadow_Input.TextSize = 18
Shadow_Input.TextXAlignment = Enum.TextXAlignment.Left
Shadow_Input.Parent = TextLabel_Input

--// ------------------------------------------- \\--

local Services = setmetatable({}, {
	__index = function(self, index)
		local Valid, Service = pcall(game.GetService, game, index)
		if Valid then
			self[index] = Service
			return Service
		end
	end
})

local Stepped = Services.RunService.RenderStepped

local TypeFrames = {
	Game = GameFrame,
	Player = PlayerFrame,
	Aimbot = AimbotFrame
}

local StateColors = {
	[false] = Color3.fromRGB(225, 225, 225),
	[true] = Color3.fromRGB(0, 170, 255)
}

local StatePositions = {
	[false] = UDim2.new(0.5, -275, 1, 0),
	[true] = UDim2.new(0.5, -275, 0.5, -150)
}

local Cheats = setmetatable({}, {
	__index = {
        Add = function(self, Type, Name, Function)
            if not self[Name] then
                local Frame = assert(TypeFrames[Type], "Bad type").List
                local Button = Button:Clone()
                Button.Text = Name
                Button.Parent = Frame
                Button.MouseButton1Click:Connect(Function)
                self[Name] = Button
            end
		end,
		IsEnabled = function(self, Name)
			local Button = assert(self[Name], "Bad cheat name")
			return Button.TextColor3 == StateColors[true]
		end,
		Toggle = function(self, Name)
			local State = not self:IsEnabled(Name)
			self[Name].TextColor3 = StateColors[State]
			return State
		end,
		GetInput = function(self, Name)
			Main.Visible = false
			Input_Label.Visible = true
			Input_Label.PlaceholderText = Name
			TextLabel_Input.Text = Name
			Shadow_Input.Text = Name
			Input_Label:CaptureFocus()
			Input_Label.Text = ""
			local Enter
			while not Enter do
				Enter = Input_Label.FocusLost:Wait()
			end
			Input_Label.Visible = false
			Main.Visible = true
			return Input_Label.Text
		end
	}
})

Title_4.MouseButton1Click:Connect(function()
	Main.Position = StatePositions[Main.Position == StatePositions[false]]
end)

local Settings = {
	Smoothness = 0.5,
	ESPDistance = math.huge,
	ItemESPDistance = math.huge
}

local next = next
local typeof = typeof
local setmetatable = setmetatable

local write = function(str, iswarning)
	local write = iswarning and warn or print
	write(("[okayHUB]: %s"):format(str))
end

local Scripts = _G.okayHUBScripts

if not Scripts then
	write("Scripts folder missing! Creating", true)
	Scripts = setmetatable({}, {
		__index = {
			findAllFunctions = function(self)
				local result = {}
				for script, funcs in next, self do
					for func, info in next, funcs do
						result[func] = info
					end
				end
				return result
			end,
			findScriptWithName = function(self, name)
				for script, funcs in next, self do
					if script.Name == name then
						return script
					end
				end
			end,
			findFunctionInfo = function(self, func)
				for func2, info in next, self:findAllFunctions() do
					if func2 == func then
						return info
					end
				end
			end,
			findFunctionsForScript = function(self, script)
				return self[script]
			end
		}
	})

	local GC = get_gc_objects or getgc or debug.getregistry
	local IsLClosure = is_l_closure or islclosure
	local IsProtosmasherClosure = is_protosmasher_closure or is_synapse_function

	local doFunction = function(f)
		if typeof(f) == "function" and IsLClosure(f) and not IsProtosmasherClosure(f) then
			local _ENV = getfenv(f)
			local script = _ENV.script
			if script ~= nil then
				local Functions = Scripts[script] or {}
				Functions[f] = setmetatable({}, {
					__index = function(self, index)
						if index == "upvalues" then
							local upvalues = debug.getupvalues(f)
							self.upvalues = upvalues
							return upvalues
						elseif index == "constants" then
							local constants = debug.getconstants(f)
                            local new = {}
                            for idx, cnst in next, constants do
                                new[cnst] = idx
                            end
                            self.constants = new
							return new
						elseif index == "_ENV" then
							self._ENV = _ENV
							return _ENV
						end
					end
				})
				Scripts[script] = Functions
			end
		end
	end
	for _, f in next, GC() do
		doFunction(f)
	end
	Stepped:Wait()
end

_G.okayHUBScripts = Scripts
local Client = Services.Players.LocalPlayer
if Game == "Apocalypse Rising 2" then
    local Framework = Scripts:findFunctionInfo(getrenv()._G.ClientFramework).upvalues.api
    local Networking = Services.ReplicatedStorage:WaitForChild("Networking")
    Network:WaitForChild("Intercom"):Destroy()
    Instance.new("RemoteEvent", Networking).Name = "Intercom"
    for func, info in next, Scripts:findFunctionsForScript(Scripts:findScriptWithName("Characters")) do
        local characterStep = info.upvalues.characterStep
        if characterStep and not Settings.characterStep then
            Settings.characterStep = characterStep
            local code = decompile(characterStep)
            Stepped:Wait()
            code = "local character, delta, runTime = ...\n" .. code:gsub("while true do%s+end", function()
                write("CA")
                return ""
            end):gsub("character:Destroy%(%)", function()
                write("CD")
                return ""
            end):gsub("humanoid%.WalkSpeed = (%w+)", function(w)
                write("WalkSpeed")
                return "humanoid.WalkSpeed = nigs or " .. w .. "\nlocal _ = noclips and humanoid:ChangeState(11)\n"
            end):gsub("Enum%.HumanoidStateType%.StrafingNoPhysics", function()
                write("Anti Noclip")
                return "'meme'"
            end)
            Stepped:Wait()
            local Env = setmetatable(Scripts:findFunctionInfo(characterStep).upvalues, {
                __index = getrenv()
            })
            local newFunc = setfenv(loadstring(code), Env)
            Stepped:Wait()
            debug.setupvalue(func, "characterStep", newFunc)
            Stepped:Wait()
            Cheats:Add("Player", "Speed", function()
                Env.nigs = Cheats:Toggle("Speed") and tonumber(Cheats:GetInput("Speed"))
            end)
            Cheats:Add("Player", "Noclip", function()
                Env.noclips = Cheats:Toggle("Noclip") 
            end)
            Stepped:Wait()
            write("WalkSpeed, Noclip, AC Disable")
        end
    end
    for func, info in next, Scripts:findFunctionsForScript(Services.ReplicatedStorage.Client.Libraries.Network) do
        local Two = info.constants[2]
        if Two then
            debug.setconstant(func, Two, 1)
        end
    end
    for func, info in next, Scripts:findFunctionsForScript(Scripts:findScriptWithName("Bullets")) do
        local getSpredAngle = info.upvalues.getSpredAngle
        if getSpredAngle and not Settings.getSpredAngle then
            Settings.getSpredAngle = getSpredAngle
            Cheats:Add("Game", "No Spread", function()
                debug.setupvalue(func, "getSpredAngle", Cheats:Toggle("No Spread") and function()
                    return 0.001
                end or getSpredAngle)
            end)
            write("No Spread")
            Stepped:Wait()
        end
        local getFireImpulse = info.upvalues.getFireImpulse
        if getFireImpulse and not Settings.getFireImpulse then
            Settings.getFireImpulse = getFireImpulse
            Cheats:Add("Player", "No Recoil", function()
                debug.setupvalue(func, "getFireImpulse", Cheats:Toggle("No Recoil") and function()
                    return {
                        Vector2.new(),
                        0,
                        0,
                        0
                    }
                end or getFireImpulse)
            end)
            write("No Recoil")
            Stepped:Wait()
        end
    end
    for func, info in next, Scripts:findFunctionsForScript(Scripts:findScriptWithName("World")) do
        local abs = info.constants.abs
        if abs and not Settings.Set then
            Settings.Set = func
            local adjustDistances = info.upvalues.adjustDistances
            debug.setconstant(func, abs, "tanh")
            Cheats:Add("Game", "No Fog", function()
                debug.setupvalue(func, "adjustDistances", Cheats:Toggle("No Fog") and function()
                    Services.Lighting.FogEnd = 100000000
                end or adjustDistances)
            end)
            Cheats:Add("Game", "Gravity", function()
                workspace.Gravity = Cheats:Toggle("Gravity") and tonumber(Cheats:GetInput("Gravity")) or 196.2
            end)
            write("No Fog")
            Stepped:Wait()
        end
    end
    for func, info in next, Scripts:findFunctionsForScript(Services.ReplicatedStorage.Client.Libraries.Cameras.Character) do
        local Step = info.upvalues.step
        if Step and not Settings.BruhStep then
            Settings.BruhStep = Step
            local Constants = {70, 75, 33, 60}
            Cheats:Add("Player", "Field Of View", function()
                local newFOV = tonumber(Cheats:GetInput("Field Of View")) or 70
                for _, FOV in next, Constants do
                    debug.setconstant(Step, info.constants[FOV], newFOV * (FOV / 70))
                end
            end)
        end
    end
    local Camera = workspace.CurrentCamera
    local CF = CFrame.new
    local MoveMouse = Input and Input.MoveMouse or mousemoverel
    local Characters = workspace:WaitForChild("Characters")
    local FindTarget = function()
        local Distance, Selected = math.huge
        for _, Character in next, Characters:GetChildren() do
            if Character ~= Client.Character then
                local Part = Character:FindFirstChild(Settings.AimForHead and "Head" or "UpperTorso")
                local ScreenPointV3, OnScreen = Camera:WorldToViewportPoint(Part.Position)
                local Distance2 = (Services.UserInputService:GetMouseLocation() - Vector2.new(ScreenPointV3.X, ScreenPointV3.Y)).Magnitude
                if Distance2 <= Distance and OnScreen and (Settings.VisibilityCheck and #Camera:GetPartsObscuringTarget({Part.Position}, {Client.Character}) == 0 or not Settings.VisibilityCheck) then
                    Distance = Distance2
                    Selected = Part
                end
            end
        end
        return Selected
    end
    Cheats:Add("Aimbot", "Aimbot", function()
        Settings.Aimbot = Cheats:Toggle("Aimbot")
    end)
    Cheats:Add("Aimbot", "Aim For Head", function()
        Settings.AimForHead = Cheats:Toggle("Aim For Head")
    end)
    Cheats:Add("Aimbot", "Visibility Check", function()
        Settings.VisibilityCheck = Cheats:Toggle("Visibility Check")
    end)
    Cheats:Add("Aimbot", "Smoothness", function()
        Settings.Smoothness = 1 - math.clamp(tonumber(Cheats:GetInput("Smoothness")) or 0, 0, 99) / 100
    end)
    Cheats:Add("Game", "Player ESP", function()
        ESPFrame.Visible = Cheats:Toggle("Player ESP")
    end)
    Cheats:Add("Game", "Loot ESP", function()
        ItemESPFrame.Visible = Cheats:Toggle("Player ESP")
    end)
    local Items = {}
    Stepped:Connect(function()
        if Settings.Aimbot and Services.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            local Target = FindTarget()
            if Target then
                local ScreenPoint = Camera:WorldToViewportPoint(Target.Position)
                local NewPosition = (Vector2.new(ScreenPoint.X, ScreenPoint.Y) - Services.UserInputService:GetMouseLocation()) * Settings.Smoothness
                MoveMouse(NewPosition.X, NewPosition.Y)
            end
        end
        local Head = Client.Character and Client.Character:FindFirstChild("Head")
        if Head then
            if ESPFrame.Visible then
                for _, ESP in next, ESPFrame:GetChildren() do
                    local Position = Characters[ESP.Name].Head.Position
                    local ScreenPoint, Visible = Camera:WorldToViewportPoint(Position)
                    ESP.Visible = Visible and Settings.ESPDistance 
                    if Visible then
                        ESP.Position = UDim2.new(0, ScreenPoint.X, 0, ScreenPoint.Y)
                        ESP.D.Text = ("[%.0f]"):format((Head.Position - Position).Magnitude)
                    end
                end
            end
            if ItemESPFrame.Visible then
                for Position, ESP in next, Items do
                    local ScreenPoint, Visible = Camera:WorldToViewportPoint(Position)
                    ESP.Visible = Visible
                    if Visible then
                        ESP.Position = UDim2.new(0, ScreenPoint.X, 0, ScreenPoint.Y)
                        ESP.D.Text = ("[%.0f]"):format((Head.Position - Position).Magnitude)
                    end
                end
            end
        end
    end)
    local CharactersHook = function(Character)
        local Name = Character.Name
        if Name ~= Client.Name then
            local ESP = ESPLabel:Clone()
            ESP.Name = Name
            ESP.Text = Name
            ESP.Parent = ESPFrame
        end
    end
    local LootHook = function(Loot)
        local Name = Loot.Name
        local ESP = ESPLabel:Clone()
        Items[Loot.Position] = ESP
        ESP.Text = Text
        ESP.Parent = ItemESPFrame
    end
    local Loot = workspace:WaitForChild("Loot")
    Characters.ChildAdded:Connect(CharactersHook)
    Characters.ChildRemoved:Connect(function(Character)
        local ESP = ESPFrame:FindFirstChild(Character.Name)
        if ESP then
            ESP:Destroy()
        end
    end)
    for _, Character in next, Characters:GetChildren() do
        CharactersHook(Character)
    end
    Loot.ChildAdded:Connect(LootHook)
    Loot.ChildRemoved:Connect(function(Loot)
        local ESP = ItemESPFrame:FindFirstChild(Loot.Name .. tostring(Loot.CFrame.Position))
        if ESP then
            ESP:Destroy()
        end
    end)
elseif Game == "Counter Blox" then
    local Code = Services.HttpService:GenerateGUID()
    local SpoofRemote = Instance.new("RemoteEvent")
    local Env
    for func, info in next, Scripts:findFunctionsForScript(Client.PlayerGui.Client) do
        Env = Env or info._ENV
        local Kick, WalkSpeed = info.constants.Kick or info.constants.kick, info.constants[17.35]
        local _ = Kick and debug.setconstant(func, kick, "GetChildren")
        _ = WalkSpeed and (debug.setconstant(func, info.constants[25], -9999999) or Cheats:Add("Player", "Speed", function()
            debug.setconstant(func, WalkSpeed, Cheats:Toggle("Speed") and tonumber(Cheats:GetInput("Speed")) or 17.35)
        end))
    end
    local speedupdate = env.speedupdate
    Cheats:Add("Player", "No Slowdown", function()
        env.speedupdate = Cheats:Toggle("No Slowdown") and blank or speedupdate
    end)
    Cheats:Add("Player", "No Fall Damage", function()
        local State = Cheats:Toggle("No Slowdown")
        Services.ReplicatedStorage.Events.FallDamage.Name = State and Code or "FallDamage"
        SpoofRemote.Name = State and "FallDamage" or Code
    end)
    local firebullet, info = Env.firebullet, Scripts:findFunctionInfo(Env.firebullet)
    if info then
        warn("firebullet")
        local RecoilX, RecoilY = info.constants.RecoilX, info.constants.RecoilY
        Cheats:Add("Player", "No Recoil", function()
            local State = Cheats:Toggle("No Recoil")
            debug.setconstant(firebullet, RecoilX, State and "SpreadModifier" or "RecoilX")
            debug.setconstant(firebullet, RecoilY, State and "SpreadModifier" or "RecoilY")
        end)
    end
end

UI.ZIndexBehavior = Enum.ZIndexBehavior.Global
UI.Parent = Services.CoreGui
Main.Parent = UI
Input_Label.Parent = UI
ESPFrame.Parent = UI
ItemESPFrame.Parent = UI
PlayerFrame.Parent = Main
