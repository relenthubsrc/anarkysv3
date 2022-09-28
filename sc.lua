wait(4) -- to allow script to run in auto execute basically
-- Loadstrings
loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/AnarkysAdmin/main/ownericons.lua"))()
wait(1)
-- Extra Loading stuff
--- dark chat loader (special to)
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local BubbleChatUI = PlayerGui:WaitForChild("BubbleChat")
BubbleChatUI.DescendantAdded:Connect(function(Descendant)
if Descendant:IsA("ImageLabel") then
Descendant.ImageColor3 = Color3.fromRGB(0, 3, 16)
elseif Descendant:IsA("TextLabel") then
Descendant.TextColor3 = Color3.new(1,1,1)
end
end)
-- Settings:
local PREFIX = "'"
-- Variables:
local LocalPlayer = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local mouse = LocalPlayer:GetMouse()
local ContentProvider = game:GetService("ContentProvider")
local Players = setmetatable(game:GetService("Players"):GetPlayers(), {
	__metatable = "Metatable is locked";
	__index = function(self, k)
		if k:lower() == "all" then
			return game:GetService("Players"):GetPlayers()
		elseif k:lower() == "others" then
			local plrReturn = {}
			for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
				if plr ~= LocalPlayer then
					table.insert(plrReturn, plr)
				end
			end
			return plrReturn
		elseif k:lower() == "me" then
			return {LocalPlayer}
		elseif k:lower() == "random" then
			return game:GetService("Players"):GetPlayers()[math.random(1, #game:GetService("Players"):GetPlayers())]
		else	
			for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
				if string.find(plr.Name:lower(), k:lower()) then
					return {plr}
				end
			end
		end
	end
})
-- Instances:
local CycloneGui = Instance.new("ScreenGui", game.CoreGui)
local mainFrame = Instance.new("ImageLabel", CycloneGui)
local titleLabel = Instance.new("TextLabel", mainFrame)
local bottomFrame = Instance.new("Frame", mainFrame)
local searchBox = Instance.new("TextBox", bottomFrame)
local cmdList = Instance.new("ScrollingFrame", bottomFrame)
local listLayout = Instance.new("UIListLayout", cmdList)
local topBlinker = Instance.new("Frame", CycloneGui)
local bottomBlinker = Instance.new("Frame", CycloneGui)
local introLabel = Instance.new("TextLabel")
local introFrame = Instance.new("ImageLabel", introLabel)
local introShadow = Instance.new("ImageLabel", introLabel)
local notifBar = Instance.new("ImageLabel")
local notifText = Instance.new("TextLabel", notifBar)
local barlabel = Instance.new("TextButton")
local CloseCmdBar = Instance.new("TextButton")
--Properties:
CycloneGui.Name = "CycloneGui"

mainFrame.Name = "mainFrame"
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.BackgroundTransparency = 1
mainFrame.Position = UDim2.new(0.82, 0, 1, 0)
mainFrame.Size = UDim2.new(0.16, 0, 0.4, 0)
mainFrame.ZIndex = 0
mainFrame.Image = "rbxassetid://2851927369"
mainFrame.ImageColor3 = Color3.new(0, 0.0196078, 0.0470588)
mainFrame.ScaleType = Enum.ScaleType.Slice
mainFrame.SliceCenter = Rect.new(10, 10, 10, 10)

titleLabel.Name = "titleLabel"
titleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(1, 0, 0.125409842, 0)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "Anarky's Admin V3"
titleLabel.TextColor3 = Color3.new(0.835294, 0.909804, 1)
titleLabel.TextSize = 14

bottomFrame.Name = "bottomFrame"
bottomFrame.BackgroundColor3 = Color3.new(0, 0.0117647, 0.0352941)
bottomFrame.BorderSizePixel = 0
bottomFrame.Position = UDim2.new(0, 0, 0.125409856, 0)
bottomFrame.Size = UDim2.new(1, 0, 0.874590158, 0)

searchBox.Name = "searchBox"
searchBox.BackgroundColor3 = Color3.new(0, 0.0196078, 0.0666667)
searchBox.BorderSizePixel = 0
searchBox.Size = UDim2.new(1, 0, 0.100000001, 0)
searchBox.ZIndex = 2
searchBox.Font = Enum.Font.GothamBold
searchBox.PlaceholderColor3 = Color3.new(0.113725, 0.188235, 0.34902)
searchBox.PlaceholderText = "Search"
searchBox.Text = ""
searchBox.TextColor3 = Color3.new(0.168627, 0.278431, 0.517647)
searchBox.TextSize = 10

cmdList.Name = "cmdList"
cmdList.BackgroundColor3 = Color3.new(0, 0.0156863, 0.0588235)
cmdList.BorderSizePixel = 0
cmdList.Position = UDim2.new(0, 0, 0.0999999866, 0)
cmdList.Size = UDim2.new(1, 0, 0.900000036, 0)
cmdList.ZIndex = 2
cmdList.CanvasSize = UDim2.new(0, 0, 10, 0)
cmdList.ScrollBarThickness = 0

listLayout.Name = "listLayout"

topBlinker.Name = "topBlinker"
topBlinker.BackgroundColor3 = Color3.new(0, 0, 0)
topBlinker.BorderSizePixel = 0
topBlinker.Size = UDim2.new(1, 0, 0, 0)
topBlinker.ZIndex = 4

bottomBlinker.Name = "bottomBlinker"
bottomBlinker.BackgroundColor3 = Color3.new(0, 0, 0)
bottomBlinker.BorderSizePixel = 0
bottomBlinker.Position = UDim2.new(0, 0, 1, 0)
bottomBlinker.Size = UDim2.new(1, 0, 0, 0)
bottomBlinker.ZIndex = 4

introLabel.Name = "introLabel"
introLabel.BackgroundColor3 = Color3.new(1, 1, 1)
introLabel.BackgroundTransparency = 1
introLabel.BorderSizePixel = 0
introLabel.Size = UDim2.new(1, 0, 1, 0)
introLabel.ZIndex = 2
introLabel.Font = Enum.Font.GothamBlack
introLabel.Text = "ANARKY'S V3"
introLabel.TextColor3 = Color3.new(0.835294, 0.909804, 1)
introLabel.TextSize = 100
introLabel.TextStrokeColor3 = Color3.new(0.258824, 0.282353, 0.309804)
introLabel.TextStrokeTransparency = 0

introFrame.Name = "introFrame"
introFrame.BackgroundColor3 = Color3.new(1, 1, 1)
introFrame.BackgroundTransparency = 1
introFrame.Position = UDim2.new(0.275894552, 0, 0.362831891, 0)
introFrame.Size = UDim2.new(0.447269291, 0, 0.267256588, 0)
introFrame.Image = "rbxassetid://2851920938"
introFrame.ImageColor3 = Color3.new(0, 0.0196078, 0.0470588)
introFrame.ScaleType = Enum.ScaleType.Slice
introFrame.SliceCenter = Rect.new(25, 25, 25, 25)

introShadow.Name = "introShadow"
introShadow.BackgroundColor3 = Color3.new(1, 1, 1)
introShadow.BackgroundTransparency = 1
introShadow.Position = UDim2.new(0.275894552, 0, 0.362831891, 0)
introShadow.Size = UDim2.new(0.447269291, 0, 0.287332058, 0)
introShadow.ZIndex = 0
introShadow.Image = "rbxassetid://2851920938"
introShadow.ImageColor3 = Color3.new(0, 0.0235294, 0.0705882)
introShadow.ScaleType = Enum.ScaleType.Slice
introShadow.SliceCenter = Rect.new(25, 25, 25, 25)

notifBar.Name = "notifBar"
notifBar.BackgroundColor3 = Color3.new(1, 1, 1)
notifBar.BackgroundTransparency = 1
notifBar.BorderSizePixel = 0
notifBar.Position = UDim2.new(0.55, 0, 0.97, 0)
notifBar.Size = UDim2.new(0.25, 0, 0.06, 0)
notifBar.ZIndex = 0
notifBar.Image = "rbxassetid://2851920938"
notifBar.ImageColor3 = Color3.new(0, 0.0196078, 0.0470588)
notifBar.ImageTransparency = 1
notifBar.ScaleType = Enum.ScaleType.Slice
notifBar.SliceCenter = Rect.new(25, 25, 25, 25)

notifText.Name = "notifText"
notifText.BackgroundColor3 = Color3.new(1, 1, 1)
notifText.BackgroundTransparency = 1
notifText.BorderSizePixel = 0
notifText.Size = UDim2.new(1, 0, 1, 0)
notifText.Font = Enum.Font.GothamBold
notifText.Text = "Error message"
notifText.TextColor3 = Color3.new(0.835294, 0.909804, 1)
notifText.TextSize = 10
notifText.TextStrokeTransparency = 1
notifText.TextTransparency = 1
notifText.TextWrapped = true

barlabel.Name = "barlabel"
barlabel.BackgroundColor3 = Color3.fromRGB(0, 3, 16)
barlabel.BackgroundTransparency = 1
barlabel.BorderSizePixel = 0
barlabel.Size = UDim2.new(1, 0, 0.01, 0)
barlabel.ZIndex = 3
barlabel.Font = Enum.Font.GothamBold
barlabel.TextColor3 = Color3.new(0.835294, 0.909804, 1)
barlabel.TextSize = 9
barlabel.TextTransparency = 1

CloseCmdBar.Name = "CloseCmdBar"
CloseCmdBar.Parent = mainFrame
CloseCmdBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseCmdBar.BackgroundTransparency = 1.000
CloseCmdBar.Position = UDim2.new(0.878257573, 0, 0.0148683088, 0)
CloseCmdBar.Size = UDim2.new(0, 38, 0, 21)
CloseCmdBar.Font = Enum.Font.GothamBold
CloseCmdBar.Text = "X"
CloseCmdBar.TextColor3 = Color3.fromRGB(213, 213, 213)
CloseCmdBar.TextScaled = true
CloseCmdBar.TextSize = 14.000
CloseCmdBar.TextWrapped = true
CloseCmdBar.MouseButton1Down:connect(function()
     mainFrame.Visible = false
end)
-- Script:
local localcc = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
local localblur = Instance.new("BlurEffect", game:GetService("Lighting"))
localblur.Size = 0
local tweenInfo1 = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local tweenInfo2 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
local tweenInfo3 = TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local cmdsHelp = {}
local cmdsHint = {}
local notifSound = Instance.new("Sound", CycloneGui)
notifSound.SoundId = "rbxassetid://180877191"
notifSound.Volume = 1
local Events = setmetatable({}, { -- These are mostly for debugging
	__metatable = "Metatable is locked";
	__newindex = function(self, i, k)
		warn("Event " .. k .. " created")
	end;
	__index = function(self, k)
		warn("Tried to access unknown event " .. k)
	end
}) -- Custom RBXScriptSignal with OOP
local stringSplit = function(str, pattern)
	local returnTab = {}
	local mainInd = 0
	for i = 1, #str do
		if string.sub(str, i, i + #pattern - 1) == pattern or i + #pattern == #str then
			local splitAdder = -1
			if i + #pattern == #str then
				splitAdder = 1
			end
			table.insert(returnTab, string.sub(str, mainInd, i + splitAdder))
			mainInd = i + #pattern
		end
	end
	return returnTab
end
CustomEnum = { -- Custom enumeration
	BlinkingDirection = {
		Close = 1;
		Open = 2;
	};
	NotifcationType = {
		Normal = 3;
		Important = 4;
		Random = 5;
		Error = 6;
	}
};
local function chatPlr(message) -- Makes you chat
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(message), "All")
end
local function createNotif(message, notifType) -- Create notifications
	local CnotifBar = notifBar:Clone()
	local notifCol = Color3.fromRGB(213, 232, 255)
	if notifType == 4 then
		notifCol = Color3.fromRGB(141, 255, 128)
	elseif notifType == 5 then
		notifCol = Color3.fromRGB(249, 255, 126)
	elseif notifType == 6 then
		notifCol = Color3.fromRGB(255, 49, 80)
	end
	CnotifBar.Parent = CycloneGui
	local notifBars = {}
	for _, v in pairs(CycloneGui:GetChildren()) do
		if v.Name == "notifBar" then
			table.insert(notifBars, v)
		end
	end
	local notifBarPos = Instance.new("NumberValue", CnotifBar)
	notifBarPos.Name = "notifBarPos"
	notifBarPos.Value = CnotifBar.Position.Y.Scale
	CnotifBar.notifText.Text = message
	CnotifBar.notifText.TextColor3 = notifCol
	notifSound:Play()
	TweenService:Create(CnotifBar, tweenInfo2, {ImageTransparency = 0}):Play()
	TweenService:Create(CnotifBar.notifText, tweenInfo2, {TextTransparency = 0}):Play()
	for index, notifB in pairs(notifBars) do
		TweenService:Create(notifB, tweenInfo2, {Position = UDim2.new(0.55, 0, notifB:FindFirstChild("notifBarPos").Value - 0.07, 0)}):Play()
		notifB:FindFirstChild("notifBarPos").Value = notifB:FindFirstChild("notifBarPos").Value - 0.07
	end
	wait(2)
	TweenService:Create(CnotifBar, tweenInfo2, {ImageTransparency = 1}):Play()
	TweenService:Create(CnotifBar.notifText, tweenInfo2, {TextTransparency = 1}):Play()
end
local Cyclone = {
	-- Functions:
	updateSearchBar = function(self)
		for _, v in pairs(cmdList:GetChildren()) do
			if not v:IsA("UIListLayout") then
				v:Destroy()
			end
		end
		for index, cmdHelper in pairs(cmdsHelp) do
			if string.find(cmdHelper, searchBox.Text) then
				local Cbarlabel = barlabel:Clone()
				Cbarlabel.MouseButton1Down:Connect(function()
					createNotif(cmdsHint[cmdHelper], CustomEnum.NotifcationType.Random)
				end)
				if index % 2 == 1 then
					Cbarlabel.BackgroundColor3 = Color3.fromRGB(0, 5, 22)
				end
				Cbarlabel.Text = PREFIX .. cmdHelper
				Cbarlabel.Parent = cmdList
				TweenService:Create(Cbarlabel, tweenInfo2, {TextTransparency = 0, BackgroundTransparency = 0}):Play()
			end
		end
	end;
	-- Methods:
	newConnection = function(self, eventName)
		assert(Events[eventName] == nil, "Event already exists")
		local newEvent = Instance.new("BindableEvent")
		Events[eventName] = newEvent
		return newEvent
	end;
	setBlinker = function(self, blinkType, speed, coverup)
		local newInfo = TweenInfo.new(speed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
		if blinkType == 1 then
			TweenService:Create(topBlinker, newInfo, {Size = UDim2.new(1, 0, coverup * 0.5 / 1, 0)}):Play()
			TweenService:Create(bottomBlinker, newInfo, {Size = UDim2.new(1, 0, coverup * 0.5 / 1, 0); Position = UDim2.new(0, 0, 1 - (coverup * 0.5 / 1), 0)}):Play()
		elseif blinkType == 2 then
			TweenService:Create(topBlinker, newInfo, {Size = UDim2.new(1, 0, 0, 0)}):Play()
			TweenService:Create(bottomBlinker, newInfo, {Size = UDim2.new(1, 0, 0, 0); Position = UDim2.new(0, 0, 1, 0)}):Play()
		end
	end;
	setBrightness = function(self, brightness, speed)
		local newInfo = TweenInfo.new(speed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
		TweenService:Create(localcc, newInfo, {Brightness = brightness}):Play()
	end;
	setBlur = function(self, size, speed)
		local newInfo = TweenInfo.new(speed, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
		TweenService:Create(localblur, newInfo, {Size = size}):Play()
	end;
	createSound = function(self, id, volume)
		local newSound = Instance.new("Sound", CycloneGui)
		newSound.SoundId = id
		newSound.Volume = volume
		return newSound
	end;
	createCommand = function(self, cmdName, cmdHelp, hint, func)
		table.insert(cmdsHelp, cmdHelp)
		cmdsHint[cmdHelp] = hint
		LocalPlayer.Chatted:Connect(function(msg)
			if PREFIX .. cmdName == string.sub(msg, 1, #PREFIX + #cmdName) then
				assert(type(func) == "function", "bad argument #3 to \"createCommand\" (function expected, got " .. type(func) .. ")")
				local params = stringSplit(msg, " ")
				table.remove(params, 1)
				params = stringSplit(table.concat(params), ",")
				func(params)
			end
		end)
	end;
}
-- Command variables:
local clicktp = nil
local oofspamming = false
-- Command creation:
Cyclone:createCommand("rjre", "rjre", "Makes you rejoin the game in same Character pos", function(cmdParameters)
	if not syn.queue_on_teleport then
	end
	rejoining = true
	local c = LocalPlayer.Character.Head.CFrame
	syn.queue_on_teleport(string.format([[
    game:GetService('ReplicatedFirst'):RemoveDefaultLoadingScreen()
    local playeradded, charadded
    playeradded = game:GetService('Players').PlayerAdded:Connect(function(plr)
        charadded = plr.CharacterAdded:Connect(function(char)
            char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(%f, %f, %f)
            charadded:Disconnect()
        end)
        playeradded:Disconnect()
    end)
]], c.X, c.Y, c.Z))
	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players"))
	wait(3)
	rejoining = false
end)
Cyclone:createCommand("respawn", "respawn", "Respawn your character", function(cmdParameters)
	createNotif("Respawning your Character...", CustomEnum.NotifcationType.Normal)
	LocalPlayer.Character:ClearAllChildren()
	local char = Instance.new("Model", workspace)
	Instance.new("Humanoid", char)
	LocalPlayer.Character = char
end)
Cyclone:createCommand("kidnap", "kidnap", "Enables Kidnap (walk up to someone and press T)", function(cmdParameters)
	createNotif("Kidnap enabled!", CustomEnum.NotifcationType.Normal)
	game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
		if key == 't' then
		local h = game.Players.LocalPlayer.Character.Humanoid:Clone()
		local plr = game.Players.LocalPlayer.Character
		local CF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		local lp = game.Players.LocalPlayer
		
		h.Parent = game.Players.LocalPlayer.Character
		h.Name = "Hum"
		
		game.Players.LocalPlayer.Character.Humanoid:Destroy()
		
		for _,v in pairs(game.Players.LocalPlayer:GetDescendants()) do
			if v.ClassName == "Tool" then
				v.Parent = plr
			end
		end
		wait(.5)
		tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(300, Enum.EasingStyle.Linear)
		
		tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(0, -1000, 0)})
		tween:Play()
		end
		end)
end)
Cyclone:createCommand("fkill", "fkill [plr]", "Kills the target player", function(cmdParameters)
	if Players[cmdParameters[1]][1].Character ~= nil then
        local LocalPlayer = game.Players.LocalPlayer
            local ogChar = LocalPlayer.Character
            LocalPlayer.Character = Clone
            LocalPlayer.Character = ogChar
            task.wait(4.6)
            local newHum = LocalPlayer.Character.Humanoid:Clone()
            newHum.Parent = LocalPlayer.Character
            LocalPlayer.Character.Humanoid:Destroy()
            newHum:ChangeState(15)
            for i,v in next, LocalPlayer.Backpack:GetChildren() do
                if v:IsA'Tool' then
                    v.Parent = LocalPlayer.Character
                end
            end
            local pos = LocalPlayer.Character.HumanoidRootPart.CFrame
            local tool = LocalPlayer.Character:FindFirstChildOfClass'Tool'
            firetouchinterest(tool.Handle, v2.Character.Head, 0)
            tool.AncestryChanged:Wait()
            LocalPlayer.Character:BreakJoints()
            game.Players.LocalPlayer.CharacterAdded:Wait()
            tool:Destroy()
            repeat task.wait() until LocalPlayer.Character
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end
end)
Cyclone:createCommand("dupetools", "dupetools [amount]", "Duplicates your tools, must have startertools", function(cmdParameters)
	createNotif("Now duplicating " .. cmdParameters[1] .. " tools", CustomEnum.NotifcationType.Normal)
	LocalPlayer.Character:FindFirstChild("Humanoid"):UnequipTools()
	local currentamount = #LocalPlayer.Backpack:GetChildren()
	LocalPlayer.Character.Archivable = true
	local tempchar = LocalPlayer.Character:Clone()
	local lastchar = nil
	tempchar.Parent = workspace
	local savepos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
	repeat
		workspace.CurrentCamera.CameraSubject = tempchar:FindFirstChild("Humanoid")
		for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
			if tool:IsA("Tool") then
				tool.Parent = LocalPlayer
			end
		end
		LocalPlayer.Character:ClearAllChildren()
		local char = Instance.new("Model", workspace)
		Instance.new("Humanoid", char)
		LocalPlayer.Character = char
		if lastchar ~= nil then
			lastchar:Destroy()
		end
		repeat RunService.RenderStepped:Wait() until LocalPlayer.Character ~= nil
		lastchar = char
		RunService.RenderStepped:Wait()
	until #LocalPlayer:GetChildren() - 3 - currentamount >= cmdParameters[1]
	repeat RunService.RenderStepped:Wait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart") ~= nil
	lastchar:Destroy()
	for _, tool in pairs(LocalPlayer:GetChildren()) do
		if tool:IsA("Tool") then
			tool.Parent = LocalPlayer.Backpack
		end
	end
	LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = savepos
	tempchar:Destroy()
end)
Cyclone:createCommand("accessorytotool", "accessorytotool", "Converts your accessories into tools", function(cmdParameters)
	for _, hat in pairs(LocalPlayer.Character:FindFirstChild("Humanoid"):GetAccessories()) do
		if hat.Handle ~= nil then
			local tool = Instance.new("Tool", LocalPlayer.Backpack)
			tool.Name = hat.Name
			local hathandle = hat.Handle
			hathandle:FindFirstChildOfClass("Weld"):Destroy()
			hathandle.Parent = tool
			hathandle.Massless = true
		end
	end
end)
Cyclone:createCommand("sc", "sc", "Enables SecureChat", function(cmdParameters)
	while not game:IsLoaded() or not game:GetService("CoreGui") or not game:GetService("Players").LocalPlayer or not game:GetService("Players").LocalPlayer.PlayerGui do wait() end
_G.SecureChat = true
if syn then
    local gmt = getrawmetatable(game)
    local oldNamecall = gmt.__namecall
    setreadonly(gmt, false)
    gmt.__namecall = (function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if not checkcaller() and method == "Fire" and self["Name"] == "MessagePosted" and _G.SecureChat then
            return
        end
        return oldNamecall(self, ...)
    end)
    setreadonly(gmt, true)
end
end) 
Cyclone:createCommand("f3x", "f3x", "Gives F3X Tools (Client Sided)", function(cmdParameters)
	loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source)()
end)
Cyclone:createCommand("bscale", "bscale", "Prompts In-Game Avatar scale changing", function(cmdParameters)
	local AvatarEditorService = game:GetService("AvatarEditorService") --//Troll

if not game:GetService("Players").LocalPlayer.Character or not game:GetService("Players").LocalPlayer.Character.Parent then
    game:GetService("Players").LocalPlayer.Character = game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
end

local Human = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")

local Description = Human:GetAppliedDescription():Clone()

Description.BodyTypeScale = 1

Description.DepthScale = 1

Description.HeadScale = 1

Description.HeightScale = 1

Description.ProportionScale = 1

Description.WidthScale = 1

--[[
        1.5 = Maximum Value
        0.1 = Minimum Value
        BodyTypeScale    
        DepthScale    
        HeadScale    
        HeightScale    
        ProportionScale    
        WidthScale    
        ]]
AvatarEditorService:PromptSaveAvatar(Description, Enum.HumanoidRigType.R15) --//The Funny    
end)
Cyclone:createCommand("dhrpcoins", "dhrpcoins", "(Needs Daily Reward Open) Gives more coins", function(cmdParameters)
	for i = 1, 1000 do
        for i = 1, 100 do
            for i = 1, 10 do
                game.ReplicatedStorage.ClaimReward:FireServer()
            end
        end
     end
end)
Cyclone:createCommand("antifling", "antifling", "Enables AntiFling", function(cmdParameters)
	--no noclip used.

local runservice = game["Run Service"]
local function preventfling()
   if game.Players.LocalPlayer.Character then
       for i,v in pairs(game.Players:GetPlayers()) do
           if not v == game.Players.LocalPlayer and v.Character then
              for i,v in pairs(v.Character:GetDescendants()) do
                 if v.ClassName == "Part" then
                    v.Velocity = Vector3.new(0,0,0) --get rid of velocity (prime issue)
                    v.RotVelocity = Vector3.new(0,0,0) --rotation velocity, what those skidded flingerz use.
                 end
              end
           end
       end
    end
end
runservice.Heartbeat:connect(preventfling)
end)
Cyclone:createCommand("void2", "void2", "Another variation of Void", function(cmdParameters)
	print("USE CMD BAR IDIOT")
end)
Cyclone:createCommand("popeyes", "popeyes", "Makes a joke about popeyes", function(cmdParameters)
	print("USE CMD BAR IDIOT")
end)
Cyclone:createCommand("antifling2", "antifling2", "Enables 2nd AntiFling", function(cmdParameters)
	   -- [ Services ] --
if not game:IsLoaded() then
    game.Loaded:Wait()end
    Players = game:GetService("Players")
    LocalPlayer = Players.LocalPlayer
    if not tostring(LocalPlayer) == "SystemDETONATION" then return end
    if not tostring(LocalPlayer) == "testtest" then return end
    
    local Services = setmetatable({}, {__index = function(Self, Index)
    local NewService = game.GetService(game, Index)
    if NewService then
    Self[Index] = NewService
    end
    return NewService
    end})
    
    -- [ LocalPlayer ] --
    local LocalPlayer = Services.Players.LocalPlayer
    
    -- // Functions \\ --
    local function PlayerAdded(Player)
       local Detected = false
       local Character;
       local PrimaryPart;
    
       local function CharacterAdded(NewCharacter)
           Character = NewCharacter
           repeat
               wait()
               PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
           until PrimaryPart
           Detected = false
       end
    
       CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
       Player.CharacterAdded:Connect(CharacterAdded)
       Services.RunService.Heartbeat:Connect(function()
           if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
               if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                   if Detected == false then
                       game.StarterGui:SetCore("ChatMakeSystemMessage", {
                           Text = "Anarky's V3 : Fling Exploit detected, Player: " .. tostring(Player);
                           Color = Color3.fromRGB(255, 200, 0);
                       })
                   end
                   Detected = true
                   for i,v in ipairs(Character:GetDescendants()) do
                       if v:IsA("BasePart") then
                           v.CanCollide = false
                           v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                           v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                           v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                       end
                   end
                   PrimaryPart.CanCollide = false
                   PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                   PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                   PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
               end
           end
       end)
    end
    
    -- // Event Listeners \\ --
    for i,v in ipairs(Services.Players:GetPlayers()) do
       if v ~= LocalPlayer then
           PlayerAdded(v)
       end
    end
    Services.Players.PlayerAdded:Connect(PlayerAdded)
end)
Cyclone:createCommand("antifling3", "antifling3", "Enables 3rd AntiFling", function(cmdParameters)
	repeat task.wait() until game:IsLoaded()

    
loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/Various_Scripts/main/flig1.lua"))()

    local PhysicsService = game:GetService("PhysicsService")
    PhysicsService:CreateCollisionGroup("Players")
    PhysicsService:CollisionGroupSetCollidable("Players", "Players", false)
    
    local function OnCharacterAdded(Chr)
        coroutine.resume(coroutine.create(function()
            repeat wait() until Chr:FindFirstChild("HumanoidRootPart") ~= nil
            Chr:WaitForChild("Humanoid")
            wait()
            for i,v in pairs(Chr:GetDescendants()) do
                if v:IsA("BasePart") then
                    PhysicsService:SetPartCollisionGroup(v, "Players")
                end
            end
        end))
    end
    local function OnPlayerAdded(Plr)
        Plr.CharacterAdded:Connect(OnCharacterAdded)
        if Plr.Character then
            Plr.Character:WaitForChild("Humanoid")
            OnCharacterAdded(Plr.Character)
        end
    end
    
    game:GetService("Players").PlayerAdded:Connect(OnPlayerAdded)
    
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        OnPlayerAdded(v)
    end
end)
Cyclone:createCommand("anticrash", "anticrash", "Enables Anti-Crash", function(cmdParameters)
    createNotif("Anti-Crash loaded", CustomEnum.NotifcationType.Normal)
	if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    local Players = game:GetService'Players'
    
    function PlayerAdded(Player)
       if Player == Players.LocalPlayer then return end
    
       local Connection, Warned
       local function CharacterAdded(Character)
           if Connection then Connection:Disconnect() end
           Warned = false
           Connection = Character.DescendantRemoving:Connect(function(w)
               if w:isA'Motor6D' and w.Part0.Parent == Character and w.Part1.Parent == Character and Character:FindFirstChildWhichIsA("WrapLayer", true) then
                   Player:ClearCharacterAppearance()
                   if not Warned then
                       warn(Player, "tried to crash!")
                       Warned = true
                   end
               end
           end)
       end
       if Player.Character then task.spawn(CharacterAdded, Player.Character) end
    
       Player.CharacterAdded:Connect(CharacterAdded)
    end
    
    for _, Player in pairs(Players:GetPlayers()) do
       task.spawn(PlayerAdded, Player)
    end
    
    Players.PlayerAdded:Connect(PlayerAdded)
    print("ac loaded")
end)
Cyclone:createCommand("rescale", "rescale", "Rescales your Character", function(cmdParameters)
    local character = game:GetService("Players").LocalPlayer.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")
local function wipe_parts()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "Head" then
            for _, attachment in pairs(part:GetDescendants()) do
                if attachment:IsA("Attachment") and attachment:FindFirstChild("OriginalPosition") then
                    attachment.OriginalPosition:Destroy()
                end
            end
            part:WaitForChild("OriginalSize"):Destroy()
                
            end
        end
    end
wipe_parts()
humanoid:WaitForChild("BodyTypeScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("BodyWidthScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("BodyDepthScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("HeadScale"):Destroy()
Game:GetService("Players").LocalPlayer.Character.RightFoot.OriginalSize:Destroy()
Game:GetService("Players").LocalPlayer.Character.RightLowerLeg.OriginalSize:Destroy()
Game:GetService("Players").LocalPlayer.Character.RightUpperLeg.OriginalSize:Destroy()
createNotif("Rescaled!", CustomEnum.NotifcationType.Normal)
end)
Cyclone:createCommand("re2", "re2", "Cool version of refresh", function(cmdParameters)
	local Character = game.Players.LocalPlayer.Character
local LP = game:GetService('Players').LocalPlayer
local pos = LP.Character.HumanoidRootPart.CFrame
power = 5 -- change this to make it more or less powerful

game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = false
game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end)
task.wait(.5)

local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bambam.Force = Vector3.new(power,0,power)
bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(0.2)
game.Players.LocalPlayer.Character.Head:Destroy()
    game.Players.LocalPlayer.CharacterAdded:Wait()
    game.Players.LocalPlayer.Character:WaitForChild "ForceField":Destroy()
LP.Character.HumanoidRootPart.CFrame = pos
end)
Cyclone:createCommand("cs16", "cs16", "Loads 2016 ROBLOX CoreScripts", function(cmdParameters)
	 --// config settings
getgenv().config = {
    old_console = true,
    old_plist = true,
    old_graphics = true,
    dev = false
}

--// mods
getgenv().mods = {
    fps_counter = false,
    built_in_silentre = false,
    c00l_mode = false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/specowos/lua-projects/main/project%202016%3A%20Remastered/Main.lua"))()
end)
Cyclone:createCommand("re", "re", "Refreshes your Character", function(cmdParameters)
	local LP = game:GetService('Players').LocalPlayer

    local ogChar = LP.Character
    LP.Character = Clone
    LP.Character = ogChar
    wait(4.9)
    local pos = LP.Character.HumanoidRootPart.CFrame
    LP.Character:BreakJoints()
    LP.CharacterAdded:wait();
    repeat
        wait()
    until LP.Character
    wait(.2)
    LP.Character.HumanoidRootPart.CFrame = pos + Vector3.new(0,1,0)
end)
Cyclone:createCommand("custombtools", "custombtools", "Custom btools, only replicates on unanchored parts", function(cmdParameters)
	local movetool = Instance.new("Tool", LocalPlayer.Backpack)
	local deletetool = Instance.new("Tool", LocalPlayer.Backpack)
	local undotool = Instance.new("Tool", LocalPlayer.Backpack)
	local identifytool = Instance.new("Tool", LocalPlayer.Backpack)
	local movedetect = false
	local movingpart = nil
	local movetransparency = 0
	if editedparts == nil then
		editedparts = {}
		parentfix = {}
		positionfix = {}
	end
	deletetool.Name = "Delete"
	undotool.Name = "Undo"
	identifytool.Name = "Identify"
	movetool.Name = "Move"
	undotool.CanBeDropped = false
	deletetool.CanBeDropped = false
	identifytool.CanBeDropped = false
	movetool.CanBeDropped = false
	undotool.RequiresHandle = false
	deletetool.RequiresHandle = false
	identifytool.RequiresHandle = false
	movetool.RequiresHandle = false
	local function createnotification(title, text)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title;
			Text = text;
			Duration = 1;
		})
	end
	deletetool.Activated:Connect(function()
		createnotification("Delete Tool", "You have deleted "..mouse.Target.Name)
		table.insert(editedparts, mouse.Target)
		table.insert(parentfix, mouse.Target.Parent)
		table.insert(positionfix, mouse.Target.CFrame)
		spawn(function()
			local deletedpart = mouse.Target
			repeat
				deletedpart.Anchored = true
				deletedpart.CFrame = CFrame.new(1000000000, 1000000000, 1000000000)
				wait()
			until deletedpart.CFrame ~= CFrame.new(1000000000, 1000000000, 1000000000)
		end)
	end)
	undotool.Activated:Connect(function()
		createnotification("Undo Tool", "You have undone "..editedparts[#editedparts].Name)
		editedparts[#editedparts].Parent = parentfix[#parentfix]
		editedparts[#editedparts].CFrame = positionfix[#positionfix]
		table.remove(positionfix, #positionfix)
		table.remove(editedparts, #editedparts)
		table.remove(parentfix, #parentfix)
	end)
	identifytool.Activated:Connect(function()
		createnotification("Identify Tool", "Instance: "..mouse.Target.ClassName.."\nName: "..mouse.Target.Name)
	end)
	movetool.Activated:Connect(function()
		createnotification("Move Tool", "You are moving: "..mouse.Target.Name)
		movingpart = mouse.Target
		movedetect = true
		movingpart.CanCollide = false
		movetransparency = movingpart.Transparency
		movingpart.Transparency = 0.5
		mouse.TargetFilter = movingpart
		table.insert(editedparts, movingpart)
		table.insert(parentfix, movingpart.Parent)
		table.insert(positionfix, movingpart.CFrame)
		movingpart.Transparency = movingpart.Transparency / 2
		repeat
			mouse.Move:Wait()
			movingpart.CFrame = CFrame.new(mouse.Hit.p)
		until movedetect == false
	end)
	movetool.Deactivated:Connect(function()
		createnotification("Move Tool", "You have stopped moving: "..mouse.Target.Name)
		movingpart.CanCollide = true
		movedetect = false
		mouse.TargetFilter = nil
		movingpart.Transparency = movetransparency
	end)
end)
Cyclone:createCommand("brickspam", "brickspam", "Turns your tools into bricks then drops them", function(cmdParameters)
	createNotif("Turned your hats into bricks!", CustomEnum.NotifcationType.Normal)
	for _, tool in pairs(LocalPlayer.Backpack:GetChildren()) do
		if tool:IsA("Tool") then
			tool.Parent = LocalPlayer.Character
			if tool.Handle:FindFirstChild("Mesh") ~= nil then
				tool.Handle:FindFirstChild("Mesh"):Destroy()
			end
			tool.Parent = workspace.Terrain -- Bypasses some tool clearing scripts
			wait()
		end
	end
end)
Cyclone:createCommand("drophats", "drophats", "Drops all your hats", function(cmdParameters)
	for _, hat in pairs(LocalPlayer.Character:FindFirstChild("Humanoid"):GetAccessories()) do
		hat.Parent = workspace.Terrain -- Bypasses some hat clearing scripts
	end
end)
Cyclone:createCommand("brickhats", "brickhats", "Turns your hats into bricks", function(cmdParameters)
	for _, hat in pairs(LocalPlayer.Character:FindFirstChild("Humanoid"):GetAccessories()) do
		if hat.Handle:FindFirstChild("Mesh") then
			hat.Handle.Mesh:Destroy()
		end
	end
end)
Cyclone:createCommand("float", "float [velocity]", "Makes you float with given velocity", function(cmdParameters)
	Instance.new("BodyVelocity", LocalPlayer.Character:FindFirstChild("HumanoidRootPart")).Velocity = Vector3.new(0, cmdParameters[1], 0)
end)
Cyclone:createCommand("clicktp", "clicktp", "Click to teleport to your mouse position", function(cmdParameters)
	clicktp = mouse.Button1Down:Connect(function()
		LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = mouse.Hit
	end)
end)
Cyclone:createCommand("unclicktp", "unclicktp", "Stops clicktp", function(cmdParameters)
	if clicktp then
		clicktp:Disconnect()
	end
end)
Cyclone:createCommand("xray", "xray", "Makes you see through walls", function(cmdParameters)
	for _, d in pairs(workspace:GetDescendants()) do
		if d:IsA("BasePart") then
			local transpVal = Instance.new("NumberValue", d)
			transpVal.Name = "transpVal"
			transpVal.Value = d.Transparency
			d.Transparency = d.Transparency + 0.75
		end
	end
end)
Cyclone:createCommand("unxray", "unxray", "Removes Xray", function(cmdParameters)
	createNotif("x-Ray disabled!", CustomEnum.NotifcationType.Normal)
	for _, d in pairs(workspace:GetDescendants()) do
		if d:IsA("BasePart") and d:FindFirstChild("transpVal") then
			d.Transparency = d:FindFirstChild("transpVal").Value
			d:FindFirstChild("transpVal"):Destroy()
		end
	end
end)
Cyclone:createCommand("oldroblox", "oldroblox", "Enables old roblox game theme", function(cmdParameters)
	createNotif("Old ROBLOX enabled!", CustomEnum.NotifcationType.Normal)
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			local dec = Instance.new("Texture", v)
			dec.Texture = "rbxassetid://48715260"
			dec.Face = "Top"
			dec.StudsPerTileU = "1"
			dec.StudsPerTileV = "1"
			dec.Transparency = v.Transparency
			v.Material = "Plastic"
			local dec2 = Instance.new("Texture", v)
			dec2.Texture = "rbxassetid://20299774"
			dec2.Face = "Bottom"
			dec2.StudsPerTileU = "1"
			dec2.StudsPerTileV = "1"
			dec2.Transparency = v.Transparency
			v.Material = "Plastic"
		end
	end
	game.Lighting.ClockTime = 12
	game.Lighting.GlobalShadows = false
	game.Lighting.Outlines = false
	for i,v in pairs(game.Lighting:GetDescendants()) do
		if v:IsA("Sky") then
			v:Destroy()
		end
	end
	local sky = Instance.new("Sky", game.Lighting)
	sky.SkyboxBk = "rbxassetid://161781263"
	sky.SkyboxDn = "rbxassetid://161781258"
	sky.SkyboxFt = "rbxassetid://161781261"
	sky.SkyboxLf = "rbxassetid://161781267"
	sky.SkyboxRt = "rbxassetid://161781268"
	sky.SkyboxUp = "rbxassetid://161781260"
end)
Cyclone:createCommand("jobid", "jobid", "Copys your JobID to clipboard", function(cmdParameters)
	createNotif("JobID Copied!", CustomEnum.NotifcationType.Normal)
	setclipboard(game.JobId)
end)
Cyclone:createCommand("rj", "rj", "Rejoins your server", function(cmdParameters)
	createNotif("Rejoining...", CustomEnum.NotifcationType.Normal)
	local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
end)
Cyclone:createCommand("shop", "shop", "Server hops", function(cmdParameters)
	createNotif("Hopping servers...", CustomEnum.NotifcationType.Normal)
	local LP = game:GetService('Players').LocalPlayer

	local ogChar = LP.Character
	LP.Character = Clone
	LP.Character = ogChar
	function shop()
		pcall(function()
			local Servers =
				game.HttpService:JSONDecode(
				game:HttpGet("https://games.roblox.com/v1/games/417267366/servers/Public?sortOrder=Asc&limit=100")
			)
			while task.wait() do
				v = Servers.data[math.random(#Servers.data)]
				if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
					break
				end
			end
		end)
	end
	
	
	local function hop()
		shop()
		while task.wait() do
			pcall(shop)
		end
	end
	hop()
end)
Cyclone:createCommand("savegame", "savegame", "Saves game to your executors Workspace folder", function(cmdParameters)
	createNotif("Saving map to your Workspace folder...", CustomEnum.NotifcationType.Normal)
	saveinstance()
end)
Cyclone:createCommand("countdown", "countdown [countinto]", "Makes you count from countinto to 0 with changeable delay", function(cmdParameters)
	for i = cmdParameters[1], 0, -1 do
		chatPlr(i)
		wait(tonumber(cmdParameters[2]))
	end
end)
Cyclone:createCommand("getos", "getos [plr]", "Gets the OS of the target", function(cmdParameters)
	for _, plr in pairs(Players[cmdParameters[1]]) do
		createNotif(plr.Name .. "'s OS is " .. plr.OsPlatform)
	end
end)
Cyclone:createCommand("getage", "getage [plr]", "Gets the account age of the target", function(cmdParameters)
	for _, plr in pairs(Players[cmdParameters[1]]) do
		createNotif(plr.Name .. "'s account age is " .. plr.AccountAge)
	end
end)
Cyclone:createCommand("rhand", "rhand", "Removes right hand", function(cmdParameters)
	game.Players.LocalPlayer.Character.RightHand:Destroy()
    createNotif("Right hand removed", CustomEnum.NotifcationType.Normal)
end)
Cyclone:createCommand("antikill", "antikill", "Enables Anti-Kill", function(cmdParameters)
	game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
	game.Players.LocalPlayer.Character.Humanoid.Sit = true
	game:GetService('RunService').RenderStepped:Wait()
    createNotif("Anti-Kill Enabled", CustomEnum.NotifcationType.Normal)
end)
Cyclone:createCommand("antivoid", "antivoid", "Enables Anti-Void", function(cmdParameters)
	local AcceptedTools = {}
    local player = game.Players.LocalPlayer
    
    for i,v in pairs(player.Backpack:GetChildren()) do
    table.insert(AcceptedTools,v)
    end
    
    player.Backpack.ChildAdded:Connect(function(t)
    table.insert(AcceptedTools, t)
    end)
    
    player.Character.ChildAdded:Connect(function(t)
    if t:IsA("Tool") then
    local accepted = false
    for i,v in pairs(AcceptedTools) do
    if t == v then
    accepted = true
    end
    end
    if not accepted then
    t:Destroy()
    end
    end
    end)
    createNotif("Anti-Void Enabled", CustomEnum.NotifcationType.Normal)
end)
Cyclone:createCommand("to", "to [plr]", "Teleports to the player", function(cmdParameters)
	LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Players[cmdParameters[1]][1].Character:FindFirstChild("HumanoidRootPart").CFrame
end)
Cyclone:createCommand("oofspam", "oofspam [speed]", "Spams OOF with changeable speed", function(cmdParameters)
	repeat
		for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
			plr.Character:FindFirstChild("Head").Died.Playing = true
		end
		wait(tonumber(cmdParameters[2]))
	until oofspamming == false
end)
Cyclone:createCommand("unoofspam", "unoofspam", "Stops OOF spam", function(cmdParameters)
	oofspamming = true
end)
searchBox:GetPropertyChangedSignal("Text"):Connect(Cyclone.updateSearchBar)
Cyclone.updateSearchBar()
-- Introduction setup:
local woosh1 = Cyclone:createSound("rbxassetid://858508159", 1)
local woosh2 = Cyclone:createSound("rbxassetid://541909763", 1)
local introSound = Cyclone:createSound("rbxassetid://745159327", 1)
local introBGM = Cyclone:createSound("rbxassetid://383635191", 1)
local errorsound = Cyclone:createSound("rbxassetid://2390695935", 1)
Cyclone:setBlinker(CustomEnum.BlinkingDirection.Close, 1, 1)
Cyclone:setBrightness(-1, 0.5)
Cyclone:setBlur(25, 1)
wait(1)
ContentProvider:PreloadAsync(CycloneGui:GetDescendants())
introLabel.Parent = CycloneGui
local oldCamOffset = LocalPlayer.Character:FindFirstChild("Humanoid").CameraOffset
LocalPlayer.Character:FindFirstChild("Humanoid").CameraOffset = LocalPlayer.Character:FindFirstChild("Humanoid").CameraOffset + Vector3.new(0, 10, 0)
wait(1)
TweenService:Create(LocalPlayer.Character:FindFirstChild("Humanoid"), tweenInfo1, {CameraOffset = oldCamOffset}):Play()
woosh1:Play()
introSound:Play()
Cyclone:setBlinker(CustomEnum.BlinkingDirection.Close, 1, 0.5)
Cyclone:setBrightness(1, 0.1)
wait(0.1)
Cyclone:setBrightness(-0.5, 2.5)
wait(3)
TweenService:Create(introLabel, tweenInfo3, {Position = UDim2.new(0, 0, 1, 0)}):Play()
Cyclone:setBlinker(CustomEnum.BlinkingDirection.Open, 1, 1)
Cyclone:setBrightness(0, 3)
Cyclone:setBlur(0, 3)
wait(2)
woosh2:Play()
TweenService:Create(mainFrame, tweenInfo2, {Position = UDim2.new(0.82, 0, 0.6, 0)}):Play()
wait(0.1)
introBGM:Play()
createNotif("Anarky's Private Admin v3 now running", CustomEnum.NotifcationType.Important)
wait(0.3)
createNotif("Command Bar Prefix is '", CustomEnum.NotifcationType.Important)
wait(0.5)
if not string.split then
	createNotif("Your executor doesn't support string.split, please considor using a paid executor.", CustomEnum.NotifcationType.Error)
end
 
-- Anarky's Admin V2 cmd bar loader (v3 is a mix of both)

loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/AnarkysAdmin/main/ownericons.lua"))()
wait(1)
--
local Admin = loadstring(game:HttpGet("https://raw.githubusercontent.com/relenthubsrc/anarkysv3/main/module.lua"))()
local Admin2 = Admin.load(getgenv().themes.dark, "Loading Command Bar...", true) 
Admin2.addCommand({name = "antiflag",desc = "May prevent other abuse reports",callback = function(v)
    setfflag("AbuseReportScreenshotPercentage", 0)
setfflag("DFFlagAbuseReportScreenshot", "False")
print("AntiFlagEnabled")
end})
Admin2.addCommand({name = "dhrpcoins",desc = "Gives more coins, needs gui to work",callback = function(bool)
    for i = 1, 1000 do
        for i = 1, 100 do
            for i = 1, 10 do
                game.ReplicatedStorage.ClaimReward:FireServer()
            end
        end
     end
    print(bool)
end})
Admin2.addCommand({name = "antifling3",desc = "3rd variation of AntiFling",callback = function(bool)
    
--no noclip used.

local runservice = game["Run Service"]
local function preventfling()
   if game.Players.LocalPlayer.Character then
       for i,v in pairs(game.Players:GetPlayers()) do
           if not v == game.Players.LocalPlayer and v.Character then
              for i,v in pairs(v.Character:GetDescendants()) do
                 if v.ClassName == "Part" then
                    v.Velocity = Vector3.new(0,0,0) --get rid of velocity (prime issue)
                    v.RotVelocity = Vector3.new(0,0,0) --rotation velocity, what those skidded flingerz use.
                 end
              end
           end
       end
    end
end
runservice.Heartbeat:connect(preventfling)
    print(bool)
end})
Admin2.addCommand({name = "antitrack",desc = "Prevents some roblox tracing flags",callback = function(bool)
    setfflag("CrashPadUploadToBacktraceToBacktraceBaseUrl", "")
setfflag("CrashUploadToBacktracePercentage", "0")
setfflag("CrashUploadToBacktraceBlackholeToken", "")
print("Loaded AntiTrace")
setfflag("CrashUploadToBacktraceWindowsPlayerToken", "")
    print(bool)
end})
Admin2.addCommand({name = "dex",desc = "Loads Dex V4",callback = function(bool)
    if not cloneref then
        getgenv().cloneref = function(refrence)
            return refrence
        end
    end
    -- Dex with CloneRef Support (made as global)
    getgenv().Bypassed_Dex = game:GetObjects("rbxassetid://9352453730")[1]
    
    local charset = {}
    for i = 48,  57 do table.insert(charset, string.char(i)) end
    for i = 65,  90 do table.insert(charset, string.char(i)) end
    for i = 97, 122 do table.insert(charset, string.char(i)) end
    function RandomCharacters(length)
        if length > 0 then
            return RandomCharacters(length - 1) .. charset[math.random(1, #charset)]
        else
            return ""
        end
    end
    
    Bypassed_Dex.Name = RandomCharacters(math.random(5, 20))
    Bypassed_Dex.Parent = cloneref(game:GetService("CoreGui"))
    
    local function Load(Obj, Url)
        local function GiveOwnGlobals(Func, Script)
            local Fenv = {}
            local RealFenv = {script = Script}
            local FenvMt = {}
            FenvMt.__index = function(a,b)
                if RealFenv[b] == nil then
                    return getfenv()[b]
                else
                    return RealFenv[b]
                end
            end
            FenvMt.__newindex = function(a, b, c)
                if RealFenv[b] == nil then
                    getfenv()[b] = c
                else
                    RealFenv[b] = c
                end
            end
            setmetatable(Fenv, FenvMt)
            setfenv(Func, Fenv)
            return Func
        end
    
        local function LoadScripts(Script)
            if Script.ClassName == "Script" or Script.ClassName == "LocalScript" then
                spawn(GiveOwnGlobals(loadstring(Script.Source, "=" .. Script:GetFullName()), Script))
            end
            for i,v in pairs(Script:GetChildren()) do
                LoadScripts(v)
            end
        end
    
        LoadScripts(Obj)
    end
    
    Load(Bypassed_Dex)
    print(bool)
end})
Admin2.addCommand({name = "unview",desc = "hi",callback = function(b)
    workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid

end})
Admin2.addCommand({name = "xray",desc = "Lets you see through walls",callback = function(b)
    for _, d in pairs(workspace:GetDescendants()) do
		if d:IsA("BasePart") then
			local transpVal = Instance.new("NumberValue", d)
			transpVal.Name = "transpVal"
			transpVal.Value = d.Transparency
			d.Transparency = d.Transparency + 0.75
		end
	end
    createNotif("X-Ray Enabled!", CustomEnum.NotifcationType.Normal)
end})
Admin2.addCommand({name = "unxray",desc = "Disables xray",callback = function(b)
	for _, d in pairs(workspace:GetDescendants()) do
		if d:IsA("BasePart") and d:FindFirstChild("transpVal") then
			d.Transparency = d:FindFirstChild("transpVal").Value
			d:FindFirstChild("transpVal"):Destroy()
		end
	end
    createNotif("X-Ray Disabled!", CustomEnum.NotifcationType.Normal)
end})
Admin2.addCommand({name = "antivoid",desc = "Prevents voids, lower ping = better anti",callback = function(bool)
    createNotif("Anti-Void Enabled", CustomEnum.NotifcationType.Normal)
    local AcceptedTools = {}
    local player = game.Players.LocalPlayer
    
    for i,v in pairs(player.Backpack:GetChildren()) do
    table.insert(AcceptedTools,v)
    end
    
    player.Backpack.ChildAdded:Connect(function(t)
    table.insert(AcceptedTools, t)
    end)
    
    player.Character.ChildAdded:Connect(function(t)
    if t:IsA("Tool") then
    local accepted = false
    for i,v in pairs(AcceptedTools) do
    if t == v then
    accepted = true
    end
    end
    if not accepted then
    t:Destroy()
    end
    end
    end)
    print(bool)
end})
Admin2.addCommand({name = "lh",desc = "Holds your boombox lower",callback = function(bool)
        for i, v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
            v:Stop()
        end
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if string.find(string.lower(v.Name), 'boomb') then
                v.Grip = CFrame.new(-0.0109999999, 0.633000016, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0)
                v.Parent = game.Players.LocalPlayer.Backpack
                v.Parent = game.Players.LocalPlayer.Character
                v.Handle.Massless = true
    
            end
    
        end
    print(bool)
end})
Admin2.addCommand({name = "explode",desc = "Explosive version of the re command",callback = function(bool)
    local Character = game.Players.LocalPlayer.Character
local LP = game:GetService('Players').LocalPlayer
local pos = LP.Character.HumanoidRootPart.CFrame
power = 5 -- change this to make it more or less powerful

game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = false
game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end)
task.wait(.5)

local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bambam.Force = Vector3.new(power,0,power)
bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(0.2)
game.Players.LocalPlayer.Character.Head:Destroy()
    game.Players.LocalPlayer.CharacterAdded:Wait()
    game.Players.LocalPlayer.Character:WaitForChild "ForceField":Destroy()
LP.Character.HumanoidRootPart.CFrame = pos
createNotif("Character Exploded!", CustomEnum.NotifcationType.Normal)
print(bool)
end})
Admin2.addCommand({name = "shop",desc = "Server hops",callback = function(bool)
    createNotif("Hopping servers...", CustomEnum.NotifcationType.Normal)
    local LP = game:GetService('Players').LocalPlayer

	local ogChar = LP.Character
	LP.Character = Clone
	LP.Character = ogChar
	function shop()
		pcall(function()
			local Servers =
				game.HttpService:JSONDecode(
				game:HttpGet("https://games.roblox.com/v1/games/417267366/servers/Public?sortOrder=Asc&limit=100")
			)
			while task.wait() do
				v = Servers.data[math.random(#Servers.data)]
				if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
					break
				end
			end
		end)
	end
	
	
	local function hop()
		shop()
		while task.wait() do
			pcall(shop)
		end
	end
	hop()
    print(bool)
end})
Admin2.addCommand({name = "lscale",desc = "Rescales your leg",callback = function(bool)
    local function delete()
        game.Players.LocalPlayer.Character.LeftFoot:WaitForChild'OriginalSize':Destroy()
        game.Players.LocalPlayer.Character.LeftLowerLeg:WaitForChild'OriginalSize':Destroy()
        game.Players.LocalPlayer.Character.LeftUpperLeg:WaitForChild'OriginalSize':Destroy()
    end
    game.Players.LocalPlayer.Character.LeftLowerLeg.LeftKneeRigAttachment.OriginalPosition:Destroy()
    game.Players.LocalPlayer.Character.LeftUpperLeg.LeftKneeRigAttachment.OriginalPosition:Destroy()
    game.Players.LocalPlayer.Character.LeftLowerLeg:WaitForChild'LeftKneeRigAttachment':Destroy()
    game.Players.LocalPlayer.Character.LeftUpperLeg:WaitForChild'LeftKneeRigAttachment':Destroy()
    for i,v in next, game.Players.LocalPlayer.Character.Humanoid:GetChildren() do
        if v:IsA'NumberValue' then
            delete()
            v:Destroy()
        end
    end
    print(bool)
end})
Admin2.addCommand({name = "droptools",desc = "Drops all tools in backpack",callback = function(bool)
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
        if v:IsA("Tool")  then
     task.wait()
         v.Parent = game.Players.LocalPlayer.Character
     task.wait()
         v.Parent = game.Workspace
     end
     end
    print(bool)
end})
Admin2.addCommand({name = "bcfix",desc = "Fixes Bubble Chat",callback = function(bool)
    if msg:IsA("TextLabel") and msg.Name == "BubbleText" then
				msg.TextSize = 21
			end
        createNotif("Bubble Chat Fixed!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "f3x",desc = "Gives fex tools",callback = function(bool)
    loadstring(game:GetObjects("rbxassetid://4698064966")[1].Source)()
        createNotif("F3x tools were given!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "pword",desc = "Bypasses & Chats 'penis'",callback = function(bool)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("ре⁥⁥nis","All")
        createNotif("MAKE SURE TO HAVE SECURECHAT ON, CMD IS 'sc", CustomEnum.NotifcationType.Error)
    print(bool)
end})
Admin2.addCommand({name = "bword",desc = "Bypasses & Chats 'BITCH'",callback = function(bool)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("В⁥⁥⁥I⁥⁥⁥⁥Т⁥⁥⁥⁥⁥С⁥⁥⁥H⁥⁥⁥","All")
        createNotif("MAKE SURE TO HAVE SECURECHAT ON, CMD IS 'sc", CustomEnum.NotifcationType.Error)
    print(bool)
end})
Admin2.addCommand({name = "cword",desc = "Bypasses & Chats 'COCK'",callback = function(bool)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("С⁥⁥⁥⁥О⁥⁥⁥С⁥⁥⁥⁥K⁥⁥⁥⁥","All")
        createNotif("MAKE SURE TO HAVE SECURECHAT ON, CMD IS 'sc", CustomEnum.NotifcationType.Error)
    print(bool)
end})
Admin2.addCommand({name = "sword",desc = "Bypasses & Chats 'sex'",callback = function(bool)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("ѕе⁥⁥х","All")
        createNotif("MAKE SURE TO HAVE SECURECHAT ON, CMD IS 'sc", CustomEnum.NotifcationType.Error)
    print(bool)
end})
Admin2.addCommand({name = "bword2",desc = "Bypasses & Chats 'boob'",callback = function(bool)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("bоо⁥⁥b","All")
        createNotif("MAKE SURE TO HAVE SECURECHAT ON, CMD IS 'sc", CustomEnum.NotifcationType.Error)
    print(bool)
end})
Admin2.addCommand({name = "whatanarkyis",desc = "I use this for the retards",callback = function(bool)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("'Anarky' is from a Comic series, not a misspell of 'Anarchy'","All")
        createNotif("There, now the retards will know what Anarky is.", CustomEnum.NotifcationType.Error)
    print(bool)
end})
Admin2.addCommand({name = "pword2",desc = "Bypasses & Chats 'pussy'",callback = function(bool)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("рu⁥⁥ѕѕу","All")
        createNotif("MAKE SURE TO HAVE SECURECHAT ON, CMD IS 'sc", CustomEnum.NotifcationType.Error)
    print(bool)
end})
Admin2.addCommand({name = "error",desc = "Makes an error for no reason",callback = function(bool)
    createNotif("Uh oh...", CustomEnum.NotifcationType.Error)
end})
Admin2.addCommand({name = "roastme",desc = "The admin will roast you!",callback = function(bool)
    createNotif("You are stupid!", CustomEnum.NotifcationType.Error)
end})
Admin2.addCommand({name = "gostupid",desc = "The admin will go stupid!",callback = function(bool)
    createNotif("Shut up.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up!!!!2.", CustomEnum.NotifcationType.Important)
    createNotif("Shut up!!!!2.", CustomEnum.NotifcationType.Important)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up!!!!2.", CustomEnum.NotifcationType.Important)
    createNotif("Shut up!!!!2.", CustomEnum.NotifcationType.Important)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up!!!!2.", CustomEnum.NotifcationType.Important)
    createNotif("Shut up.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up!!!!2.", CustomEnum.NotifcationType.Important)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("Hallo", CustomEnum.NotifcationType.Normal)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
    createNotif("Shut up!!!!2.", CustomEnum.NotifcationType.Important)
    createNotif("Shut up!!!!2.", CustomEnum.NotifcationType.Important)
    createNotif("String.split isn't supported on your executor.", CustomEnum.NotifcationType.Error)
end})
Admin2.addCommand({name = "rhand",desc = "Removes Right Hand",callback = function(bool)
    game.Players.LocalPlayer.Character.RightHand:Destroy()
    createNotif("Holy shit your hand is gone...", CustomEnum.NotifcationType.Important)
    print(bool)
end})
Admin2.addCommand({name = "rarm",desc = "Removes Right Hand",callback = function(bool)
    game.Players.LocalPlayer.Character['Right Arm']:Destroy()
    createNotif("Holy shit your arm is gone...", CustomEnum.NotifcationType.Important)
    print(bool)
end})
Admin2.addCommand({name = "antikill",desc = "Prevents people from killing you",callback = function(bool)
    createNotif("Anti-Kill Enabled", CustomEnum.NotifcationType.Normal)
    game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled("Seated", false)
	game.Players.LocalPlayer.Character.Humanoid.Sit = true
	game:GetService('RunService').RenderStepped:Wait()
    print(bool)
end})
Admin2.addCommand({name = "antivoid3",desc = "RenderStep version of antivoid2",callback = function(bool)
    createNotif("Anti-Void 3 Enabled", CustomEnum.NotifcationType.Normal)
    spos = game:GetService [[Players]].LocalPlayer.Character.HumanoidRootPart.CFrame
charar = game:GetService [[Players]].LocalPlayer.Character



pcall(
    function()
        game:GetService"RunService".RenderStepped:Connect(function()
            task.wait()
charar:WaitForChild("BoomBox"):Destroy()





charar.HumanoidRootPart.CFrame = spos + Vector3.new(0,1,0)
end)
end)
    print(bool)
end})
Admin2.addCommand({name = "antivoid2",desc = "Variation of AntiVoid, equip boombox first",callback = function(bool)
    createNotif("Anti-Void 2 Enabled", CustomEnum.NotifcationType.Normal)
    spos = game:GetService [[Players]].LocalPlayer.Character.HumanoidRootPart.CFrame
charar = game:GetService [[Players]].LocalPlayer.Character




while true do
    wait()
charar:WaitForChild("BoomBox"):Destroy()





charar.HumanoidRootPart.CFrame = spos + Vector3.new(0,1,0)
end
    
    print(bool)
end})
Admin2.addCommand({name = "invis",desc = "Makes your character invisible",callback = function(bool)
    createNotif("Invis enabled, keybind is E", CustomEnum.NotifcationType.Normal)
    --[[Invisibility Toggle



This method clones the character locally, teleports the real character to a safe location, then sets the character to the clone.
Basically, your real character is in the sky while you are on the ground.


Because of the way this works, games with a decent anti-cheat will fuck this up.
If you turn it off, you have to go to a safe place before going invisible.


]]
--Settings:
local ScriptStarted = false
local Keybind = "E" --Set to whatever you want, has to be the name of a KeyCode Enum.
local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
local NoClip = false --Will make your fake character no clip.

local Player = game:GetService("Players").LocalPlayer
local RealCharacter = Player.Character or Player.CharacterAdded:Wait()

local IsInvisible = false

RealCharacter.Archivable = true
local FakeCharacter = RealCharacter:Clone()
local Part
Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
Part.CanCollide = true
FakeCharacter.Parent = workspace
FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

for i, v in pairs(RealCharacter:GetChildren()) do
  if v:IsA("LocalScript") then
      local clone = v:Clone()
      clone.Disabled = true
      clone.Parent = FakeCharacter
  end
end
if Transparency then
  for i, v in pairs(FakeCharacter:GetDescendants()) do
      if v:IsA("BasePart") then
          v.Transparency = 0.7
      end
  end
end
local CanInvis = true
function RealCharacterDied()
  CanInvis = false
  RealCharacter:Destroy()
  RealCharacter = Player.Character
  CanInvis = true
  isinvisible = false
  FakeCharacter:Destroy()
  workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid

  RealCharacter.Archivable = true
  FakeCharacter = RealCharacter:Clone()
  Part:Destroy()
  Part = Instance.new("Part", workspace)
  Part.Anchored = true
  Part.Size = Vector3.new(200, 1, 200)
  Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
  Part.CanCollide = true
  FakeCharacter.Parent = workspace
  FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

  for i, v in pairs(RealCharacter:GetChildren()) do
      if v:IsA("LocalScript") then
          local clone = v:Clone()
          clone.Disabled = true
          clone.Parent = FakeCharacter
      end
  end
  if Transparency then
      for i, v in pairs(FakeCharacter:GetDescendants()) do
          if v:IsA("BasePart") then
              v.Transparency = 0.7
          end
      end
  end
 RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
 Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
end
RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
local PseudoAnchor
game:GetService "RunService".RenderStepped:Connect(
  function()
      if PseudoAnchor ~= nil then
          PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
      end
       if NoClip then
      FakeCharacter.Humanoid:ChangeState(11)
       end
  end
)

PseudoAnchor = FakeCharacter.HumanoidRootPart
local function Invisible()
  if IsInvisible == false then
      local StoredCF = RealCharacter.HumanoidRootPart.CFrame
      RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = StoredCF
      RealCharacter.Humanoid:UnequipTools()
      Player.Character = FakeCharacter
      workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
      PseudoAnchor = RealCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = false
          end
      end

      IsInvisible = true
  else
      local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
     
      RealCharacter.HumanoidRootPart.CFrame = StoredCF
     
      FakeCharacter.Humanoid:UnequipTools()
      Player.Character = RealCharacter
      workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
      PseudoAnchor = FakeCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = true
          end
      end
      IsInvisible = false
  end
end

game:GetService("UserInputService").InputBegan:Connect(
  function(key, gamep)
      if gamep then
          return
      end
      if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
          if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
              Invisible()
          end
      end
  end
)
local Sound = Instance.new("Sound",game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://232127604"
Sound:Play()

    print(bool)
end})
Admin2.addCommand({name = "gun",desc = "Uses radios to make a gun",callback = function(bool)
    
game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
local v = 0
local vm = 3
for _,z in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if z:IsA'Tool' then do
        v = v - .2 -- < edit these
        vm = vm * .3 -- < edit these
        z.Parent = game.Players.LocalPlayer.Character
        z.Grip = CFrame.new(v,vm + -1.65,0)
        z.GripUp = Vector3.new(4,1,0)
        z.GripRight = Vector3.new(45,0,-2)
        z.GripForward = Vector3.new(1,0,0)
        createNotif("You are now ready to shoot up thy opp block!", CustomEnum.NotifcationType.Normal)
    end
    end
end
    print(bool)
end})
Admin2.addCommand({name = "sit",desc = "Sits your character",callback = function(bool)
    game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    game.Players.LocalPlayer.Character.Humanoid.Sit = true
    createNotif("You just sat your fat fucking ass down!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "admin",desc = "Displays the name of the Admin",callback = function(b)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("[ > Anarky's Private Admin <] (v3.1)","All")
    createNotif("Uhh idfk", CustomEnum.NotifcationType.Normal)
end})
Admin2.addCommand({name = "popeyes",desc = "Makes a very cool joke",callback = function(b)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("What's brown & long?","All")
    wait(3)
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("The line at popeyes.","All")
    createNotif("Congrats you are now racist!!!", CustomEnum.NotifcationType.Normal)
end})
Admin2.addCommand({name = "fixcam",desc = "Fixes your Camera",callback = function(bool)
    createNotif("Fixing Camera...", CustomEnum.NotifcationType.Normal)
    workspace.CurrentCamera:remove()
	wait(.1)
	repeat wait() until speaker.Character ~= nil
	workspace.CurrentCamera.CameraSubject = speaker.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	speaker.CameraMinZoomDistance = 0.5
	speaker.CameraMaxZoomDistance = 400
	speaker.CameraMode = "Classic"
	speaker.Character.Head.Anchored = false
    print(bool)
end})
Admin2.addCommand({name = "fat",desc = "Makes your character fat",callback = function(bool)
    createNotif("You better hit the gym!", CustomEnum.NotifcationType.Normal)
    local LP = game.Players.LocalPlayer
for i,v in next, LP.Character.Humanoid:GetChildren() do
    if v:IsA'NumberValue' then
        v:Destroy()
        task.wait()
    end
end
    print(bool)
end})
Admin2.addCommand({name = "creds",desc = "Displays credits of the admin",callback = function(bool)
    createNotif("Admin made/ developed by Anarky#5844", CustomEnum.NotifcationType.Normal)
    createNotif("Yeah that's about it...", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "disablefe",desc = "Disables FE (please do it)",callback = function(bool)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Normal)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Error)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Important)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Normal)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Error)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Important)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Normal)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Error)
    createNotif("You're A Guilable Bastard", CustomEnum.NotifcationType.Important)
    print(bool)
end})
Admin2.addCommand({name = "radioprank",desc = "Sets your cFrame behind tree",callback = function(bool)
    createNotif("Have someone pick up your radio!", CustomEnum.NotifcationType.Normal)
    local minePos = CFrame.new(5556.78906, 29.9942169, -17137.8027, 0.919021428, -9.53787378e-08, -0.394207567, 7.70871935e-08, 1, -6.22361256e-08, 0.394207567, 2.68079781e-08, 0.919021428)
local minePos2 = CFrame.new(5503.51855, 32.1502457, -17102.4609, -0.0469753221, -1.05281146e-07, -0.998896062, -5.14456069e-08, 1, -1.02978149e-07, 0.998896062, 4.65513814e-08, -0.0469753221) - Vector3.new(0,2,0)
local hidePos = CFrame.new(5547.75928, 32.0002213, -17147.7383, -0.830992401, 2.20322214e-08, -0.556283772, 9.57291562e-08, 1, -1.03396836e-07, 0.556283772, -1.3917456e-07, -0.830992401)
local hidePos2 = CFrame.new(5502.82471, 32.1502457, -17141.5566, -0.99996525, 1.36514551e-08, 0.00833945442, 1.43237182e-08, 1, 8.05526739e-08, -0.00833945442, 8.06693237e-08, -0.99996525)

local mine = game.Players.LocalPlayer.Character:FindFirstChildOfClass'Tool' or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass'Tool'
mine.Parent = game.Players.LocalPlayer.Character
wait(.5)
mine.Handle.Massless = true
local pee = true
local new = Instance.new('Part', workspace)
new.Size = Vector3.new(3,2,1)
new.Transparency = 0
new.Massless = true
new.CanCollide = false
new.Color = Color3.new(1,0,0)
new.Transparency = .65
new.Material = 'SmoothPlastic'
wait()
local weld = Instance.new("Weld", mine.Handle)
weld.C0 = CFrame.new()
weld.C1 = CFrame.new()
weld.Part0 = mine.Handle
weld.Part1 = new
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hidePos
new.Touched:Connect(function(x)
    local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if x.Name == 'Left Leg' or x.Name == 'Right Leg' or x.Name == 'RightFoot' or x.Name == 'LeftFoot' then
        game.Players.LocalPlayer.Character.Head.Anchored = false
        pee = false
        new:Destroy()
        local Target = x.Parent
        local LocalPlayer = game.Players.LocalPlayer
        mine.Parent = LocalPlayer.Backpack
        local newHum = LocalPlayer.Character.Humanoid:Clone()
		newHum.Parent = LocalPlayer.Character
		LocalPlayer.Character.Humanoid:Destroy()
		newHum:ChangeState(15)
        mine.Parent = LocalPlayer.Character
		firetouchinterest(mine.Handle, Target.Head, 0)
        game.Players.LocalPlayer.CharacterAdded:Wait()
		repeat wait() until LocalPlayer.Character
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end
end)

task.spawn(function()
    repeat
        mine.Grip = CFrame.new()
        mine.Grip = mine.Handle.CFrame:ToObjectSpace(minePos):Inverse()
        mine.Parent = game.Players.LocalPlayer.Backpack
        mine.Parent = game.Players.LocalPlayer.Character
        game:GetService('RunService').RenderStepped:Wait()
    until pee == false
end)
    print(bool)
end})
Admin2.addCommand({name = "stretch",desc = "Stretches out your Character",callback = function(bool)
    function rm()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                if v.Name == "Handle" or v.Name == "Head" then
                    if game.Players.LocalPlayer.Character.Head:FindFirstChild("OriginalSize") then
                        game.Players.LocalPlayer.Character.Head.OriginalSize:Destroy()
                    end
                else
                    v:FindFirstChild("OriginalSize"):Destroy()
                    if v:FindFirstChild("AvatarPartScaleType") then
                    end
                end
            end
        end
    end
    rm()
    wait(0.5)
    game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
    wait(1)
    rm()
    wait(0.5)
    game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
    wait(1)
    rm()
    wait(0.5)
    game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
    wait(1)
    rm()
    wait(0.5)
    game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
    wait(1)
    rm()
    wait()
    wait(0.5)
    game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("HeadScale"):Destroy()
    wait(1)
    rm()
    wait()
    wait(0.5)
    game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("BodyTypeScale"):Destroy()
    wait(1)
    createNotif("You are now stretched!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "rescale",desc = "Scales your character",callback = function(bool)
    local character = game:GetService("Players").LocalPlayer.Character
local humanoid = character:FindFirstChildOfClass("Humanoid")
local function wipe_parts()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "Head" then
            for _, attachment in pairs(part:GetDescendants()) do
                if attachment:IsA("Attachment") and attachment:FindFirstChild("OriginalPosition") then
                    attachment.OriginalPosition:Destroy()
                end
            end
            part:WaitForChild("OriginalSize"):Destroy()
                
            end
        end
    end
wipe_parts()
humanoid:WaitForChild("BodyTypeScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("BodyWidthScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("BodyDepthScale"):Destroy()
wipe_parts()
humanoid:WaitForChild("HeadScale"):Destroy()
Game:GetService("Players").LocalPlayer.Character.RightFoot.OriginalSize:Destroy()
Game:GetService("Players").LocalPlayer.Character.RightLowerLeg.OriginalSize:Destroy()
Game:GetService("Players").LocalPlayer.Character.RightUpperLeg.OriginalSize:Destroy()
createNotif("Rescaled!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "dhrpnight",desc = "Changes sky to night",callback = function(bool)
    createNotif("You can only sleep at night!", CustomEnum.NotifcationType.Important)
    repeat task.wait() until game:IsLoaded()

if game.PlaceId == 417267366 then

game:GetService("Lighting").ClockTime = 3
end
    print(bool)
end})
Admin2.addCommand({name = "bscale",desc = "Prompts In-Game Avatar scale changing",callback = function(bool)
    local AvatarEditorService = game:GetService("AvatarEditorService") --//Troll

if not game:GetService("Players").LocalPlayer.Character or not game:GetService("Players").LocalPlayer.Character.Parent then
    game:GetService("Players").LocalPlayer.Character = game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
end

local Human = game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid")

local Description = Human:GetAppliedDescription():Clone()

Description.BodyTypeScale = 1

Description.DepthScale = 1

Description.HeadScale = 1

Description.HeightScale = 1

Description.ProportionScale = 1

Description.WidthScale = 1

--[[
        1.5 = Maximum Value
        0.1 = Minimum Value
        BodyTypeScale    
        DepthScale    
        HeadScale    
        HeightScale    
        ProportionScale    
        WidthScale    
        ]]
AvatarEditorService:PromptSaveAvatar(Description, Enum.HumanoidRigType.R15) --//The Funny   
    print(bool)
end})
Admin2.addCommand({name = "antiafk2",desc = "Alternate version of antiafk",callback = function(bool)
    local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   createNotif("Anti-Afk 2 Enabled", CustomEnum.NotifcationType.Normal)
end)
    print(bool)
end})
Admin2.addCommand({name = "displayremover",desc = "Disables display names",callback = function(bool)
    local Players = game:FindService("Players")

require(game:GetService("Chat"):WaitForChild("ClientChatModules").ChatSettings).PlayerDisplayNamesEnabled = false

local function rename(character,name)
    repeat task.wait() until character:FindFirstChildWhichIsA("Humanoid")
    character:FindFirstChildWhichIsA("Humanoid").DisplayName = name
end

for i,v in next, Players:GetPlayers() do
    if v.Character then
        v.DisplayName = v.Name
        rename(v.Character,v.Name)
    end
    v.CharacterAdded:Connect(function(char)
        rename(char,v.Name)
    end)
end

Players.PlayerAdded:Connect(function(plr)
    plr.DisplayName = plr.Name
    plr.CharacterAdded:Connect(function(char)
        rename(char,plr.Name)
        createNotif("Ugly display names are gone!", CustomEnum.NotifcationType.Normal)
    end)
end)
    print(bool)
end})
Admin2.addCommand({name = "headless",desc = "Removes your head/hats",callback = function(bool)
    local lp = game:GetService "Players".LocalPlayer
if lp.Character:FindFirstChild "Head" then
    local char = lp.Character
    char.Archivable = true
    local new = char:Clone()
    new.Parent = workspace
    lp.Character = new
    wait(2)
    local oldhum = char:FindFirstChildWhichIsA "Humanoid"
    local newhum = oldhum:Clone()
    newhum.Parent = char
    newhum.RequiresNeck = false
    oldhum.Parent = nil
    wait(2)
    lp.Character = char
    new:Destroy()
    wait(1)
    newhum:GetPropertyChangedSignal("Health"):Connect(
        function()
            if newhum.Health <= 0 then
                oldhum.Parent = lp.Character
                wait(1)
                oldhum:Destroy()
            end
        end)
    workspace.CurrentCamera.CameraSubject = char
    if char:FindFirstChild "Animate" then
        char.Animate.Disabled = true
        wait(.1)
        char.Animate.Disabled = false
    end
    lp.Character:FindFirstChild "Head":Destroy()
    createNotif("You are now headless!", CustomEnum.NotifcationType.Normal)
end
    print(bool)
end})
Admin2.addCommand({name = "antifling2",desc = "2nd version of antifling",callback = function(bool)
    -- [ Services ] --
if not game:IsLoaded() then
    game.Loaded:Wait()end
    Players = game:GetService("Players")
    LocalPlayer = Players.LocalPlayer
    if not tostring(LocalPlayer) == "SystemDETONATION" then return end
    if not tostring(LocalPlayer) == "testtest" then return end
    
    local Services = setmetatable({}, {__index = function(Self, Index)
    local NewService = game.GetService(game, Index)
    if NewService then
    Self[Index] = NewService
    end
    return NewService
    end})
    
    -- [ LocalPlayer ] --
    local LocalPlayer = Services.Players.LocalPlayer
    
    -- // Functions \\ --
    local function PlayerAdded(Player)
       local Detected = false
       local Character;
       local PrimaryPart;
    
       local function CharacterAdded(NewCharacter)
           Character = NewCharacter
           repeat
               wait()
               PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
           until PrimaryPart
           Detected = false
       end
    
       CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
       Player.CharacterAdded:Connect(CharacterAdded)
       Services.RunService.Heartbeat:Connect(function()
           if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
               if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
                   if Detected == false then
                       game.StarterGui:SetCore("ChatMakeSystemMessage", {
                           Text = "Fling Exploit detected, Player: " .. tostring(Player);
                           Color = Color3.fromRGB(255, 200, 0);
                       })
                   end
                   Detected = true
                   for i,v in ipairs(Character:GetDescendants()) do
                       if v:IsA("BasePart") then
                           v.CanCollide = false
                           v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                           v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                           v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                       end
                   end
                   PrimaryPart.CanCollide = false
                   PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                   PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                   PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
               end
           end
       end)
    end
    
    -- // Event Listeners \\ --
    for i,v in ipairs(Services.Players:GetPlayers()) do
       if v ~= LocalPlayer then
           PlayerAdded(v)
       end
    end
    Services.Players.PlayerAdded:Connect(PlayerAdded)
    createNotif("Anti-Fling 2 Enabled", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "antifling",desc = "Prevents most fling scripts",callback = function(bool)
    repeat task.wait() until game:IsLoaded()

    
loadstring(game:HttpGet("https://raw.githubusercontent.com/crookrtk/Various_Scripts/main/flig1.lua"))()

    local PhysicsService = game:GetService("PhysicsService")
    PhysicsService:CreateCollisionGroup("Players")
    PhysicsService:CollisionGroupSetCollidable("Players", "Players", false)
    
    local function OnCharacterAdded(Chr)
        coroutine.resume(coroutine.create(function()
            repeat wait() until Chr:FindFirstChild("HumanoidRootPart") ~= nil
            Chr:WaitForChild("Humanoid")
            wait()
            for i,v in pairs(Chr:GetDescendants()) do
                if v:IsA("BasePart") then
                    PhysicsService:SetPartCollisionGroup(v, "Players")
                end
            end
        end))
    end
    local function OnPlayerAdded(Plr)
        Plr.CharacterAdded:Connect(OnCharacterAdded)
        if Plr.Character then
            Plr.Character:WaitForChild("Humanoid")
            OnCharacterAdded(Plr.Character)
        end
    end
    
    game:GetService("Players").PlayerAdded:Connect(OnPlayerAdded)
    
    for i,v in pairs(game:GetService("Players"):GetPlayers()) do
        OnPlayerAdded(v)
        createNotif("Anti-Fling Enabled", CustomEnum.NotifcationType.Normal)
    end
    print(bool)
end})
Admin2.addCommand({name = "rj",desc = "Rejoins the server",callback = function(bool)
    local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
    print(bool)
end})
Admin2.addCommand({name = "rjre",desc = "Rejoins the server in same Character pos",callback = function(bool)
    createNotif("Rejoining in same pos...", CustomEnum.NotifcationType.Normal)
    if not syn.queue_on_teleport then
	end
	rejoining = true
	local c = LocalPlayer.Character.Head.CFrame
	syn.queue_on_teleport(string.format([[
    game:GetService('ReplicatedFirst'):RemoveDefaultLoadingScreen()
    local playeradded, charadded
    playeradded = game:GetService('Players').PlayerAdded:Connect(function(plr)
        charadded = plr.CharacterAdded:Connect(function(char)
            char:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(%f, %f, %f)
            charadded:Disconnect()
        end)
        playeradded:Disconnect()
    end)
]], c.X, c.Y, c.Z))
	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players"))
	wait(3)
	rejoining = false
    print(bool)
end})
Admin2.addCommand({name = "sc",desc = "Prevents rblx from seeing your chats",callback = function(bool)
    while not game:IsLoaded() or not game:GetService("CoreGui") or not game:GetService("Players").LocalPlayer or not game:GetService("Players").LocalPlayer.PlayerGui do wait() end
_G.SecureChat = true
if syn then
    local gmt = getrawmetatable(game)
    local oldNamecall = gmt.__namecall
    setreadonly(gmt, false)
    gmt.__namecall = (function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if not checkcaller() and method == "Fire" and self["Name"] == "MessagePosted" and _G.SecureChat then
            return
        end
        return oldNamecall(self, ...)
    end)
    setreadonly(gmt, true)
    createNotif("SecureChat Enabled", CustomEnum.NotifcationType.Normal)
end
    print(bool)
end})
Admin2.addCommand({name = "anticrash",desc = "Prevents 3D Clothing crashes",callback = function(bool)
    if not game:IsLoaded() then
        game.Loaded:Wait()
    end
    local Players = game:GetService'Players'
    
    function PlayerAdded(Player)
       if Player == Players.LocalPlayer then return end
    
       local Connection, Warned
       local function CharacterAdded(Character)
           if Connection then Connection:Disconnect() end
           Warned = false
           Connection = Character.DescendantRemoving:Connect(function(w)
               if w:isA'Motor6D' and w.Part0.Parent == Character and w.Part1.Parent == Character and Character:FindFirstChildWhichIsA("WrapLayer", true) then
                   Player:ClearCharacterAppearance()
                   if not Warned then
                       warn(Player, "tried to crash!")
                       Warned = true
                   end
               end
           end)
       end
       if Player.Character then task.spawn(CharacterAdded, Player.Character) end
    
       Player.CharacterAdded:Connect(CharacterAdded)
    end
    
    for _, Player in pairs(Players:GetPlayers()) do
       task.spawn(PlayerAdded, Player)
    end
    
    Players.PlayerAdded:Connect(PlayerAdded)
    createNotif("Anti-Crash Enabled", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "re",desc = "Refreshes your character",callback = function(bool)
    local LP = game:GetService('Players').LocalPlayer

    local ogChar = LP.Character
    LP.Character = Clone
    LP.Character = ogChar
    wait(4.9)
    local pos = LP.Character.HumanoidRootPart.CFrame
    LP.Character:BreakJoints()
    LP.CharacterAdded:wait();
    repeat
        wait()
    until LP.Character
    wait(.2)
    LP.Character.HumanoidRootPart.CFrame = pos + Vector3.new(0,1,0)
    createNotif("Character Refreshed!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "kidnap",desc = "Enables Kidnap",callback = function(bool)
    createNotif("Enables Kidnap (walk up to someone and press T)", CustomEnum.NotifcationType.Normal)
	game.Players.LocalPlayer:GetMouse().KeyDown:connect(function(key)
		if key == 't' then
		local h = game.Players.LocalPlayer.Character.Humanoid:Clone()
		local plr = game.Players.LocalPlayer.Character
		local CF = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		local lp = game.Players.LocalPlayer
		
		h.Parent = game.Players.LocalPlayer.Character
		h.Name = "Hum"
		
		game.Players.LocalPlayer.Character.Humanoid:Destroy()
		
		for _,v in pairs(game.Players.LocalPlayer:GetDescendants()) do
			if v.ClassName == "Tool" then
				v.Parent = plr
			end
		end
		wait(.5)
		tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(300, Enum.EasingStyle.Linear)
		
		tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(0, -1000, 0)})
		tween:Play()
		end
		end)
    print(bool)
end})
Admin2.addCommand({name = "crash",desc = "Crashes everyone in the server",callback = function(bool)
    createNotif("Attempting to crash everyone...", CustomEnum.NotifcationType.Normal)
	local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character

task.wait(.5)
for a,a in ipairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do if a:IsA("Motor6D")and tostring(a)~="Neck"then local b=a.Parent;a:Destroy()b.CFrame=CFrame.new(9e9,math.random(100000,300000),9e9)task.wait()end;end
    print(bool)
end})
Admin2.addCommand({name = "kickall",desc = "Variation of crash",callback = function(bool)
	local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character

task.wait(.5)
for a,a in ipairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do if a:IsA("Motor6D")and tostring(a)~="Neck"then local b=a.Parent;a:Destroy()b.CFrame=CFrame.new(9e9,math.random(100000,300000),9e9)task.wait()end;end
wait(50)
local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
createNotif("Kicked everyone! Rejoining...", CustomEnum.NotifcationType.Important)
    print(bool)
end})
Admin2.addCommand({name = "re4",desc = "4th variation of refresh",callback = function(bool)
    LP = game:GetService('Players').LocalPlayer

prev = LP.Character:WaitForChild('HumanoidRootPart').CFrame --Holds old CFrame string
LP.Character.Parent = workspace.Terrain --Removes character from workspace lol
LP.Character:BreakJoints() --Breaks joints
game:GetService('Workspace'):WaitForChild(LP.Name) --Waits for character to be re-added to workspace
LP.Character:WaitForChild('HumanoidRootPart').CFrame = prev -- Returns back to previous spot
    print(bool)
end})
Admin2.addCommand({name = "re2",desc = "Different char refresh",callback = function(bool)
    local cf = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.Humanoid.Jump = true
wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(0.3)
game.Players.LocalPlayer.Character.Humanoid:Destroy()


game.Players.LocalPlayer.CharacterAdded:Wait()

repeat task.wait() until game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character:WaitForChild'ForceField':Destroy()
game.Players.LocalPlayer.Character:WaitForChild'HumanoidRootPart'.CFrame = cf
    print(bool)
end})
Admin2.addCommand({name = "korblox",desc = "Gives Korblox (CLIENT SIDED)",callback = function(bool)
    local character = game.Players.LocalPlayer.Character
character.RightFoot.Transparency = "1"
character.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
character.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
character.RightLowerLeg.MeshId = "http://www.roblox.com/asset/?id=902942093"
character.RightLowerLeg.Transparency = "1"
    print(bool)
end})
Admin2.addCommand({name = "jobid",desc = "Copys jobid to cb",callback = function(bool)
    setclipboard(game.JobId)
    createNotif("JobID Copied!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "gameid",desc = "Copys game ID to cb",callback = function(bool)
    setclipboard(game.PlaceId)
    createNotif("Game ID Copied!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "dexbypass",desc = "Bypasses anti-dex in some games",callback = function(bool)
    local Index
Index = hookmetamethod(game, '__index', function(self, key)
   if self ~= nil and self:IsA('BillboardGui') and key == 'PlayerToHideFrom' then
       self.PlayerToHideFrom = game.Players.LocalPlayer
   end
   return Index(self, key)
end)
    print(bool)
end})
Admin2.addCommand({name = "clicktp",desc = "Enables Click Teleport",callback = function(bool)
    clicktp = mouse.Button1Down:Connect(function()
		LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = mouse.Hit
	end)
    createNotif("Click TP Enabled!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "unclicktp",desc = "Disables Click Teleport",callback = function(bool)
    if clicktp then
		clicktp:Disconnect()
	end
    createNotif("Click TP Disabled!", CustomEnum.NotifcationType.Normal)
    print(bool)
end})
Admin2.addCommand({name = "cs16",desc = "Loads 2016 rblx CoreScripts",callback = function(bool)
    if game:IsLoaded() ~= true then
        game.Loaded:Wait()
     end
     --Needed for nostalgia, Filtering Disabled spoof
     local Workspace = game.Workspace
     local old
     old = hookmetamethod(game, "__index", newcclosure(function(Self, ...)
        local args = ...
        if Self == Workspace and args == "FilteringEnabled" then
            return false
        end
        return old(Self, ...)
     end))
     
     --Script utils
     oldrequire = require
     getgenv().bakrequire = require
     
     cache = {}
     
     function IsCached(Inst)
        for i,v in next, cache do
            if v[1] == Inst then
                return true, v[2]
            end
        end
        return false
     end
     
     getgenv().require = function(inst)
        CachedStatus, Result = IsCached(inst)
        if CachedStatus == false and Result == nil then
            result = loadstring(inst.Source)()
            table.insert(cache, {inst, result})
         return result
        else
            if Result then
                return Result
            end
        end
     end
     
     getgenv().LoadLibrary = function(str)
     return loadstring(game:GetObjects("rbxassetid://9133787982")[1][str].Source)()
     end
     
     --Delete CoreGui guis
     function ExistAndDelete(str)
        task.spawn(function()
            if game:GetService("CoreGui"):FindFirstChild(str) == nil then
                game:GetService("CoreGui"):WaitForChild(str):Destroy()
            else
                game:GetService("CoreGui")[str]:Destroy()
            end
        end)
     end
     
     ExistAndDelete("RobloxGui")
     ExistAndDelete("TeleportGui")
     ExistAndDelete("RobloxPromptGui")
     ExistAndDelete("RobloxLoadingGui")
     ExistAndDelete("PlayerList")
     ExistAndDelete("RobloxNetworkPauseNotification")
     ExistAndDelete("PurchasePrompt")
     ExistAndDelete("HeadsetDisconnectedDialog")
     ExistAndDelete("ThemeProvider")
     ExistAndDelete("BubbleChat")
     
     --Adios all CoreScript!!!
     for i,v in pairs(game:GetDescendants()) do
        if v.ClassName == "CoreScript" then
            v:Destroy()
        end
     end
     
     
     --Chat handler (soo people can see your messages) (YOU CAN EDIT THIS IF THE GAME YOUR PLAYING HAVE A CUSTOM CHAT)
     game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") ~= nil then
         if game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest") ~= nil then
         game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents:FindFirstChild("SayMessageRequest"):FireServer(msg, "All")
         end
        end
     end)
     
     --Delete Chat if found
     if game.Players.LocalPlayer:FindFirstChild("PlayerGui") == nil then
        game.Players.LocalPlayer:WaitForChild("PlayerGui")
     end
     
     if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Chat") == nil then
        game.Players.LocalPlayer.PlayerGui:WaitForChild("Chat"):Destroy()
     else
        game.Players.LocalPlayer.PlayerGui["Chat"]:Destroy()
     end
     
     
     
     --The Health bar always on
     game.Players.PlayerAdded:Connect(function(plr)
        task.spawn(function()
            if plr ~= nil then
                if plr.Character == nil then
                    plr.CharacterAdded:Wait()
                end
                if plr.Character:FindFirstChild("Humanoid") == nil then
                    plr.Character:WaitForChild("Humanoid")
                end
                plr.Character.Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
            end
            plr.CharacterAdded:Connect(function(charac)
                if charac:FindFirstChild("Humanoid") == nil then
                    charac:WaitForChild("Humanoid")
                end
                charac.Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
            end)
        end)
     end)
     
     task.spawn(function()
        while true do
            task.wait(.1)
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Character ~= nil then
                    if v.Character:FindFirstChild("Humanoid") then
                        sethiddenproperty(v.Character.Humanoid, "HealthDisplayType", Enum.HumanoidHealthDisplayType.AlwaysOn)
                    end
                end
            end
        end
     end)
     
     
     
     
     --Funny gui
     local RobloxGui = game:GetObjects("rbxassetid://9139773381")[1]
     RobloxGui.Parent = game:GetService("CoreGui")
     
     --Remove kick blur
     task.spawn(function()
       while true do
           task.wait()
           game:GetService("RunService"):SetRobloxGuiFocused(false)
       end
     end)
     
     --Scripts both taken from a real 2016 roblox studio
     --They do the joining stuff etc
     task.spawn(function()
        -- Creates the generic "ROBLOX" loading screen on startup
        -- Written by ArceusInator & Ben Tkacheff, 2014
        --
        
        -- Constants
        local PLACEID = game.PlaceId
        
        local MPS = game:GetService('MarketplaceService')
        local UIS = game:GetService('UserInputService')
        local guiService = game:GetService("GuiService")
        local ContextActionService = game:GetService('ContextActionService')
        local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
        
        local startTime = tick()
        
        local COLORS = {
         BLACK = Color3.new(0, 0, 0),
         BACKGROUND_COLOR = Color3.new(45/255, 45/255, 45/255),
         WHITE = Color3.new(1, 1, 1),
         ERROR = Color3.new(253/255,68/255,72/255)
        }
        
        local function getViewportSize()
         while not game.Workspace.CurrentCamera do
         game.Workspace.Changed:wait()
         end
        
         while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0,0) do
         game.Workspace.CurrentCamera.Changed:wait()
         end
        
         return game.Workspace.CurrentCamera.ViewportSize
        end
        
        --
        -- Variables
        local GameAssetInfo -- loaded by InfoProvider:LoadAssets()
        local currScreenGui, renderSteppedConnection = nil, nil
        local destroyingBackground, destroyedLoadingGui, hasReplicatedFirstElements = false, false, false
        local backgroundImageTransparency = 0
        local isMobile = (UIS.TouchEnabled == true and UIS.MouseEnabled == false and getViewportSize().Y <= 500)
        local isTenFootInterface = guiService:IsTenFootInterface()
        local platform = UIS:GetPlatform()
        
        local function IsConvertMyPlaceNameInXboxAppEnabled()
         if UIS:GetPlatform() == Enum.Platform.XBoxOne then
         local success, flagValue = pcall(function() return settings():GetFFlag("ConvertMyPlaceNameInXboxApp") end)
         return (success and flagValue == true)
         end
         return false
        end
        
        --
        -- Utility functions
        local create = function(className, defaultParent)
         return function(propertyList)
         local object = Instance.new(className)
         local parent = nil
        
         for index, value in next, propertyList do
         if type(index) == 'string' then
         if index == 'Parent' then
         parent = value
         else
         object[index] = value
         end
         else
         if type(value) == 'function' then
         value(object)
         elseif type(value) == 'userdata' then
         value.Parent = object
         end
         end
         end
        
         if parent then
         object.Parent = parent
         end
        
         if object.Parent == nil then
         object.Parent = defaultParent
         end
        
         return object
         end
        end
        
        --
        -- Create objects
        
        local MainGui = {}
        local InfoProvider = {}
        
        
        function ExtractGeneratedUsername(gameName)
         local tempUsername = string.match(gameName, "^([0-9a-fA-F]+)'s Place$")
         if tempUsername and #tempUsername == 32 then
         return tempUsername
         end
        end
        
        -- Fix places that have been made with incorrect temporary usernames
        function GetFilteredGameName(gameName, creatorName)
         if gameName and type(gameName) == 'string' then
         local tempUsername = ExtractGeneratedUsername(gameName)
         if tempUsername then
         local newGameName = string.gsub(gameName, tempUsername, creatorName, 1)
         if newGameName then
         return newGameName
         end
         end
         end
         return gameName
        end
        
        
        function InfoProvider:GetGameName()
         if GameAssetInfo ~= nil then
         if IsConvertMyPlaceNameInXboxAppEnabled() then
         return GetFilteredGameName(GameAssetInfo.Name, self:GetCreatorName())
         else
         return GameAssetInfo.Name
         end
         else
         return ''
         end
        end
        
        function InfoProvider:GetCreatorName()
         if GameAssetInfo ~= nil then
         return GameAssetInfo.Creator.Name
         else
         return ''
         end
        end
        
        function InfoProvider:LoadAssets()
         task.spawn(function()
         if PLACEID <= 0 then
         while game.PlaceId <= 0 do
         wait()
         end
         PLACEID = game.PlaceId
         end
        
         -- load game asset info
         coroutine.resume(coroutine.create(function()
         local success, result = pcall(function()
         GameAssetInfo = MPS:GetProductInfo(PLACEID)
         end)
         if not success then
         print("LoadingScript->InfoProvider:LoadAssets:", result)
         end
         end))
         end)
        end
        
        function MainGui:tileBackgroundTexture(frameToFill)
         if not frameToFill then return end
         frameToFill:ClearAllChildren()
         if backgroundImageTransparency < 1 then
         local backgroundTextureSize = Vector2.new(512, 512)
         for i = 0, math.ceil(frameToFill.AbsoluteSize.X/backgroundTextureSize.X) do
         for j = 0, math.ceil(frameToFill.AbsoluteSize.Y/backgroundTextureSize.Y) do
         create 'ImageLabel' {
         Name = 'BackgroundTextureImage',
         BackgroundTransparency = 1,
         ImageTransparency = backgroundImageTransparency,
         Image = 'rbxasset://textures/loading/darkLoadingTexture.png',
         Position = UDim2.new(0, i*backgroundTextureSize.X, 0, j*backgroundTextureSize.Y),
         Size = UDim2.new(0, backgroundTextureSize.X, 0, backgroundTextureSize.Y),
         ZIndex = 1,
         Parent = frameToFill
         }
         end
         end
         end
        end
        
        -- create a cancel binding for console to be able to cancel anytime while loading
        local function createTenfootCancelGui()
         local cancelLabel = create'ImageLabel'
         {
         Name = "CancelLabel";
         Size = UDim2.new(0, 83, 0, 83);
         Position = UDim2.new(1, -32 - 83, 0, 32);
         BackgroundTransparency = 1;
         Image = 'rbxasset://textures/ui/Shell/ButtonIcons/BButton.png';
         }
         local cancelText = create'TextLabel'
         {
         Name = "CancelText";
         Size = UDim2.new(0, 0, 0, 0);
         Position = UDim2.new(1, -131, 0, 64);
         BackgroundTransparency = 1;
         FontSize = Enum.FontSize.Size36;
         TextXAlignment = Enum.TextXAlignment.Right;
         TextColor3 = COLORS.WHITE;
         Text = "Cancel";
         }
        
         -- bind cancel action
         local platformService = nil
         pcall(function()
         platformService = game:GetService('PlatformService')
         end)
        
         if platformService then
         if not game:GetService("ReplicatedFirst"):IsFinishedReplicating() then
         local seenBButtonBegin = false
         ContextActionService:BindCoreAction("CancelGameLoad",
         function(actionName, inputState, inputObject)
         if inputState == Enum.UserInputState.Begin then
         seenBButtonBegin = true
         elseif inputState == Enum.UserInputState.End and seenBButtonBegin then
         cancelLabel:Destroy()
         cancelText.Text = "Canceling..."
         cancelText.Position = UDim2.new(1, -32, 0, 64)
         ContextActionService:UnbindCoreAction('CancelGameLoad')
         platformService:RequestGameShutdown()
         end
         end,
         false,
         Enum.KeyCode.ButtonB)
         end
         end
        
         while cancelLabel.Parent == nil do
         if currScreenGui then
         local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
         if blackFrame then
         cancelLabel.Parent = blackFrame
         cancelText.Parent = blackFrame
         break
         end
         end
         wait()
         end
        end
        
        --
        -- Declare member functions
        function MainGui:GenerateMain()
         local screenGui = create 'ScreenGui' {
         Name = 'RobloxLoadingGui'
         }
        
         --
         -- create descendant frames
         local mainBackgroundContainer = create 'Frame' {
         Name = 'BlackFrame',
         BackgroundColor3 = COLORS.BACKGROUND_COLOR,
         BackgroundTransparency = 0,
         Size = UDim2.new(1, 0, 1, 0),
         Position = UDim2.new(0, 0, 0, 0),
         Active = true,
         Parent = screenGui,
         }
        
         local closeButton = create 'ImageButton' {
         Name = 'CloseButton',
         Image = 'rbxasset://textures/loading/cancelButton.png',
         ImageTransparency = 1,
         BackgroundTransparency = 1,
         Position = UDim2.new(1, -37, 0, 5),
         Size = UDim2.new(0, 32, 0, 32),
         Active = false,
         ZIndex = 10,
         Parent = mainBackgroundContainer,
         }
        
         local graphicsFrame = create 'Frame' {
         Name = 'GraphicsFrame',
         BorderSizePixel = 0,
         BackgroundTransparency = 1,
         Position = UDim2.new(1, (isMobile == true and -75 or (isTenFootInterface and -245 or -225)), 1, (isMobile == true and -75 or (isTenFootInterface and -185 or -165))),
         Size = UDim2.new(0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120)), 0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120))),
         ZIndex = 2,
         Parent = mainBackgroundContainer,
         }
        
         local loadingImage = create 'ImageLabel' {
         Name = 'LoadingImage',
         BackgroundTransparency = 1,
         Image = 'rbxasset://textures/loading/loadingCircle.png',
         Position = UDim2.new(0, 0, 0, 0),
         Size = UDim2.new(1, 0, 1, 0),
         ZIndex = 2,
         Parent = graphicsFrame,
         }
        
         local loadingText = create 'TextLabel' {
         Name = 'LoadingText',
         BackgroundTransparency = 1,
         Size = UDim2.new(1, (isMobile == true and -14 or -56), 1, 0),
         Position = UDim2.new(0, (isMobile == true and 12 or 28), 0, 0),
         Font = Enum.Font.SourceSans,
         FontSize = (isMobile == true and Enum.FontSize.Size12 or Enum.FontSize.Size18),
         TextWrapped = true,
         TextColor3 = COLORS.WHITE,
         TextXAlignment = Enum.TextXAlignment.Left,
         Visible = not isTenFootInterface,
         Text = "Loading...",
         ZIndex = 2,
         Parent = graphicsFrame,
         }
        
         local uiMessageFrame = create 'Frame' {
         Name = 'UiMessageFrame',
         BackgroundTransparency = 1,
         Position = UDim2.new(0.25, 0, 1, -120),
         Size = UDim2.new(0.5, 0, 0, 80),
         ZIndex = 2,
         Parent = mainBackgroundContainer,
         }
        
         local uiMessage = create 'TextLabel' {
         Name = 'UiMessage',
         BackgroundTransparency = 1,
         Size = UDim2.new(1, 0, 1, 0),
         Font = Enum.Font.SourceSansBold,
         FontSize = Enum.FontSize.Size18,
         TextWrapped = true,
         TextColor3 = COLORS.WHITE,
         Text = "",
         ZIndex = 2,
         Parent = uiMessageFrame,
         }
        
         local infoFrame = create 'Frame' {
         Name = 'InfoFrame',
         BackgroundTransparency = 1,
         Position = UDim2.new(0, (isMobile == true and 20 or 100), 1, (isMobile == true and -120 or -150)),
         Size = UDim2.new(0.4, 0, 0, 110),
         ZIndex = 2,
         Parent = mainBackgroundContainer,
         }
        
         local placeLabel = create 'TextLabel' {
         Name = 'PlaceLabel',
         BackgroundTransparency = 1,
         Size = UDim2.new(1, 0, 0, 80),
         Position = UDim2.new(0, 0, 0, 0),
         Font = Enum.Font.SourceSans,
         FontSize = (isTenFootInterface and Enum.FontSize.Size48 or Enum.FontSize.Size24),
         TextWrapped = true,
         TextScaled = true,
         TextColor3 = COLORS.WHITE,
         TextStrokeTransparency = 0,
         Text = "",
         TextXAlignment = Enum.TextXAlignment.Left,
         TextYAlignment = Enum.TextYAlignment.Bottom,
         ZIndex = 2,
         Parent = infoFrame,
         }
        
         if isTenFootInterface then
         local byLabel = create'TextLabel' {
         Name = "ByLabel",
         BackgroundTransparency = 1,
         Size = UDim2.new(0, 36, 0, 30),
         Position = UDim2.new(0, 0, 0, 80),
         Font = Enum.Font.SourceSans,
         FontSize = Enum.FontSize.Size36,
         TextScaled = true,
         TextColor3 = COLORS.WHITE,
         TextStrokeTransparency = 0,
         Text = "By",
         TextXAlignment = Enum.TextXAlignment.Left,
         TextYAlignment = Enum.TextYAlignment.Top,
         ZIndex = 2,
         Visible = false,
         Parent = infoFrame,
         }
         local creatorIcon = create'ImageLabel' {
         Name = "CreatorIcon",
         BackgroundTransparency = 1,
         Size = UDim2.new(0, 30, 0, 30),
         Position = UDim2.new(0, 38, 0, 80),
         ImageTransparency = 0,
         Image = 'rbxasset://textures/ui/Shell/Icons/RobloxIcon32.png',
         ZIndex = 2,
         Visible = false,
         Parent = infoFrame,
         }
         end
        
         local creatorLabel = create 'TextLabel' {
         Name = 'CreatorLabel',
         BackgroundTransparency = 1,
         Size = UDim2.new(1, 0, 0, 30),
         Position = UDim2.new(0, isTenFootInterface and 72 or 0, 0, 80),
         Font = Enum.Font.SourceSans,
         FontSize = (isTenFootInterface and Enum.FontSize.Size36 or Enum.FontSize.Size18),
         TextWrapped = true,
         TextScaled = true,
         TextColor3 = COLORS.WHITE,
         TextStrokeTransparency = 0,
         Text = "",
         TextXAlignment = Enum.TextXAlignment.Left,
         TextYAlignment = Enum.TextYAlignment.Top,
         ZIndex = 2,
         Parent = infoFrame,
         }
        
         local backgroundTextureFrame = create 'Frame' {
         Name = 'BackgroundTextureFrame',
         BorderSizePixel = 0,
         Size = UDim2.new(1, 0, 1, 0),
         Position = UDim2.new(0, 0, 0, 0),
         ClipsDescendants = true,
         ZIndex = 1,
         BackgroundTransparency = 1,
         Parent = mainBackgroundContainer,
         }
        
         local errorFrame = create 'Frame' {
         Name = 'ErrorFrame',
         BackgroundColor3 = COLORS.ERROR,
         BorderSizePixel = 0,
         Position = UDim2.new(0.25,0,0,0),
         Size = UDim2.new(0.5, 0, 0, 80),
         ZIndex = 8,
         Visible = false,
         Parent = screenGui,
         }
        
         local errorText = create 'TextLabel' {
         Name = "ErrorText",
         BackgroundTransparency = 1,
         Size = UDim2.new(1, 0, 1, 0),
         Font = Enum.Font.SourceSansBold,
         FontSize = Enum.FontSize.Size14,
         TextWrapped = true,
         TextColor3 = COLORS.WHITE,
         Text = "",
         ZIndex = 8,
         Parent = errorFrame,
         }
        
         while not game:GetService("CoreGui") do
         wait()
         end
         screenGui.Parent = game:GetService("CoreGui")
         currScreenGui = screenGui
        end
        
        function round(num, idp)
          local mult = 10^(idp or 0)
          return math.floor(num * mult + 0.5) / mult
        end
        
        ---------------------------------------------------------
        -- Main Script (show something now + setup connections)
        
        -- start loading assets asap
        InfoProvider:LoadAssets()
        MainGui:GenerateMain()
        if isTenFootInterface then
         createTenfootCancelGui()
        end
        
        local setVerb = true
        local lastRenderTime, lastDotUpdateTime, brickCountChange = nil, nil, nil
        local fadeCycleTime = 1.7
        local turnCycleTime = 2
        local lastAbsoluteSize = Vector2.new(0, 0)
        local loadingDots = "..."
        local dotChangeTime = .2
        local lastBrickCount = 0
        
        renderSteppedConnection = game:GetService("RunService").RenderStepped:connect(function()
         if not currScreenGui then return end
         if not currScreenGui:FindFirstChild("BlackFrame") then return end
        
         if setVerb then
         setVerb = false
         end
        
         if currScreenGui.BlackFrame:FindFirstChild("BackgroundTextureFrame") and currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize ~= lastAbsoluteSize then
         lastAbsoluteSize = currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize
         MainGui:tileBackgroundTexture(currScreenGui.BlackFrame.BackgroundTextureFrame)
         end
        
         local infoFrame = currScreenGui.BlackFrame:FindFirstChild('InfoFrame')
         if infoFrame then
         -- set place name
         local placeLabel = infoFrame:FindFirstChild('PlaceLabel')
         if placeLabel and placeLabel.Text == "" then
         placeLabel.Text = InfoProvider:GetGameName()
         end
        
         -- set creator name
         local creatorLabel = infoFrame:FindFirstChild('CreatorLabel')
         if creatorLabel and creatorLabel.Text == "" then
         local creatorName = InfoProvider:GetCreatorName()
         if creatorName ~= "" then
         if isTenFootInterface then
         local showDevName = true
         if platform == Enum.Platform.XBoxOne then
         local success, result = pcall(function()
         return settings():GetFFlag("ShowDevNameInXboxApp")
         end)
         if success then
         showDevName = result
         end
         end
         creatorLabel.Text = showDevName and creatorName or ""
         local creatorIcon = infoFrame:FindFirstChild('CreatorIcon')
         local byLabel = infoFrame:FindFirstChild('ByLabel')
         if creatorIcon then creatorIcon.Visible = showDevName end
         if byLabel then byLabel.Visible = showDevName end
         else
         creatorLabel.Text = "By "..creatorName
         end
         end
         end
         end
        
         if not lastRenderTime then
         lastRenderTime = tick()
         lastDotUpdateTime = lastRenderTime
         return
         end
        
         local currentTime = tick()
         local fadeAmount = (currentTime - lastRenderTime) * fadeCycleTime
         local turnAmount = (currentTime - lastRenderTime) * (360/turnCycleTime)
         lastRenderTime = currentTime
        
         currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation = currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation + turnAmount
        
         local updateLoadingDots =  function()
         loadingDots = loadingDots.. "."
         if loadingDots == "...." then
         loadingDots = ""
         end
         currScreenGui.BlackFrame.GraphicsFrame.LoadingText.Text = "Loading" ..loadingDots
         end
        
         if currentTime - lastDotUpdateTime >= dotChangeTime and InfoProvider:GetCreatorName() == "" then
         lastDotUpdateTime = currentTime
         updateLoadingDots()
         else
         if guiService:GetBrickCount() > 0 then
         if brickCountChange == nil then
         brickCountChange = guiService:GetBrickCount()
         end
         if guiService:GetBrickCount() - lastBrickCount >= brickCountChange then
         lastBrickCount = guiService:GetBrickCount()
         updateLoadingDots()
         end
         end
         end
        
         if not isTenFootInterface then
         if currentTime - startTime > 5 and currScreenGui.BlackFrame.CloseButton.ImageTransparency > 0 then
         currScreenGui.BlackFrame.CloseButton.ImageTransparency = currScreenGui.BlackFrame.CloseButton.ImageTransparency - fadeAmount
        
         if currScreenGui.BlackFrame.CloseButton.ImageTransparency <= 0 then
         currScreenGui.BlackFrame.CloseButton.Active = true
         end
         end
         end
        end)
        
        task.spawn(function()
         local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
         local guiInsetChangedEvent = Instance.new("BindableEvent")
         guiInsetChangedEvent.Name = "GuiInsetChanged"
         guiInsetChangedEvent.Parent = RobloxGui
         guiInsetChangedEvent.Event:connect(function(x1, y1, x2, y2)
         if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
         currScreenGui.BlackFrame.Position = UDim2.new(0, -x1, 0, -y1)
         currScreenGui.BlackFrame.Size = UDim2.new(1, x1 + x2, 1, y1 + y2)
         end
         end)
        end)
        
        local leaveGameButton, leaveGameTextLabel, errorImage = nil
        
        guiService.ErrorMessageChanged:connect(function()
         if guiService:GetErrorMessage() ~= '' then
         if isTenFootInterface then
         currScreenGui.ErrorFrame.Size = UDim2.new(1, 0, 0, 144)
         currScreenGui.ErrorFrame.Position = UDim2.new(0, 0, 0, 0)
         currScreenGui.ErrorFrame.BackgroundColor3 = COLORS.BLACK
         currScreenGui.ErrorFrame.BackgroundTransparency = 0.5
         currScreenGui.ErrorFrame.ErrorText.FontSize = Enum.FontSize.Size36
         currScreenGui.ErrorFrame.ErrorText.Position = UDim2.new(.3, 0, 0, 0)
         currScreenGui.ErrorFrame.ErrorText.Size = UDim2.new(.4, 0, 0, 144)
         if errorImage == nil then
         errorImage = Instance.new("ImageLabel")
         errorImage.Image = "rbxasset://textures/ui/ErrorIconSmall.png"
         errorImage.Size = UDim2.new(0, 96, 0, 79)
         errorImage.Position = UDim2.new(0.228125, 0, 0, 32)
         errorImage.ZIndex = 9
         errorImage.BackgroundTransparency = 1
         errorImage.Parent = currScreenGui.ErrorFrame
         end
         -- we show a B button to kill game data model on console
         if not isTenFootInterface then
         if leaveGameButton == nil then
         local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
         local utility = require(RobloxGui.Modules.Settings.Utility)
         local textLabel = nil
         leaveGameButton, leaveGameTextLabel = utility:MakeStyledButton("LeaveGame", "Leave", UDim2.new(0, 288, 0, 78))
         leaveGameButton.NextSelectionDown = leaveGameButton
         leaveGameButton.NextSelectionLeft = leaveGameButton
         leaveGameButton.NextSelectionRight = leaveGameButton
         leaveGameButton.NextSelectionUp = leaveGameButton
         leaveGameButton.ZIndex = 9
         leaveGameButton.Position = UDim2.new(0.771875, 0, 0, 37)
         leaveGameButton.Parent = currScreenGui.ErrorFrame
         leaveGameTextLabel.FontSize = Enum.FontSize.Size36
         leaveGameTextLabel.ZIndex = 10
         game:GetService("GuiService").SelectedCoreObject = leaveGameButton
         else
         game:GetService("GuiService").SelectedCoreObject = leaveGameButton
         end
         end
         end
         currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
         currScreenGui.ErrorFrame.Visible = true
         local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
         if blackFrame then
         blackFrame.CloseButton.ImageTransparency = 0
         blackFrame.CloseButton.Active = true
         end
         else
         currScreenGui.ErrorFrame.Visible = false
         end
        end)
        
        guiService.UiMessageChanged:connect(function(type, newMessage)
         if type == Enum.UiMessageType.UiMessageInfo then
         local blackFrame = currScreenGui and currScreenGui:FindFirstChild('BlackFrame')
         if blackFrame then
         blackFrame.UiMessageFrame.UiMessage.Text = newMessage
         if newMessage ~= '' then
         blackFrame.UiMessageFrame.Visible = true
         else
         blackFrame.UiMessageFrame.Visible = false
         end
         end
         end
        end)
        
        if guiService:GetErrorMessage() ~= '' then
         currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
         currScreenGui.ErrorFrame.Visible = true
        end
        
        
        function stopListeningToRenderingStep()
         if renderSteppedConnection then
         renderSteppedConnection:disconnect()
         renderSteppedConnection = nil
         end
        end
        
        function fadeAndDestroyBlackFrame(blackFrame)
         if destroyingBackground then return end
         destroyingBackground = true
         task.spawn(function()
         local infoFrame = blackFrame:FindFirstChild("InfoFrame")
         local graphicsFrame = blackFrame:FindFirstChild("GraphicsFrame")
        
         local infoFrameChildren = infoFrame:GetChildren()
         local transparency = 0
         local rateChange = 1.8
         local lastUpdateTime = nil
        
         while transparency < 1 do
         if not lastUpdateTime then
         lastUpdateTime = tick()
         else
         local newTime = tick()
         transparency = transparency + rateChange * (newTime - lastUpdateTime)
         for i = 1, #infoFrameChildren do
         local child = infoFrameChildren[i]
         if child:IsA('TextLabel') then
         child.TextTransparency = transparency
         child.TextStrokeTransparency = transparency
         elseif child:IsA('ImageLabel') then
         child.ImageTransparency = transparency
         end
         end
         graphicsFrame.LoadingImage.ImageTransparency = transparency
         blackFrame.BackgroundTransparency = transparency
        
         if backgroundImageTransparency < 1 then
         backgroundImageTransparency = transparency
         local backgroundImages = blackFrame.BackgroundTextureFrame:GetChildren()
         for i = 1, #backgroundImages do
         backgroundImages[i].ImageTransparency = backgroundImageTransparency
         end
         end
        
         lastUpdateTime = newTime
         end
         wait()
         end
         if blackFrame ~= nil then
         stopListeningToRenderingStep()
         blackFrame:Destroy()
         end
         end)
        end
        
        function destroyLoadingElements(instant)
         if not currScreenGui then return end
         if destroyedLoadingGui then return end
         destroyedLoadingGui = true
        
         local guiChildren = currScreenGui:GetChildren()
         for i=1, #guiChildren do
         -- need to keep this around in case we get a connection error later
         if guiChildren[i].Name ~= "ErrorFrame" then
         if guiChildren[i].Name == "BlackFrame" and not instant then
         fadeAndDestroyBlackFrame(guiChildren[i])
         else
         guiChildren[i]:Destroy()
         end
         end
         end
        end
        
        function handleFinishedReplicating()
         hasReplicatedFirstElements = (#game:GetService("ReplicatedFirst"):GetChildren() > 0)
        
         if not hasReplicatedFirstElements then
         if game:IsLoaded() then
         handleRemoveDefaultLoadingGui()
         else
         local gameLoadedCon = nil
         gameLoadedCon = game.Loaded:connect(function()
         gameLoadedCon:disconnect()
         gameLoadedCon = nil
         handleRemoveDefaultLoadingGui()
         end)
         end
         else
         wait(5) -- make sure after 5 seconds we remove the default gui, even if the user doesn't
         handleRemoveDefaultLoadingGui()
         end
        end
        
        function handleRemoveDefaultLoadingGui(instant)
         if isTenFootInterface then
         ContextActionService:UnbindCoreAction('CancelGameLoad')
         end
         destroyLoadingElements(instant)
        end
        
        game:GetService("ReplicatedFirst").FinishedReplicating:connect(handleFinishedReplicating)
        if game:GetService("ReplicatedFirst"):IsFinishedReplicating() then
         handleFinishedReplicating()
        end
        
        game:GetService("ReplicatedFirst").RemoveDefaultLoadingGuiSignal:connect(handleRemoveDefaultLoadingGui)
        if game:GetService("ReplicatedFirst"):IsDefaultLoadingGuiRemoved() then
         handleRemoveDefaultLoadingGui()
        end
        
        local UserInputServiceChangedConn;
        local function onUserInputServiceChanged(prop)
         if prop == 'VREnabled' then
         local UseVr = false
         pcall(function() UseVr = UIS.VREnabled end)
        
         if UseVr then
         if UserInputServiceChangedConn then
         UserInputServiceChangedConn:disconnect()
         UserInputServiceChangedConn = nil
         end
         handleRemoveDefaultLoadingGui(true)
         require(RobloxGui.Modules.LoadingScreen3D)
         end
         end
        end
        
        UserInputServiceChangedConn = UIS.Changed:connect(onUserInputServiceChanged)
        onUserInputServiceChanged('VREnabled')
     end)
     
     task.spawn(function()
        -- Creates all neccessary scripts for the gui on initial load, everything except build tools
        -- Created by Ben T. 10/29/10
        -- Please note that these are loaded in a specific order to diminish errors/perceived load time by user
        
        local scriptContext = game:GetService("ScriptContext")
        local touchEnabled = game:GetService("UserInputService").TouchEnabled
        
        local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
        
        local soundFolder = Instance.new("Folder")
        soundFolder.Name = "Sounds"
        soundFolder.Parent = RobloxGui
        
        -- This can be useful in cases where a flag configuration issue causes requiring a CoreScript to fail
        local function safeRequire(moduleScript)
         local moduleReturnValue = nil
         local success, err = pcall(function() moduleReturnValue = require(moduleScript) end)
         if not success then
         warn("Failure to Start CoreScript module" ..moduleScript.Name.. ".\n" ..err)
         end
         return moduleReturnValue
        end
        
        --CUSTOM FUNCTION FOR SYNAPSE X
        function AddCoreScriptLocal(str)
            local Inject = [==[
                --Get names
                script.Name = script.Name..[[]==]..str..[==[]]
                --FAKE SCRIPT
                local script = Instance.new("LocalScript", game.CoreGui.RobloxGui)
                script.Name = [[CoreScripts/]==]..str..[==[]]
                script.Disabled = true
                script.Source = [[print("Doin' your mom")]]
                
            ]==]
            
            loadstring(Inject..tostring(RobloxGui.CoreScriptSyn[str].Source))()
        end
        
        -- TopBar
        task.spawn(function()
            AddCoreScriptLocal("Topbar")
        end)
        -- SettingsScript
        local luaControlsSuccess, luaControlsFlagValue = pcall(function() return settings():GetFFlag("UseLuaCameraAndControl") end)
        
        -- MainBotChatScript (the Lua part of Dialogs)
        task.spawn(function()
            AddCoreScriptLocal("MainBotChatScript2")
        end)
        
        -- In-game notifications script
        task.spawn(function()
            AddCoreScriptLocal("NotificationScript2")
        end)
        -- Performance Stats Management
        task.spawn(function()
            AddCoreScriptLocal("PerformanceStatsManagerScript")
        end)
        
        -- Chat script
        task.spawn(function() safeRequire(RobloxGui.Modules.ChatSelector) end)
        task.spawn(function() safeRequire(RobloxGui.Modules.PlayerlistModule) end)
        task.spawn(function()
            AddCoreScriptLocal("BubbleChat")
        end)
        -- Purchase Prompt Script (run both versions, they will check the relevant flag)
        task.spawn(function()
            AddCoreScriptLocal("PurchasePromptScript2")
        end)
        task.spawn(function()
            AddCoreScriptLocal("PurchasePromptScript3")
        end)
        
        -- Backpack!
        task.spawn(function() safeRequire(RobloxGui.Modules.BackpackScript) end)
        task.spawn(function()
            AddCoreScriptLocal("VehicleHud")
        end)
        task.spawn(function()
            AddCoreScriptLocal("GamepadMenu")
        end)
        if touchEnabled then -- touch devices don't use same control frame
         -- only used for touch device button generation
         task.spawn(function()
         AddCoreScriptLocal("ContextActionTouch")
            end)
         RobloxGui:WaitForChild("ControlFrame")
         RobloxGui.ControlFrame:WaitForChild("BottomLeftControl")
         RobloxGui.ControlFrame.BottomLeftControl.Visible = false
        end
        
        do
         local UserInputService = game:GetService('UserInputService')
         local function tryRequireVRKeyboard()
         if UserInputService.VREnabled then
         return safeRequire(RobloxGui.Modules.VR.VirtualKeyboard)
         end
         return nil
         end
         if not tryRequireVRKeyboard() then
         UserInputService.Changed:connect(function(prop)
         if prop == "VREnabled" then
         tryRequireVRKeyboard()
         end
         end)
         end
        end
        
        -- Boot up the VR App Shell
        if UserSettings().GameSettings:InStudioMode() then
         local UserInputService = game:GetService('UserInputService')
         local function onVREnabled(prop)
         if prop == "VREnabled" then
         if UserInputService.VREnabled then
         local shellInVRSuccess, shellInVRFlagValue = pcall(function() return settings():GetFFlag("EnabledAppShell3D") end)
         local shellInVR = (shellInVRSuccess and shellInVRFlagValue == true)
         local modulesFolder = RobloxGui.Modules
         local appHomeModule = modulesFolder:FindFirstChild('Shell') and modulesFolder:FindFirstChild('Shell'):FindFirstChild('AppHome')
         if shellInVR and appHomeModule then
         safeRequire(appHomeModule)
         end
         end
         end
         end
        
         task.spawn(function()
         if UserInputService.VREnabled then
         onVREnabled("VREnabled")
         end
         UserInputService.Changed:connect(onVREnabled)
         end)
        end
     end)
end})
Admin2.addCommand({name = "tfling",desc = "Enables tool fling",callback = function(bool)
    createNotif("Tool Fling Enabled, (may break sometimes)", CustomEnum.NotifcationType.Normal)
    local function velocity(part)
        if part:FindFirstChild('BodyPosition') then   
            if not part:FindFirstChild('BodyVelocity') then
            local bv = Instance.new('BodyVelocity', part)
            bv.Velocity = Vector3.new(-26,0,0)
            end
            part.Velocity = Vector3.new(25.70,0,0)
        end
    end
    
    local function addbody(part)
        task.spawn(function()
            local b = part
    
            local BodyPosition = Instance.new("BodyPosition", b)
            BodyPosition.MaxForce = Vector3.new(1/0,1/0,1/0)
            BodyPosition.P = 9e9
            BodyPosition.Position = part.Position
    
            local BodyGyro = Instance.new("BodyGyro", b)
            BodyGyro.MaxTorque = Vector3.new(1/0,1/0,1/0)
            BodyGyro.P = 9e9
            b.CanCollide = false
    
            b:BreakJoints()
            while true do 
                velocity(b)
                game:GetService("RunService").Heartbeat:wait()
            end
        end)
    end   
    
    local function getbody(part)
    if part:FindFirstChild('BodyPosition') then 
        return part:FindFirstChild('BodyPosition')
        end
    end  
    
    local function bringouttools()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
            if v:IsA('Tool') then 
                v.Parent = game.Players.LocalPlayer.Character
                addbody(v.Handle)
                v.Handle.BodyPosition.Position = v.Handle.Position + Vector3.new(5,0,0)
            end
        end
    end
    
    local function randomplayer()
        local output = {}
        local output2 = {}
        for i,v in pairs(game.Players:GetPlayers()) do 
            if v~=nil and v.Character and v ~= game.Players.LocalPlayer and v.Character:FindFirstChild('HumanoidRootPart') and v.Character:FindFirstChild('Humanoid') then 
                table.insert(output, v)
            end
        end
        if output ~= output2 then 
            return output[math.random(1,#output)].Character.HumanoidRootPart
        else
            return false
        end
    end
    
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
        if v:IsA('Tool') then 
            v.Parent = game.Players.LocalPlayer.Character
        end
    end
    
    task.wait(0.5)
    
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do 
        if v:IsA('Tool') then 
            v.Parent = game.Players.LocalPlayer.Backpack
        end
    end 
    task.wait(0.5)
    
    for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v.Name == "Right Arm" or v.Name == "RightHand" then
        v:Destroy()
    end
    task.wait()
        if v:IsA("Tool") then
            v.Handle.CanCollide = false
            task.wait()
        end
    end
    
    local plr = game.Players.LocalPlayer
    local chr = plr.Character
    local num = 0
    bringouttools()
    
    task.spawn(function()
        while true do
            for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("Tool") then
                    v.Handle.RotVelocity = Vector3.new(9e9,9e9,9e9)
                end
            end
            game:GetService("RunService").Heartbeat:wait()
        end
    end)
    
    
    task.spawn(function()
         while true do 
            for i,v in pairs(chr:GetChildren()) do 
                if v:IsA('Tool') and v:FindFirstChild('Handle') and v.Handle:FindFirstChild('BodyPosition') then 
                    velocity(v.Handle)
                end
            end
            game:GetService("RunService").Heartbeat:wait()
        end
    end)
    
    task.spawn(function()
        while true do
        if randomplayer() ~= false then 
            for i,v in pairs(chr:GetChildren()) do 
                if v:IsA('Tool') and v:FindFirstChild('Handle') and v.Handle:FindFirstChild('BodyPosition') then 
                    velocity(v.Handle)
                    local target = randomplayer()
                    local pos = (chr.HumanoidRootPart.Position-target.Position).Magnitude
                    if pos < 375 then 
                        getbody(v.Handle).Position = target.Position + Vector3.new(0,math.sin(num/10)) + target.Parent.Humanoid.MoveDirection
                        task.wait(.175)
                    end
                end
            end
            num += 1
            game:GetService("RunService").Heartbeat:wait()
            end
        end
    end)
end})
Admin2.addCommand({name = "void",desc = "Voids the target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            local LocalPlayer = game.Players.LocalPlayer
        local newHum = LocalPlayer.Character.Humanoid:Clone()
        newHum.Parent = LocalPlayer.Character
        LocalPlayer.Character.Humanoid:Destroy()
        for i,v in next, LocalPlayer.Backpack:GetChildren() do
            if v:IsA'Tool' then
                v.Parent = LocalPlayer.Character
            end
        end
        local tool = LocalPlayer.Character:FindFirstChildOfClass'Tool'
        local pos = LocalPlayer.Character.HumanoidRootPart.CFrame
        firetouchinterest(tool.Handle, v2.Character.Head, 0)
        task.wait()
        game.Workspace.Gravity = 5000000000000000000
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,400,0)
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-1000,0)
        game.Players.LocalPlayer.CharacterAdded:Wait()
        repeat task.wait() until LocalPlayer.Character
        game.Workspace.Gravity = 200
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end)
    end
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "lvoid",desc = "Rescales leg, then voids target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()

local Character = game.Players.LocalPlayer.Character
local LP = game:GetService('Players').LocalPlayer




for _, v in next, game:GetService("Players"):GetPlayers() do

		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,454,0)
        task.wait()

        game.Players.LocalPlayer.Character.Animate:Destroy()
local function delete()

    game.Players.LocalPlayer.Character.LeftFoot:WaitForChild'OriginalSize':Destroy()
    game.Players.LocalPlayer.Character.LeftLowerLeg:WaitForChild'OriginalSize':Destroy()
    game.Players.LocalPlayer.Character.LeftUpperLeg:WaitForChild'OriginalSize':Destroy()
end
game.Players.LocalPlayer.Character.LeftLowerLeg.LeftKneeRigAttachment.OriginalPosition:Destroy()
game.Players.LocalPlayer.Character.LeftUpperLeg.LeftKneeRigAttachment.OriginalPosition:Destroy()
game.Players.LocalPlayer.Character.LeftLowerLeg:WaitForChild'LeftKneeRigAttachment':Destroy()
game.Players.LocalPlayer.Character.LeftUpperLeg:WaitForChild'LeftKneeRigAttachment':Destroy()
for i,v in next, game.Players.LocalPlayer.Character.Humanoid:GetChildren() do
    if v:IsA'NumberValue' then
        delete()
        v:Destroy()
    end
end

        local LocalPlayer = game.Players.LocalPlayer
        local newHum = LocalPlayer.Character.Humanoid:Clone()
        newHum.Parent = LocalPlayer.Character
        game.Players.LocalPlayer.Character.Humanoid:Destroy()

for i,v in next, LocalPlayer.Backpack:GetChildren() do
    if v:IsA'Tool' then
        v.Parent = LocalPlayer.Character
    end
end

local tool = LocalPlayer.Character:FindFirstChildOfClass'Tool'
firetouchinterest(tool.Handle, v2.Character.Head, 0)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
firetouchinterest(tool.Handle, v2.Character.Head, math.huge)

end
        end)
    end
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "void2",desc = "Variation of Void",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            --this script was made by d2lusion
function getRoot(char)
    local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
    return rootPart
 end
 local player = game.Players.LocalPlayer
 local char = game.Players.LocalPlayer.Character
 local t = v2.Character
 local hum = char:FindFirstChildOfClass("Humanoid")
 local hrp = getRoot(char)
 local hrp2 = getRoot(t)
 hum.Name = "1"
 local newHum = hum:Clone()
 newHum.Parent = char
 newHum.Name = "Humanoid"
 wait()
 hum:Destroy()
 workspace.CurrentCamera.CameraSubject = char
 newHum.DisplayDistanceType = "None"
 local tool = player:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass("Tool") or char:FindFirstChildOfClass("Tool")
 tool.Parent = char
 hrp.CFrame = hrp2.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-100, 100)/200,math.random(-100, 100)/200,math.random(-100, 100)/200)
 local n = 0
 repeat
    wait(.1)
    n = n + 1
    hrp.CFrame = hrp2.CFrame
 until (tool.Parent ~= char or not hrp or not hrp2 or not hrp.Parent or not hrp2.Parent or n > 250) and n > 2
 repeat
        wait()
        hrp.CFrame = CFrame.new(9e9,9e9,9e9)
 until not getRoot(tchar) or not getRoot(char)
 createNotif("Voided Target!", CustomEnum.NotifcationType.Normal)
        end)
    end
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "vkill",desc = "Void kills the Target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            errorsound:Play()
    createNotif("This command is currently broken, please wait for a fix!", CustomEnum.NotifcationType.Error)
            workspace['FallenPartsDestroyHeight'] = 0/0
	LocalPlayer.Character.Humanoid:UnequipTools()
	local oldCF = LocalPlayer.Character.HumanoidRootPart.CFrame
	DeltaWait()
	LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,10000000,0)
	for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
	   if v:IsA'Tool' then
		  v.Parent = LocalPlayer.Character
	   end
	end
	wait(.5)
	for i,v in pairs(LocalPlayer.Character:GetChildren()) do
	   if v:IsA'Tool' and v ~= game.Players.LocalPlayer.Character:FindFirstChildOfClass'Tool' then
		  v.Parent = workspace
	   end
	end
	DeltaWait(.5)
	   LocalPlayer.Character.Humanoid:UnequipTools()
	   LocalPlayer.Character.HumanoidRootPart.CFrame = oldCF
	   DeltaWait()
	   Workspace.CurrentCamera.CameraSubject = LocalPlayer.Character
	   local newHum = LocalPlayer.Character.Humanoid:Clone()
	   newHum.Parent = LocalPlayer.Character
	   LocalPlayer.Character.Humanoid:Destroy()
	   newHum:ChangeState(15)
	   local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
	   local Player = game.Players:FindFirstChild(v2.Character)
	   tool.Parent = LocalPlayer.Character
	   DeltaWait(0)
	   firetouchinterest(tool.Handle, v2.Character['Head'],0)
	   firetouchinterest(tool.Handle, v2.Character['Head'],1)
	--    tool.AncestryChanged:Wait()
	--    wait(.1)
	--    Target.Character.Humanoid:ChangeState(15)
	   LocalPlayer.CharacterAdded:Wait()
	   wait(1)
	   LocalPlayer.Character:SetPrimaryPartCFrame(oldCF)
	   for i, v in pairs(workspace:GetChildren()) do
		  if v:IsA("Tool") then
			 local ti1 = v.Handle
			 firetouchinterest(LocalPlayer.Character['Head'],ti1 , 0)
		  end
	   end
            end)
        
    end
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "view",desc = "Views your lovely target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            workspace.CurrentCamera.CameraSubject = v2.Character.Humanoid
            end)
        
    end
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "commands",desc = "Opens list of Cmds",callback = function(v,b)
    mainFrame.Visible = true
    createNotif("Commands list is now showing!", CustomEnum.NotifcationType.Normal)
end})
Admin2.addCommand({name = "savegame",desc = "Saves the game with scripts",callback = function(v,b)
    createNotif("Saving game to workspace folder...", CustomEnum.NotifcationType.Normal)
    saveinstance()
end})
Admin2.addCommand({name = "savegamens",desc = "Saves the game without scripts",callback = function(v,b)
    createNotif("Saving game to workspace folder...", CustomEnum.NotifcationType.Normal)
    saveinstance({noscripts = false})
end})
Admin2.addCommand({name = "mdvoid",desc = "Rescales, then voids target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
game.Players.LocalPlayer.Character.Humanoid.Sit = false

for i,v in next, game.Players.LocalPlayer.Character.Humanoid:GetChildren() do
    if v:IsA'NumberValue' then
        delete()
        v:Destroy()
    end
end

local LocalPlayer = game.Players.LocalPlayer
local newHum = LocalPlayer.Character.Humanoid:Clone()
newHum.Parent = LocalPlayer.Character
LocalPlayer.Character.Humanoid:Destroy()
for i,v in next, LocalPlayer.Backpack:GetChildren() do
    if v:IsA'Tool' then
        v.Parent = LocalPlayer.Character
    end
end
local tool = LocalPlayer.Character:FindFirstChildOfClass'Tool'
firetouchinterest(tool.Handle, v2.Character.Head, 0)
local start
local connection = v2.Character.Humanoid.Died:Connect(function()
    start = tick()
    warn("Void successful! Took: " .. tick() - start)
end)
local save = {}
for i,v in next, workspace:GetChildren() do
    if v:IsA'Model' then
        if not game.Players:GetPlayerFromCharacter(v) then
            save[#save + 1] = v
        end
    else
        if v.ClassName == "Part" then
            save[#save + 1] = v
        end
    end
end
for i,v in next, save do
    v.Parent = game.Lighting
end
local BP = Instance.new("BodyPosition", game.Players.LocalPlayer.Character.HumanoidRootPart)
BP.Position = Vector3.new(0, -4500, 0)
BP.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
BP.P = 6000
game.Players.LocalPlayer.CharacterAdded:Wait()
game.Players.LocalPlayer.Character:WaitForChild'ForceField':Destroy()
game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = saveCF
connection:Disconnect()
for i,v in next, save do
    v.Parent = workspace
end
            end)
        
    end
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "fkill",desc = "Fast version of kill",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            local LocalPlayer = game.Players.LocalPlayer
            local ogChar = LocalPlayer.Character
            LocalPlayer.Character = Clone
            LocalPlayer.Character = ogChar
            task.wait(4.6)
            local newHum = LocalPlayer.Character.Humanoid:Clone()
            newHum.Parent = LocalPlayer.Character
            LocalPlayer.Character.Humanoid:Destroy()
            newHum:ChangeState(15)
            for i,v in next, LocalPlayer.Backpack:GetChildren() do
                if v:IsA'Tool' then
                    v.Parent = LocalPlayer.Character
                end
            end
            local pos = LocalPlayer.Character.HumanoidRootPart.CFrame
            local tool = LocalPlayer.Character:FindFirstChildOfClass'Tool'
            firetouchinterest(tool.Handle, v2.Character.Head, 0)
            tool.AncestryChanged:Wait()
            LocalPlayer.Character:BreakJoints()
            game.Players.LocalPlayer.CharacterAdded:Wait()
            tool:Destroy()
            repeat task.wait() until LocalPlayer.Character
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
            createNotif("Target was killed!", CustomEnum.NotifcationType.Normal)
        end)
    end
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "fling",desc = "Flings the target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            errorsound:Play()
    createNotif("This command is currently broken, please wait for a fix!", CustomEnum.NotifcationType.Error)
            
local Targets = v2.Character

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local OldFPDH = workspace.FallenPartsDestroyHeight

local function GetPlayer(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid.RootPart
    local OldPos
    
    local TCharacter = v2.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
    
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
    
    if Character and Humanoid and RootPart then
        OldPos = RootPart.CFrame
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        else
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        local function FPos(BasePart,Pos,Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            RootPart.Velocity = Vector3.new(9e8,9e8,9e8)
            RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
        end
        local function SFBasePart(BasePart)
            local TimeToWait = 3.5
            local Time = tick()
            local Angle = 0
            
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 30 then
                        Angle = Angle + 50
                        
                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(2.25,1.5,-2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(-2.25,-1.5,2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(0,1.5,0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                        
                        FPos(BasePart,CFrame.new(0,-1.5,0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))
                        game:GetService("RunService").Heartbeat:wait()
                    else
                        FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,-THumanoid.WalkSpeed),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(math.rad(-90),0,0))
                        game:GetService("RunService").Heartbeat:wait()

                        FPos(BasePart,CFrame.new(0,-1.5,0),CFrame.Angles(0,0,0))
                        game:GetService("RunService").Heartbeat:wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 1000 or BasePart.Parent ~= v2.Character or v2.Character.Parent ~= Players or not v2.Character.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        workspace.FallenPartsDestroyHeight = 0/0
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e9,9e9,9e9)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
        end
        BV:Destroy()
        for _,x in next, Character:GetDescendants() do
            if x:IsA("BasePart") then
                x.Velocity,x.RotVelocity = Vector3.new(),Vector3.new()
            end
        end
        Humanoid:ChangeState("GettingUp")
        RootPart.CFrame = OldPos * CFrame.new(0,.5,0)
        workspace.CurrentCamera.CameraSubject = Humanoid
        workspace.FallenPartsDestroyHeight = OldFPDH
    end
end

getgenv().Welcome = true
if v2.Character then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 67554151 and GetPlayer(x).UserId ~= 22359969 and GetPlayer(x).UserId ~= 770824 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error Occurred","This user is whitelisted! (Owner)",5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error Occurred","Username Invalid",5)
        createNotif("Flung target!", CustomEnum.NotifcationType.Normal)
    end
end
        end)
    end
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "netlag",desc = "Netlags the target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            while RunService.Stepped:wait() do
                if v2.Character then
                    for _, x in next, target.Character:GetDescendants() do
                        if x:IsA("BasePart") then
                            sethiddenproperty(x, "NetworkIsSleeping", true)
                            print("hi")
                        end
                    end
                end
            end
        end)
    end
    errorsound:Play()
    createNotif("This command is currently broken, please wait for a fix!", CustomEnum.NotifcationType.Error)
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "kick",desc = "Kicks (aka crashes) Target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            createNotif("Kick may likely fail the first few trys, a fix for this will come soon!", CustomEnum.NotifcationType.Normal)
            local Players = game:GetService("Players")
local Player = LocalPlayer
local Character = Player.Character

task.wait(.5)
for a,a in ipairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())do if a:IsA("Motor6D")and tostring(a)~="Neck"then local b=a.Parent;a:Destroy()b.CFrame=CFrame.new(9e9,math.random(100000,300000),9e9)task.wait()end;end
wait(15)
local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
        end)
    end
    createNotif("Kicked target!", CustomEnum.NotifcationType.Normal)
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})
Admin2.addCommand({name = "to",desc = "Teleports you to the target",callback = function(v,b)
    local t = Admin2.getplayers(v)
    for i,v2 in pairs(t) do
        pcall(function()
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v2.Character.HumanoidRootPart.Position+Vector3.new(0,0,3))
        end)
    end
    createNotif("Teleported to target!", CustomEnum.NotifcationType.Normal)
    if b then
        local m = Instance.new("Message",workspace)
        m.Text = "Cheese!"
        wait(1)
        m:Destroy()
    end
end})

