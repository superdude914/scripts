local UI = game:GetObjects("rbxassetid://2989692423")[1]
local Services = setmetatable(game:GetChildren(), {
	__index = function(self, Service)
		return game:GetService(Service)
	end
})
local Me = Services.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Code = Services.HttpService:GenerateGUID(true)
local DeltaSens
local Settings = setmetatable({
	Set = function(self, Setting, Value)
		local Label = UI[Setting]
		if Setting:sub(#Setting - 2) == "Key" then
			Label.State.Text = Value.Name
		else
			Label.State.Text = Value and "ON" or "OFF"
			Label.State.TextColor3 = Value and Color3.new(0,1,0) or Color3.new(1,0,0)
		end
	end,
	Hook = function(self, Setting, Function)
		return UI[Setting].State:GetPropertyChangedSignal("Text"):Connect(function()
				Function(UI[Setting].State.Text == "ON")
		end)
	end
}, {
	__index = function(self, Setting)
		if Setting:sub(#Setting - 2) == "Key" then
			local Setting = UI[Setting].State.Text
			return Setting ~= "Awaiting input..." and ((Setting:match("MouseButton") and Enum.UserInputType[Setting]) or Enum.KeyCode[Setting])
		elseif UI[Setting]:FindFirstChild("Slide") then
			return tonumber(UI[Setting].Value.Text)
		else
			return UI[Setting].State.Text == "ON"
		end
	end
})
local Utility = {
	GetPlayer = function(self)
		local MousePos = Services.UserInputService:GetMouseLocation()
		local Players = Services.Players:GetPlayers()
		local Selected, Distance = nil, Settings.MaxDistance
		for i = 1, #Players do
			local Player = Players[i]
			local Character = Player.Character or workspace:FindFirstChild(Player.Name, true)
			local Head = Character and (Character:FindFirstChild(Settings.AimForHead and "Head" or "HumanoidRootPart", true) or Character.PrimaryPart)
			if (Player ~= Me) and (self:IsValidHead(Head)) and ((Settings.TeamCheck and Player.TeamColor ~= Me.TeamColor) or (not Settings.TeamCheck)) then
				local Point, Visible = Camera:WorldToScreenPoint(Head.Position)
				if Visible then
					local SelectedDistance = (Vector2.new(Point.X, Point.Y) - MousePos).Magnitude
					local Eval = SelectedDistance <= Distance
					Selected = Eval and Head or Selected
					Distance = Eval and SelectedDistance or Distance
				end
			end
		end
		return Selected
	end,
	GetInputType = function(self, Input)
		return Input.KeyCode.Name ~= "Unknown" and Input.KeyCode or
		Input.UserInputType.Name:match("MouseButton") and Input.UserInputType
	end,
	IsValidHead = function(self, Head)
		if not Head then
			return false 
		end
		local Character = Head:FindFirstAncestorOfClass("Model")
		local Humanoid = Character and (Character:FindFirstChildWhichIsA("Humanoid",true) or {Health = (Character:FindFirstChild("Health",true) or {Value = 1}).Value})
		local _, Visible = Camera:WorldToViewportPoint(Head.Position)
		return Humanoid and Visible and Humanoid.Health > 0
	end
}
local ContextActionFunctions = {
	Aimbotting = function(_, State)
		if not Settings.Functionality or (Settings.AimKeyToggles and State == Enum.UserInputState.End) then
			return
		end
		Settings:Set("Aimbotting", not Settings.Aimbotting)
	end,
	Functionality = function(_, State)
		if State == Enum.UserInputState.Begin and not Settings.Aimbotting then
			Settings:Set("Functionality", not Settings.Functionality)
		end
	end
}
local MoveMouse = (Input and Input.MoveMouse) or mousemoverel
for Index, Button in next, UI:GetChildren() do
	if Button.ClassName == "TextButton" and Button:FindFirstChild("State") then
		if Button.Name:sub(#Button.Name - 2) == "Key" then
			local FunctionName = Button.Name:sub(1, #Button.Name - 3)
			Button.MouseButton1Click:Connect(function()
				Services.ContextActionService:UnbindAction(Code..Button.Name:sub(1, #Button.Name - 3))
				Button.State.Text = "Awaiting input..."
				local Input
				repeat
					Input = Utility:GetInputType(Services.UserInputService.InputBegan:Wait())
				until Input
				Settings:Set(Button.Name, Input)
			end)
			Settings:Hook(Button.Name, function()
				local Input = Settings[Button.Name]
				if Input then
					Services.ContextActionService:BindAction(Code..FunctionName, ContextActionFunctions[FunctionName], false, Input)
				end
			end)
			Services.ContextActionService:BindAction(Code..FunctionName, ContextActionFunctions[FunctionName], false, Settings[Button.Name])
		else
			Button.MouseButton1Click:Connect(function()
				Settings:Set(Button.Name, not Settings[Button.Name])
			end)
		end
	elseif Button:FindFirstChild("Slide") then
		local Slider = Button.Slide.Slider
		Slider.MouseButton1Down:Connect(function()
			local MaxValue = tonumber(Button.Value.Text) / Slider.Position.X.Scale
			while Services.UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
				local Mouse = Services.UserInputService:GetMouseLocation()
				Slider.Position = UDim2.new(
					math.clamp((Mouse.X - Slider.Parent.AbsolutePosition.X) / 184, 0, 1),
					0,
					.5,
					-3
				)
				Button.Value.Text = math.clamp(math.floor(MaxValue * Slider.Position.X.Scale), 0, MaxValue)
				Services.RunService.RenderStepped:Wait()
			end
		end)
	end
end
local CF = CFrame.new
local V2 = Vector2.new
Settings:Hook("Aimbotting", function(Aimbotting)
	if Aimbotting then
		local Aim = Utility:GetPlayer()
		local Smoothness = 1 - Settings.Smoothness / 100
		if MoveMouse and Smoothness ~= 0.99 then
			DeltaSens = Services.UserInputService.MouseDeltaSensitivity
			Services.UserInputService.MouseDeltaSensitivity = Smoothness
			Services.RunService:BindToRenderStep(Code.."RenderStep", 2000, function()
				if not Utility:IsValidHead(Aim) then
					Aim = Utility:GetPlayer()
					return
				end
				local ScreenPoint = Camera:WorldToViewportPoint(Aim.Position)
				local MousePos = V2(ScreenPoint.X, ScreenPoint.Y) - Services.UserInputService:GetMouseLocation()
				MoveMouse(MousePos.X, MousePos.Y)
			end)
		else
			Services.RunService:BindToRenderStep(Code.."RenderStep", 2000, function()
				if not Utility:IsValidHead(Aim) then
					Aim = Utility:GetPlayer()
					return
				end
				Camera.CFrame = Camera.CFrame:Lerp(CF(Camera.CFrame.Position, Aim.Position), Smoothness)
			end)
		end
	else
		Services.UserInputService.MouseDeltaSensitivity = DeltaSens
		Services.RunService:UnbindFromRenderStep(Code.."RenderStep")
	end
end)
Services.ContextActionService:BindAction(Code.."CloseOpen", function(_, State)
	if State == Enum.UserInputState.Begin and Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		UI.Visible = not UI.Visible
	end
end, false, Enum.KeyCode.Tab)
Settings:Set("TeamCheck", #Services.Teams:GetChildren() > 0)
UI.Name = Code
UI.Parent = game:GetService("CoreGui"):FindFirstChildOfClass("ScreenGui")
