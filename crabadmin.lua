if CRAB_LOADED and not _G.CRAB_DEBUG == true then
    return
end

pcall(function() getgenv().CRAB_LOADED = true end)

local cloneref = cloneref or function(o) return o end
COREGUI = cloneref(game:GetService("CoreGui"))
Players = cloneref(game:GetService("Players"))

if not game:IsLoaded() then
    local notLoaded = Instance.new("Message")
    notLoaded.Parent = COREGUI
    notLoaded.Text = "Crab Admin is waiting for the game to load"
    game.Loaded:Wait()
    notLoaded:Destroy()
end

currentVersion = "1.0.0"

-- Create UI Elements
ScaledHolder = Instance.new("Frame")
Scale = Instance.new("UIScale")
Holder = Instance.new("Frame")
Title = Instance.new("TextLabel")
Dark = Instance.new("Frame")
Cmdbar = Instance.new("TextBox")
CMDsF = Instance.new("ScrollingFrame")
cmdListLayout = Instance.new("UIListLayout")
SettingsButton = Instance.new("ImageButton")
ColorsButton = Instance.new("ImageButton")
Settings = Instance.new("Frame")
Prefix = Instance.new("TextLabel")
PrefixBox = Instance.new("TextBox")
Keybinds = Instance.new("TextLabel")
StayOpen = Instance.new("TextLabel")
Button = Instance.new("Frame")
On = Instance.new("TextButton")
Positions = Instance.new("TextLabel")
EventBind = Instance.new("TextLabel")
Plugins = Instance.new("TextLabel")
Example = Instance.new("TextButton")
Notification = Instance.new("Frame")
Title_2 = Instance.new("TextLabel")
Text_2 = Instance.new("TextLabel")
CloseButton = Instance.new("TextButton")
CloseImage = Instance.new("ImageLabel")
PinButton = Instance.new("TextButton")
PinImage = Instance.new("ImageLabel")
Tooltip = Instance.new("Frame")
Title_3 = Instance.new("TextLabel")
Description = Instance.new("TextLabel")
IntroBackground = Instance.new("Frame")
Logo = Instance.new("ImageLabel")
Credits = Instance.new("TextBox")

-- Define color themes
shade1 = {}
shade2 = {}
shade3 = {}
text1 = {}
text2 = {}
scroll = {}

-- Crab Theme Colors
crabRed = Color3.fromRGB(219, 75, 75)
crabOrange = Color3.fromRGB(238, 150, 75)
crabBlue = Color3.fromRGB(75, 150, 220)
crabDark = Color3.fromRGB(36, 36, 37)
crabMedium = Color3.fromRGB(46, 46, 47)
crabLight = Color3.fromRGB(78, 78, 79)

currentShade1 = crabDark
currentShade2 = crabMedium
currentShade3 = crabLight
currentText1 = Color3.new(1, 1, 1)
currentText2 = Color3.new(0, 0, 0)
currentScroll = crabLight

-- Setup UI
ScaledHolder.Name = "CrabAdmin"
ScaledHolder.Size = UDim2.fromScale(1, 1)
ScaledHolder.BackgroundTransparency = 1
ScaledHolder.Parent = PARENT

Scale.Name = "Scale"
Scale.Parent = ScaledHolder

Holder.Name = "MainHolder"
Holder.Parent = ScaledHolder
Holder.Active = true
Holder.BackgroundColor3 = crabMedium
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(1, -250, 1, -220)
Holder.Size = UDim2.new(0, 250, 0, 220)
Holder.ZIndex = 10
table.insert(shade2, Holder)

Title.Name = "Title"
Title.Parent = Holder
Title.Active = true
Title.BackgroundColor3 = crabDark
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 250, 0, 20)
Title.Font = Enum.Font.SourceSans
Title.TextSize = 18
Title.Text = "Crab Admin v" .. currentVersion
Title.TextColor3 = crabRed
Title.ZIndex = 10
table.insert(shade1, Title)
table.insert(text1, Title)