--- Fly Keybind (X)

local mt = getrawmetatable(game)
local LocalPlayer = game.Players.LocalPlayer
local Character = game.Players.LocalPlayer.Character
local Workspace = game:GetService("Workspace")


local hum = game.Players.LocalPlayer.Character
local p = game:GetService("Players").LocalPlayer


--// functions

local speed = 100 -- not my fly script

local c
local h
local bv
local bav
local cam
local flying
local p = game.Players.LocalPlayer
local buttons = {
	W = false,
	S = false,
	A = false,
	D = false,
	Moving = false
}

local yesfly = function () 
	if not p.Character or not p.Character.Head or flying then
		return
	end
	
	c = p.Character
	h = c.Humanoid
	h.PlatformStand = true
	cam = workspace:WaitForChild('Camera')
	bv = Instance.new("BodyVelocity")
	bav = Instance.new("BodyAngularVelocity")
	bv.Velocity, bv.MaxForce, bv.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
	bav.AngularVelocity, bav.MaxTorque, bav.P = Vector3.new(0, 0, 0), Vector3.new(10000, 10000, 10000), 1000
	bv.Parent = c.Head
	bav.Parent = c.Head
	flying = true
	h.Died:connect(function()
		flying = false
	end)
end

local nofly = function () -- stop flying
	if not p.Character or not flying then
		return
	end
	h.PlatformStand = false
	bv:Destroy()
	bav:Destroy()
	flying = false