Dark.Name = "Dark"
Dark.Parent = Holder
Dark.Active = true
Dark.BackgroundColor3 = crabDark
Dark.BorderSizePixel = 0
Dark.Position = UDim2.new(0, 0, 0, 45)
Dark.Size = UDim2.new(0, 250, 0, 175)
Dark.ZIndex = 10
table.insert(shade1, Dark)

Cmdbar.Name = "Cmdbar"
Cmdbar.Parent = Holder
Cmdbar.BackgroundTransparency = 1
Cmdbar.BorderSizePixel = 0
Cmdbar.Position = UDim2.new(0, 5, 0, 20)
Cmdbar.Size = UDim2.new(0, 240, 0, 25)
Cmdbar.Font = Enum.Font.SourceSans
Cmdbar.TextSize = 18
Cmdbar.TextXAlignment = Enum.TextXAlignment.Left
Cmdbar.TextColor3 = Color3.new(1, 1, 1)
Cmdbar.Text = ""
Cmdbar.ZIndex = 10
Cmdbar.PlaceholderText = "Command Bar"

CMDsF.Name = "CMDs"
CMDsF.Parent = Holder
CMDsF.BackgroundTransparency = 1
CMDsF.BorderSizePixel = 0
CMDsF.Position = UDim2.new(0, 5, 0, 45)
CMDsF.Size = UDim2.new(0, 245, 0, 175)
CMDsF.ScrollBarImageColor3 = crabLight
CMDsF.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
CMDsF.CanvasSize = UDim2.new(0, 0, 0, 0)
CMDsF.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
CMDsF.ScrollBarThickness = 8
CMDsF.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
CMDsF.VerticalScrollBarInset = 'Always'
CMDsF.ZIndex = 10
table.insert(scroll, CMDsF)

cmdListLayout.Parent = CMDsF

-- Create notification system
function notify(title, text, time)
    local time = time or 5
    local addPos = #notifications * 80
    
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Parent = ScaledHolder
    notification.BackgroundColor3 = crabDark
    notification.BorderSizePixel = 0
    notification.Position = UDim2.new(1, -260, 1, -70 - addPos)
    notification.Size = UDim2.new(0, 250, 0, 70)
    notification.ZIndex = 10
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Parent = notification
    titleLabel.BackgroundColor3 = crabMedium
    titleLabel.BorderSizePixel = 0
    titleLabel.Size = UDim2.new(1, 0, 0, 20)
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.TextSize = 14
    titleLabel.Text = title
    titleLabel.TextColor3 = crabRed
    titleLabel.ZIndex = 10
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Text"
    textLabel.Parent = notification
    textLabel.BackgroundTransparency = 1
    textLabel.BorderSizePixel = 0
    textLabel.Position = UDim2.new(0, 5, 0, 25)
    textLabel.Size = UDim2.new(1, -10, 0, 40)
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextSize = 14
    textLabel.Text = text
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextWrapped = true
    textLabel.ZIndex = 10
    
    table.insert(notifications, notification)
    
    game:GetService("TweenService"):Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -260, 1, -70 - addPos)}):Play()
    
    delay(time, function()
        table.remove(notifications, table.find(notifications, notification))
        
        -- Adjust other notifications
        for i,v in pairs(notifications) do
            game:GetService("TweenService"):Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -260, 1, -70 - (i-1)*80)}):Play()
        end
        
        game:GetService("TweenService"):Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, 260, 1, notification.Position.Y.Offset)}):Play()
        wait(0.5)
        notification:Destroy()
    end)
end

notifications = {}

-- Create intro GUI
IntroBackground.Name = "IntroBackground"
IntroBackground.Parent = Holder
IntroBackground.Active = true
IntroBackground.BackgroundColor3 = crabDark
IntroBackground.BorderSizePixel = 0
IntroBackground.Position = UDim2.new(0, 0, 0, 45)
IntroBackground.Size = UDim2.new(0, 250, 0, 175)
IntroBackground.ZIndex = 10