end

game:GetService("UserInputService").InputBegan:connect(function (input, GPE)
	if GPE then
		return
	end
	for i, e in pairs(buttons) do
		if i ~= "Moving" and input.KeyCode == Enum.KeyCode[i] then
			buttons[i] = true
			buttons.Moving = true
		end
	end
end)

function Encode(eid)

	local player = LocalPlayer['Name']
	local normalid = eid
	local reid = normalid
	
	local char_to_hex = function(c)
	return string.format("%%%02X", string.byte(c))
	end
	
	local function urlencode(url)
	if url == nil then
		return
	end 
	url = url:gsub("\n", "\r\n")
	url = url:gsub(".", char_to_hex)
	url = url:gsub(" ", "+")
	return url
	end
	function FixId(id)
		local dab = game:HttpGet("https://www.roblox.com/studio/plugins/info?assetId="..id)
		if string.find(dab, 'value="') then
			local epic = string.find(dab, 'value="')
			local almost = string.sub(dab, epic + 7, epic + 18)
			local filter1 = string.gsub(almost, " ", "")
			local filter2 = string.gsub(filter1, "/", "")
			local filter3 = string.gsub(filter2, ">", "")
			local filter4 = string.gsub(filter3, '"', "")
			local versionid = string.gsub(filter4, "<", "")
			return versionid
		end
	end
	local avidStr = "&assetversionid="
	local encid = FixId(reid)
	_G.song =avidStr .. encid