Logo.Name = "Logo"
Logo.Parent = Holder
Logo.BackgroundTransparency = 1
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0, 125, 0, 127)
Logo.Size = UDim2.new(0, 10, 0, 10)
Logo.Image = "rbxassetid://6587457747" -- Crab image ID
Logo.ImageTransparency = 0
Logo.ZIndex = 10

Credits.Name = "Credits"
Credits.Parent = Holder
Credits.BackgroundTransparency = 1
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0, 0, 0.9, 30)
Credits.Size = UDim2.new(0, 250, 0, 20)
Credits.Font = Enum.Font.SourceSansLight
Credits.FontSize = Enum.FontSize.Size18
Credits.Text = "Created by CrabTeam"
Credits.TextColor3 = Color3.new(1, 1, 1)
Credits.ZIndex = 10

-- Initialize services
TextService = cloneref(game:GetService("TextService"))
UserInputService = cloneref(game:GetService("UserInputService"))
TweenService = cloneref(game:GetService("TweenService"))
HttpService = cloneref(game:GetService("HttpService"))
MarketplaceService = cloneref(game:GetService("MarketplaceService"))
RunService = cloneref(game:GetService("RunService"))
TeleportService = cloneref(game:GetService("TeleportService"))
StarterGui = cloneref(game:GetService("StarterGui"))
GuiService = cloneref(game:GetService("GuiService"))
Lighting = cloneref(game:GetService("Lighting"))
ContextActionService = cloneref(game:GetService("ContextActionService"))
NetworkClient = cloneref(game:GetService("NetworkClient"))
ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
GroupService = cloneref(game:GetService("GroupService"))
PathService = cloneref(game:GetService("PathfindingService"))
SoundService = cloneref(game:GetService("SoundService"))
Teams = cloneref(game:GetService("Teams"))
StarterPlayer = cloneref(game:GetService("StarterPlayer"))
InsertService = cloneref(game:GetService("InsertService"))
ChatService = cloneref(game:GetService("Chat"))
ProximityPromptService = cloneref(game:GetService("ProximityPromptService"))
StatsService = cloneref(game:GetService("Stats"))
MaterialService = cloneref(game:GetService("MaterialService"))

-- Helper functions
function getRoot(char)
    local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
    return rootPart
end

function getPlayer(plr, speaker)
    if plr == "me" then return {speaker.Name} end
    
    local players = {}
    local playerNames = Players:GetPlayers()
    
    for i,v in pairs(playerNames) do
        if v.Name:lower():sub(1, #plr) == plr:lower() or v.DisplayName:lower():sub(1, #plr) == plr:lower() then
            table.insert(players, v.Name)
        end
    end
    
    return players
end

-- Command System
local Commands = {}
local EventBinds = {}
local Aliases = {}
local Prefix = ";"

function addcmd(name, alias, func, plgn)
    Commands[#Commands + 1] = {
        NAME = name,
        ALIAS = alias or {},
        FUNC = func,
        PLUGIN = plgn
    }
end

function findCmd(cmd_name)
    for i,v in pairs(Commands) do
        if v.NAME:lower() == cmd_name:lower() or table.find(v.ALIAS, cmd_name:lower()) then
            return v
        end
    end
    return nil
end

function execCmd(cmdStr, speaker)
    cmdStr = cmdStr:gsub("%s+", " ")
    local cmdArgs = {}
    
    for arg in cmdStr:gmatch("[^%s]+") do
        table.insert(cmdArgs, arg)
    end
    
    local cmdName = cmdArgs[1]
    if cmdName == "commands" or cmdName == "cmds" then
        notify("Commands", "Total commands: " .. #Commands, 5)
        return
    end
    
    table.remove(cmdArgs, 1)
    
    local cmd = findCmd(cmdName)
    if cmd then
        pcall(function() cmd.FUNC(cmdArgs, speaker) end)
    else
        notify("Command Error", "Command " .. cmdName .. " not found!", 5)
    end
end

-- Setup command input system
Cmdbar.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        execCmd(Cmdbar.Text, Players.LocalPlayer)
        Cmdbar.Text = ""
    end
end)

-- Create introduction animation
task.spawn(function()
    wait()
    Credits:TweenPosition(UDim2.new(0, 0, 0.9, 0), "Out", "Quart", 0.2)
    Logo:TweenSizeAndPosition(UDim2.new(0, 175, 0, 175), UDim2.new(0, 37, 0, 45), "Out", "Quart", 0.3)
    wait(1)
    local OutInfo = TweenInfo.new(1.6809, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
    TweenService:Create(Logo, OutInfo, {ImageTransparency = 1}):Play()
    TweenService:Create(IntroBackground, OutInfo, {BackgroundTransparency = 1}):Play()
    Credits:TweenPosition(UDim2.new(0, 0, 0.9, 30), "Out", "Quart", 0.2)
    wait(0.2)
    Logo:Destroy()
    Credits:Destroy()
    IntroBackground:Destroy()
    
    -- Display welcome message
    notify("Crab Admin", "Welcome to Crab Admin! Type " .. Prefix .. "cmds to see all commands.", 5)
end)

-- Basic Commands
addcmd('print',{'echo'},function(args, speaker)
    local msg = table.concat(args, " ")
    print(msg)
    notify("Print", msg, 3)
end)

addcmd('cmds',{'commands'},function(args, speaker)
    local cmdsList = ""
    local count = 0
    
    for i,v in pairs(Commands) do
        count = count + 1
        cmdsList = cmdsList .. v.NAME .. ", "
        
        -- Split into multiple notifications if too many commands
        if count % 20 == 0 then
            notify("Commands " .. math.floor(count / 20), cmdsList, 5)
            cmdsList = ""
        end
    end
    
    if cmdsList ~= "" then
        notify("Commands", "Total: " .. #Commands .. "\n" .. cmdsList, 5)
    end
end)

addcmd('kill',{},function(args, speaker)
    if args[1] then
        local target = getPlayer(args[1], speaker)
        for i,v in pairs(target) do
            local player = Players[v]
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 0
                notify("Crab Admin", "Killed " .. player.Name, 3)
            end
        end
    else
        notify("Crab Admin", "Please specify a player to kill", 3)
    end
end)

addcmd('respawn',{'re'},function(args, speaker)
    if speaker.Character then
        speaker.Character:BreakJoints()
        notify("Crab Admin", "Respawned character", 3)
    end
end)

addcmd('jump',{},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        notify("Crab Admin", "Character jumped", 3)
    end
end)

addcmd('sit',{},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        speaker.Character.Humanoid.Sit = true
        notify("Crab Admin", "Character sitting", 3)
    end
end)

addcmd('unsit',{'stand'},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        speaker.Character.Humanoid.Sit = false
        notify("Crab Admin", "Character standing", 3)
    end
end)

addcmd('goto',{'to'},function(args, speaker)
    if args[1] then
        local target = getPlayer(args[1], speaker)
        for i,v in pairs(target) do
            local player = Players[v]
            if player and player ~= speaker and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
                speaker.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                notify("Crab Admin", "Teleported to " .. player.Name, 3)
            end
        end
    else
        notify("Crab Admin", "Please specify a player to teleport to", 3)
    end
end)

-- Advanced Movement Commands
addcmd('fly',{},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        local humanoid = speaker.Character:FindFirstChild("Humanoid")
        local torso = getRoot(speaker.Character)
        if torso then
            local Float = Instance.new("BodyVelocity")
            Float.Parent = torso
            Float.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            Float.Velocity = Vector3.new(0, 0, 0)
            
            notify("Crab Admin", "Fly enabled - Use WASD to move", 3)
            
            local control = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            local lastControl = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            local maxSpeed = 50
            
            local bg = Instance.new("BodyGyro", torso)
            bg.P = 9e4
            bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            bg.cframe = torso.CFrame
            
            local bv = Instance.new("BodyVelocity", torso)
            bv.velocity = Vector3.new(0,0,0)
            bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
            
            humanoid.PlatformStand = true
            
            while true do
                if not speaker.Character or not speaker.Character:FindFirstChild("Humanoid") then break end
                humanoid.PlatformStand = true
                
                -- Get movement inputs
                if control.L + control.R ~= 0 or control.F + control.B ~= 0 or control.Q + control.E ~= 0 then
                    bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (control.F - control.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(control.L - control.R, (control.F - control.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * maxSpeed
                    lastControl = {F = control.F, B = control.B, L = control.L, R = control.R, Q = control.Q, E = control.E}
                elseif (control.L + control.R) == 0 and (control.F + control.B) == 0 and (control.Q + control.E) == 0 and speed ~= 0 then
                    bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lastControl.F - lastControl.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastControl.L - lastControl.R, (lastControl.F - lastControl.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * maxSpeed
                else
                    bv.velocity = Vector3.new(0, 0, 0)
                end
                
                bg.cframe = workspace.CurrentCamera.CoordinateFrame
                
                wait(0.1)
            end
            
            -- Cleanup
            control = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            lastControl = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            speed = 0
            bg:Destroy()
            bv:Destroy()
            humanoid.PlatformStand = false
        end
    end
end)

addcmd('unfly',{'nofly'},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        local humanoid = speaker.Character:FindFirstChild("Humanoid")
        local torso = getRoot(speaker.Character)
        if torso then
            for i,v in pairs(torso:GetChildren()) do
                if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then
                    v:Destroy()
                end
            end
            humanoid.PlatformStand = false
            notify("Crab Admin", "Fly disabled", 3)
        end
    end
end)

-- Crab-themed commands
addcmd('crabwalk',{},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        local humanoid = speaker.Character:FindFirstChild("Humanoid")
        local crabWalkSpeed = tonumber(args[1]) or 16
        
        humanoid.WalkSpeed = crabWalkSpeed
        
        -- Adjust character animation
        for i,v in pairs(speaker.Character:GetChildren()) do
            if v:IsA("Animator") then
                v:Destroy()
            end
        end
        
        notify("Crab Admin", "Now walking like a crab at speed " .. crabWalkSpeed, 3)
        
        -- Create side-to-side movement effect
        local walkConnection
        walkConnection = RunService.Heartbeat:Connect(function()
            if not speaker.Character or not speaker.Character:FindFirstChild("Humanoid") then
                walkConnection:Disconnect()
                return
            end
            
            local torso = getRoot(speaker.Character)
            if torso and humanoid.MoveDirection.Magnitude > 0 then
                local moveDir = humanoid.MoveDirection
                local lookVector = torso.CFrame.LookVector
                local rightVector = torso.CFrame.RightVector
                
                -- Make the character move sideways relative to the direction they're facing
                local dot = moveDir:Dot(lookVector)
                if math.abs(dot) > 0.5 then
                    humanoid:Move(rightVector * (dot > 0 and 1 or -1))
                end
            end
        end)
    end
end)

addcmd('uncrabwalk',{'nocrabwalk'},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        local humanoid = speaker.Character:FindFirstChild("Humanoid")
        humanoid.WalkSpeed = 16
        notify("Crab Admin", "Returned to normal walking", 3)
    end
end)

addcmd('crabrave',{},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        local humanoid = speaker.Character:FindFirstChild("Humanoid")
        local torso = getRoot(speaker.Character)
        
        if torso then
            -- Play crab rave music
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://5410080484" -- Crab Rave music ID
            sound.Volume = 1
            sound.Looped = true
            sound.Parent = torso
            sound:Play()
            
            -- Create dance effect
            local danceConnection
            danceConnection = RunService.Heartbeat:Connect(function()
                if not speaker.Character or not speaker.Character:FindFirstChild("Humanoid") then
                    sound:Destroy()
                    danceConnection:Disconnect()
                    return
                end
                
                torso.CFrame = torso.CFrame * CFrame.Angles(0, math.sin(tick() * 2) * 0.1, 0)
                
                for i,v in pairs(speaker.Character:GetChildren()) do
                    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                        v.CFrame = v.CFrame * CFrame.Angles(math.sin(tick() * 4) * 0.03, 0, math.cos(tick() * 4) * 0.03)
                    end
                end
            end)
            
            notify("Crab Admin", "CRAB RAVE ACTIVATED! Use ;uncrabrave to stop", 5)
            
            -- Create a cleanup command
            addcmd('uncrabrave',{'stoprave'},function(args, speaker)
                if danceConnection then
                    danceConnection:Disconnect()
                    danceConnection = nil
                end
                
                if sound and sound.Parent then
                    sound:Destroy()
                end
                
                notify("Crab Admin", "Crab rave stopped", 3)
            end)
        end
    end
end)

addcmd('crabcolor',{'crabcolour'},function(args, speaker)
    if speaker.Character then
        local r = tonumber(args[1]) or 255
        local g = tonumber(args[2]) or 100
        local b = tonumber(args[3]) or 100
        
        for i,v in pairs(speaker.Character:GetChildren()) do
            if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                v.Color = Color3.fromRGB(r, g, b)
            end
            if v:IsA("Accessory") and v:FindFirstChild("Handle") then
                v.Handle.Color = Color3.fromRGB(r, g, b)
            end
        end
        
        notify("Crab Admin", "Character color changed to crab-like color", 3)
    end
end)

addcmd('crabify',{},function(args, speaker)
    if speaker.Character then
        -- Make character crab-colored
        execCmd("crabcolor 255 100 100", speaker)
        
        -- Make character walk like a crab
        execCmd("crabwalk", speaker)
        
        -- Generate crab claws (using meshes if possible)
        local leftArm = speaker.Character:FindFirstChild("Left Arm") or speaker.Character:FindFirstChild("LeftHand")
        local rightArm = speaker.Character:FindFirstChild("Right Arm") or speaker.Character:FindFirstChild("RightHand")
        
        if leftArm and rightArm then
            -- Make arms bigger like claws
            leftArm.Size = leftArm.Size * 1.5
            rightArm.Size = rightArm.Size * 1.5
            
            -- Adjust arm colors to be more claw-like
            leftArm.Color = Color3.fromRGB(255, 50, 50)
            rightArm.Color = Color3.fromRGB(255, 50, 50)
        end
        
        notify("Crab Admin", "You are now a crab! 🦀", 5)
    end
end)

-- Utility Commands
addcmd('speed',{'walkspeed','ws'},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        local speed = tonumber(args[1]) or 16
        speaker.Character.Humanoid.WalkSpeed = speed
        notify("Crab Admin", "Walk speed set to " .. speed, 3)
    end
end)

addcmd('jumppower',{'jp'},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        local power = tonumber(args[1]) or 50
        speaker.Character.Humanoid.JumpPower = power
        notify("Crab Admin", "Jump power set to " .. power, 3)
    end
end)

addcmd('hipheight',{'hh'},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        local height = tonumber(args[1]) or 0
        speaker.Character.Humanoid.HipHeight = height
        notify("Crab Admin", "Hip height set to " .. height, 3)
    end
end)

addcmd('teleport',{'tp'},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
        local x, y, z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
        if x and y and z then
            speaker.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
            notify("Crab Admin", "Teleported to coordinates", 3)
        else
            notify("Crab Admin", "Invalid coordinates. Use: ;teleport x y z", 3)
        end
    end
end)

addcmd('bring',{},function(args, speaker)
    if args[1] and speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart") then
        local target = getPlayer(args[1], speaker)
        for i,v in pairs(target) do
            local player = Players[v]
            if player and player ~= speaker and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = speaker.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                notify("Crab Admin", "Brought " .. player.Name, 3)
            end
        end
    else
        notify("Crab Admin", "Please specify a player to bring", 3)
    end
end)

-- Visual Commands
addcmd('day',{},function(args, speaker)
    Lighting.TimeOfDay = "12:00:00"
    notify("Crab Admin", "Time set to day", 3)
end)

addcmd('night',{},function(args, speaker)
    Lighting.TimeOfDay = "00:00:00"
    notify("Crab Admin", "Time set to night", 3)
end)

addcmd('nofaces',{'removefaces'},function(args, speaker)
    for i,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Decal") and v.Name == "face" then
            v:Destroy()
        end
    end
    notify("Crab Admin", "Removed all faces", 3)
end)

addcmd('btools',{},function(args, speaker)
    local Backpack = speaker:FindFirstChildOfClass("Backpack")
    if Backpack then
        local models = {"Move", "Clone", "Delete"}
        
        for i,v in pairs(models) do
            local tool = Instance.new("HopperBin")
            tool.Name = v
            tool.BinType = i
            tool.Parent = Backpack
        end
        
        notify("Crab Admin", "Gave building tools", 3)
    end
end)

-- Fun Commands
addcmd('spin',{},function(args, speaker)
    if speaker.Character and getRoot(speaker.Character) then
        local root = getRoot(speaker.Character)
        local spinSpeed = tonumber(args[1]) or 5
        
        local Spin = Instance.new("BodyAngularVelocity")
        Spin.Name = "CrabSpin"
        Spin.Parent = root
        Spin.MaxTorque = Vector3.new(0, math.huge, 0)
        Spin.AngularVelocity = Vector3.new(0, spinSpeed, 0)
        
        notify("Crab Admin", "Spinning at speed " .. spinSpeed, 3)
    end
end)

addcmd('unspin',{'nospin'},function(args, speaker)
    if speaker.Character and getRoot(speaker.Character) then
        local root = getRoot(speaker.Character)
        for i,v in pairs(root:GetChildren()) do
            if v.Name == "CrabSpin" and v:IsA("BodyAngularVelocity") then
                v:Destroy()
            end
        end
        notify("Crab Admin", "Stopped spinning", 3)
    end
end)

addcmd('fling',{},function(args, speaker)
    if args[1] and speaker.Character and getRoot(speaker.Character) then
        local target = getPlayer(args[1], speaker)
        for i,v in pairs(target) do
            local player = Players[v]
            if player and player.Character and getRoot(player.Character) then
                local targetRoot = getRoot(player.Character)
                
                -- Create powerful collision
                local oldPos = getRoot(speaker.Character).CFrame
                
                local vel = Instance.new("BodyVelocity")
                vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                vel.P = math.huge
                vel.Velocity = Vector3.new(0, 0, 0)
                vel.Parent = getRoot(speaker.Character)
                
                for i = 1, 5 do
                    getRoot(speaker.Character).CFrame = targetRoot.CFrame
                    wait(0.1)
                end
                
                vel:Destroy()
                getRoot(speaker.Character).CFrame = oldPos
                
                notify("Crab Admin", "Flung " .. player.Name, 3)
            end
        end
    else
        notify("Crab Admin", "Please specify a player to fling", 3)
    end
end)

addcmd('noclip',{},function(args, speaker)
    if speaker.Character then
        notify("Crab Admin", "Noclip enabled", 3)
        
        local noclipLoop
        noclipLoop = RunService.Stepped:Connect(function()
            if speaker.Character then
                for i,v in pairs(speaker.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                noclipLoop:Disconnect()
            end
        end)
        
        -- Create a cleanup command
        addcmd('clip',{'unnoclip'},function(args, speaker)
            if noclipLoop then
                noclipLoop:Disconnect()
                noclipLoop = nil
            end
            
            if speaker.Character then
                for i,v in pairs(speaker.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name ~= "HumanoidRootPart" then
                        v.CanCollide = true
                    end
                end
            end
            
            notify("Crab Admin", "Noclip disabled", 3)
        end)
    end
end)

addcmd('view',{'spectate'},function(args, speaker)
    if args[1] then
        local target = getPlayer(args[1], speaker)
        for i,v in pairs(target) do
            local player = Players[v]
            if player and player ~= speaker and player.Character and player.Character:FindFirstChild("Humanoid") then
                workspace.CurrentCamera.CameraSubject = player.Character.Humanoid
                notify("Crab Admin", "Now viewing " .. player.Name, 3)
            end
        end
    else
        notify("Crab Admin", "Please specify a player to view", 3)
    end
end)

addcmd('unview',{'unspectate'},function(args, speaker)
    if speaker.Character and speaker.Character:FindFirstChild("Humanoid") then
        workspace.CurrentCamera.CameraSubject = speaker.Character.Humanoid
        notify("Crab Admin", "Stopped viewing", 3)
    end
end)

addcmd('esp',{},function(args, speaker)
    local espLoop
    espLoop = RunService.RenderStepped:Connect(function()
        for i,v in pairs(Players:GetPlayers()) do
            if v ~= speaker and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and not v.Character:FindFirstChild("CrabESP") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "CrabESP"
                highlight.FillColor = crabRed
                highlight.OutlineColor = crabOrange
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = v.Character
            end
        end
    end)
    
    notify("Crab Admin", "ESP enabled", 3)
    
    -- Create a cleanup command
    addcmd('unesp',{'noesp'},function(args, speaker)
        if espLoop then
            espLoop:Disconnect()
            espLoop = nil
        end
        
        for i,v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("CrabESP") then
                v.Character.CrabESP:Destroy()
            end
        end
        
        notify("Crab Admin", "ESP disabled", 3)
    end)
end)

-- Admin Commands
addcmd('explorer',{},function(args, speaker)
    notify("Crab Admin", "Attempting to load Dex Explorer...", 3)
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
end)

addcmd('version',{'ver'},function(args, speaker)
    notify("Crab Admin", "Running Crab Admin v" .. currentVersion, 5)
end)

addcmd('prefix',{},function(args, speaker)
    if args[1] and #args[1] == 1 then
        Prefix = args[1]
        notify("Crab Admin", "Prefix changed to '" .. Prefix .. "'", 3)
    else
        notify("Crab Admin", "Invalid prefix. Must be a single character.", 3)
    end
end)

-- Main execution
PARENT = nil
if get_hidden_gui or gethui then
    local hiddenUI = get_hidden_gui or gethui
    local Main = Instance.new("ScreenGui")
    Main.Name = "CrabAdmin"
    Main.Parent = hiddenUI()
    PARENT = Main
elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
    local Main = Instance.new("ScreenGui")
    Main.Name = "CrabAdmin"
    syn.protect_gui(Main)
    Main.Parent = COREGUI
    PARENT = Main
elseif COREGUI:FindFirstChild("RobloxGui") then
    PARENT = COREGUI.RobloxGui
else
    local Main = Instance.new("ScreenGui")
    Main.Name = "CrabAdmin"
    Main.Parent = COREGUI
    PARENT = Main
end

-- Setup CMD-bar keybind
local cmdbarKeybind = ";"
local cmdPressed = false

UserInputService.InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.Semicolon then
        cmdPressed = true
        Cmdbar:CaptureFocus()
    end
end)

UserInputService.InputEnded:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.Semicolon then
        cmdPressed = false
    end
end)

-- Start up
ScaledHolder.Parent = PARENT
wait(1)
notify("Crab Admin", "Loaded Crab Admin v" .. currentVersion, 5) 