end

game:GetService("UserInputService").InputEnded:connect(function (input, GPE)
	if GPE then
		return
	end
	local a = false
	for i, e in pairs(buttons) do
		if i ~= "Moving" then
			if input.KeyCode == Enum.KeyCode[i] then
				buttons[i] = false
			end
			if buttons[i] then
				a = true
			end
		end
	end
	buttons.Moving = a
end)

local setVec = function (vec)
	return vec * (speed / vec.Magnitude)
end

game:GetService("RunService").Heartbeat:connect(function (step) -- fly function calling every frame
	if flying and c and c.PrimaryPart then
		local p = c.PrimaryPart.Position
		local cf = cam.CFrame
		local ax, ay, az = cf:toEulerAnglesXYZ()
		c:SetPrimaryPartCFrame(CFrame.new(p.x, p.y, p.z) * CFrame.Angles(ax, ay, az))
		if buttons.Moving then
			local t = Vector3.new()
			if buttons.W then
				t = t + (setVec(cf.lookVector))
			end
			if buttons.S then
				t = t - (setVec(cf.lookVector))
			end
			if buttons.A then
				t = t - (setVec(cf.rightVector))
			end
			if buttons.D then
				t = t + (setVec(cf.rightVector))
			end
			c:TranslateBy(t * step)
		end
	end
end)


local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Toggled = false
local Keybind = "x"

Mouse.KeyDown:Connect(function(Key)
	if Key == Keybind then
		if Toggled then
			Toggled = false
			nofly()
		else
			Toggled = true
			yesfly()
		end
	end
end)
---
-----------------------------------------------------------------------------
