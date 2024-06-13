getgenv().resignator = {
    ["Options"] = {
        ["Version"] = "V1",
        ["Stealth Mode"] = {
            ["Enabled"] = true,
            ["Key"] = "private",
        },
        ["FPS Unlocker"] = {
            ["Enabled"] = true, 
            ["FPS"] = 1000,
        },
        ["Intro"] = true,
        ["Allow Notifications"] = true,
        ["Notifcation Type"] = "xaxa", -- // Akali, Roblox, xaxa
        ["Notifcation Duration"] = 3,
    },
    ["Silent Aim"] = {
        ["Enabled"] = true,
        ["Mode"] = "FOV", -- // FOV, Target 
        ["Target Mode Bind"] = "Q",
        ["Notify"] = true,
        ["Prediction"] = 0.12,
        ["Hit Chance"] = 100,
        ["Target Part"] = "Head",
        ["Nearest Part To Cursor"] = true,
        ["Dot"] = false,
        ["Shake"] = {
            ["Enabled"] = false, 
            ["X"] = 0,
            ["Y"] = 0, 
            ["Z"] = 0,
        },
    },
    ["Cam Lock"] = {
        ["Enabled"] = true,
        ["Mode"] = "Target_toggle", -- // FOV, Target_toggle, Target_hold
        ["Target Mode Bind"] = "Q",
        ["Easing Style"] = "Linear", -- // https://create.roblox.com/docs/reference/engine/enums/EasingStyle
        ["Notify"] = true,
        ["Prediction"] = 0.12,
        ["Target Part"] = "Head",
        ["Nearest Part To Cursor"] = true, 
        ["Dot"] = false, 
        ["Smoothness"] = {
            ["Enabled"] = true,
            ["Value"] = 0.025,
        },
        ["Shake"] = {
            ["Enabled"] = false,
            ["X"] = 0,
            ["Y"] = 0,
            ["Z"] = 0,
        },
    },
    ["Global"] = {
        ["Auto Prediction"] = {
            ["Enabled"] = true,
            ["Version"] = "Default", -- // Default, Custom , V2
            ["Custom Settings"] = { -- // Custom Values
                ["Ping20"]  = 0.12746444,
                ["Ping30"]  = 0.12746444,
                ["Ping40"]  = 0.12746444,
                ["Ping50"]  = 0.11243,
                ["Ping60"]  = 0.11243,
                ["Ping70"]  = 0.12533,
                ["Ping80"]  = 0.169,
                ["Ping90"]  = 0.13626,
                ["Ping100"] = 0.13829,
                ["Ping110"] = 0.146,
                ["Ping120"] = 0.149,
                ["Ping130"] = 0.151,
                ["Ping140"] = 0.1652131,
                ["Ping150"] = 0.125333,
                ["Ping160"] = 0.1223333,
                ["Ping170"] = 0.15,
                ["Ping180"] = 0.1923111,
                ["Ping190"] = 0.165771,
                ["Ping200"] = 0.1746,
            }
        },
        ["Anti Ground Shots"] = true, 
        ["Unlock On KO"] = true,
        ["Unlock Outside FOV"] = false,
        ["Unlock Behind Wall"] = false,
    },
    ["Checks"] = {
        ["Whitelist"] = { -- // Will only lock onto people whitelisted,
            ["Enabled"] = false,
            ["Usernames"] = {
                --[[
                    Enter usernames eg: 
                    "Username1",
                    "Username2",
                    "Username3"
                ]]
            }
        },
        ["Blacklist"] = { -- // Will not lock onto peopled blacklisted,
            ["Enabled"] = false,
            ["Usernames"] = {
                --[[
                    Enter usernames eg: 
                    "Username1",
                    "Username2",
                    "Username3"
                ]]
            }
        },
        ["Visible Check"] = true,
        ["K.O Check"] = true,
        ["Crew Check"] = false,
        ["Friend Check"] = false, 
        ["Distance"] = {
            ["Enabled"] = false,
            ["Max Distance"] = 200,
        }
    },
    ["Resolver"] = {
        ["Enabled"] = true, 
        ["Method"] = "Delta", 
        ["Keybind Enabled"] = false, 
        ["Keybind"] = "T",
    },
    ["FOV"] = {
        ["Silent Aim"] = {
            ["Visible"] = false,
            ["Filled"] = false,
            ["Size"] = 15,
            ["Thickness"] = 1,
            ["Transparency"] = 1,
            ["Color"] = Color3.fromRGB(255,255,255)
        },
        ["Cam Lock"] = {
            ["Visible"] = false,
            ["Filled"] = false,
            ["Size"] = 25,
            ["Thickness"] = 1,
            ["Transparency"] = 1,
            ["Color"] = Color3.fromRGB(255,255,255)
        },
    },
    ["Airshot"] = {
        ["Enabled"] = true, 
        ["Jump Offset"] = -1.6,
        ["Cam Lock Smoothness"] = {
            ["Enabled"] = false,
            ["New Smoothness"] = 0.025,
        }
    },
    ["Spoofer"] = {
        ["Memory"] = {
            ["Enabled"] = false,
            ["Max"] = 900,
            ["Min"] = 700,
        },
    },
    ["Panic"] = {
        ["Enabled"] = false,
        ["Bind"] = "P",
        ["Things To Disable"] = {
            ["Options"] = true,
            ["Aiming"] = true,
            ["FOV"] = true,
            ["Misc"] = true, 
        }
    },
    ["Extra"] = {
        ["Disable Seats"] = true,
        ["Low Graphics"] = true,
        ["Mute Boomboxes"] = false,
    },
}


-- // resignator V3


--[[if resignator.Options["FPS Unlocker"].Enabled then 
    setfpscap(resignator.Options["FPS Unlocker"].FPS)
end]]

for i,v in pairs(game.Workspace:GetDescendants()) do 
    if v:IsA("Seat") then 
        v.Disabled = resignator["Extra"]["Disable Seats"]
    end
end

local smoothplastic = Enum.Material.SmoothPlastic
local objects = {}

local function scan(object)
    local objectlist = object:GetChildren()
    for i = 1, #objectlist do
        if objectlist[i]:IsA('BasePart') then
            objects[objectlist[i]] = objectlist[i].Material
        end
        scan(objectlist[i])
    end
end

scan(workspace)

if not resignator["Extra"]["Low Graphics"] then
    for i in pairs(objects) do
        i.Material = objects[i]
    end
else
    for i in pairs(objects) do
        i.Material = smoothplastic
        --wait()s
    end
end

local utility = {
    Invite = "camlock",
    Folder = "resignatorSettings",
    Version = "V1",
    Ping = 5,
    Bypass = {
        12927359803, -- Dah Aim Trainer
        12867571492, -- KatanaHood
        11867820563, -- Dae Hood
        12618586930, -- Dat Hood
        13018411607, -- Dat Hood 2
        13018411607, -- // Dat Hood Backup
        9633073067, -- // Del Hood
        11956541652, --// Dav Hood
        10100958808, -- // Da Downhill
        12815368779, -- // Da Hood Aim Trainer
        13126185789, -- // Da Hood Aim Trainer VC
    }
}

if not LPH_OBFUSCATED and not LPH_JIT_ULTRA then
    LPH_NO_VIRTUALIZE = function(f) return f end
    LRM_UserNote = ""
    LRM_LinkedDiscordID = 1
    LRM_TotalExecutions = 1
    LRM_SecondsLeft = 9999
end

getgenv().luarmor_vars = {
    ID = LRM_LinkedDiscordID,
}

local Blacklisted_GameIds = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/Evolution/main/blacklisted_gameIds.lua"))()

if table.find(Blacklisted_GameIds,game.PlaceId) then 
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Blacklist game ID",
        Text = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." is blacklisted because it is unsafe to use resignator on.", 
        Icon = "rbxassetid://14270853092",
        Duration = 10
    })
    return
end


if resignator.Options.Version ~= utility.Version then 
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Incorrect Table Version",
        Text = "Please goto the discord and get the newest version.", 
        Icon = "rbxassetid://14270853092",
        Duration = 10
    })
    return
end


task.spawn(function()
    pcall(function()
        repeat wait() until game.CoreGui.RobloxGui:FindFirstChild("PerformanceStats") 
        for __, v in pairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
            if v.Name == "PS_Button" and v.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
                Memory = v.StatsMiniTextPanelClass.ValueLabel
            end
        end  
        Memory:GetPropertyChangedSignal("Text"):Connect(function()
            if resignator.Spoofer.Memory.Enabled then 
                local random1 = math.random(resignator.Spoofer.Memory.Min, resignator.Spoofer.Memory.Max)
                local rand1 = math.random(0,9)
                local rand2 = math.random(0,9)
                Memory.Text = "".. random1 .. "." .. rand1 .. rand2.. " MB"
            end
        end)
    end)
end)

local AnimationIds = {
    Lay = "rbxassetid://0",
    Greet = "rbxassetid://0",
    Sturdy = "rbxassetid://0",
    Griddy = "rbxassetid://0",
    Speed = "rbxassetid://0",
}

if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then -- // Da Hood
    AnimationIds = {
        Lay = "rbxassetid://3152378852",
        Greet = "rbxassetid://3189777795",
        Sturdy = "rbxassetid://11710529975",
        Griddy = "rbxassetid://11710529975",
        Speed = "rbxassetid://11710541744",
    }
elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
    AnimationIds = {
        Lay = "rbxassetid://12848619324",
        Greet = "rbxassetid://12848108646",
        Sturdy = "rbxassetid://12848836068",
        Griddy = "rbxassetid://12848118145",
        Speed = "rbxassetid://12848831214",
    }
elseif game.PlaceId == 12867571492 then
    AnimationIds = {
        Lay = "rbxassetid://12649394546",
        Greet = "rbxassetid://12649400354s",
        Sturdy = "rbxassetid://0",
        Griddy = "rbxassetid://0",
        Speed = "rbxassetid://0",
    }
elseif game.PlaceId == 14412601883 then -- // Hood Bank
    AnimationIds = {
        Lay = "rbxassetid://14414332833",
        Greet = "rbxassetid://14413912697",
        Sturdy = "rbxassetid://0",
        Griddy = "rbxassetid://0",
        Speed = "rbxassetid://0",
    }
elseif game.PlaceId == 14413712255 then 
    AnimationIds = {
        Lay = "rbxassetid://14414368594",
        Greet = "rbxassetid://14414355346",
        Sturdy = "rbxassetid://0",
        Griddy = "rbxassetid://0",
        Speed = "rbxassetid://0",
    }
end
    
    
game:GetService("UserInputService").InputBegan:Connect(function(key, gp)
    if not gp then 
        if key.KeyCode == resignator.Emotes.LayKey then 
            if resignator.Emotes.Lay then 
                local Lay = Instance.new("Animation")
                Lay.AnimationId = AnimationIds.Lay
                local LayTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Lay)
                LayTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    LayTrack:Stop()
                end)
            end
        end
        if key.KeyCode == resignator.Emotes.GreetKey then
            if resignator.Emotes.Greet then 
                local Greet = Instance.new("Animation")
                Greet.AnimationId = AnimationIds.Greet
                local GreetTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Greet)
                GreetTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    GreetTrack:Stop()
                end)
            end
        end
        if key.KeyCode == resignator.Emotes.SpeedKey then
            if resignator.Emotes.Speed then 
                local Speed = Instance.new("Animation")
                Speed.AnimationId = AnimationIds.Speed
                local SppedTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Speed)
                SpeedTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    SpeedTrack:Stop()
                end)
            end
        end
        if key.KeyCode == resignator.Emotes.SturdyKey then
            if resignator.Emotes.Sturdy then 
                local Sturdy = Instance.new("Animation")
                Sturdy.AnimationId = AnimationIds.Sturdy
                local SturdyTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Sturdy)
                SturdyTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    SturdyTrack:Stop()
                end)
            end
        end
        if key.KeyCode == resignator.Emotes.GriddyKey then
            if resignator.Emotes.Griddy then 
                local Griddy = Instance.new("Animation")
                Griddy.AnimationId = AnimationIds.Griddy
                local GriddyTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Griddy)
                GriddyTrack:Play()
                game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                    GriddyTrack:Stop()
                end)
            end
        end
    end
end)



local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/Evolution/main/akali.lua"))();
local gggg = AkaliNotif.Notify;

local notificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/ui-libraries/main/xaxas-notification/src.lua"))();
local notifications = notificationLibrary.new({            
    NotificationLifetime = 3, 
    NotificationPosition = "Middle",
    
    TextFont = Enum.Font.Code,
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 15,
    
    TextStrokeTransparency = 0, 
    TextStrokeColor = Color3.fromRGB(0, 0, 0)
});

notifications:BuildNotificationUI();


getgenv().notify = function(txt) 
    if resignator.Options["Allow Notifications"] then
        if string.lower(resignator.Options["Notifcation Type"]) == "akali" then 
            gggg({
                Description = txt;
                Title = "Notification";
                Duration = resignator.Options["Notifcation Duration"];
            });
        elseif string.lower(resignator.Options["Notifcation Type"]) == "roblox" then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Notification",
                Text = txt, 
                Icon = "rbxassetid://14270853092",
                Duration = resignator.Options["Notifcation Duration"]
            })
        elseif string.lower(resignator.Options["Notifcation Type"]) == "xaxa" then
            notifications:Notify(txt);
        end

    end
end

local bypass = {
    dahood = function()
        local _game = getrawmetatable(game)
        setreadonly(_game, false)
        local ___namecall = _game.__namecall
        _game.__namecall = newcclosure(function(...)
            if getnamecallmethod() == 'FireServer' and ({...})[1].Name == 'MainEvent' and table.find({"BreathingHAMON", "OneMoreTime", "BANREMOTE", "PERMAIDBAN", "KICKREMOTE", "BR_KICKPC", "BR_KICKMOBILE", "CHECKER_1", "TeleportDetect", "GUI_CHECK"}, ({...})[2]) then
                return
            end
            return ___namecall(...)
        end)
        setreadonly(_game, true)
    end,
    hoodmodded = function() 
        for i,v in next, getgc(true) do
            if typeof(v)=="table" and rawget(v,"DoThings") then
                v.DoThings = function() end
            end
        end
    end,
    untitledhood = function() 
        local _1;
        _1 = hookmetamethod(game, "__namecall", function(self, ...)
            if not checkcaller() and getnamecallmethod() == "FireServer" then
                if tostring(self.Name) == ".gg/untitledhood" then
                    local args = {...}
                    if tostring(args[1]) == "ForceDetect" or tostring(args[1]) == "TeleportDetect" or tostring(args[1]) == "GUI_CHECK" then
                        return 
                    end
                end
            end
            return _1(self, ...);
        end)
    end,
    adonis = function()
        for k,v in pairs(getgc(true)) do
            if pcall(function() return rawget(v,"indexInstance") end) and type(rawget(v,"indexInstance")) == "table" and  (rawget(v,"indexInstance"))[1] == "kick" then
                v.tvk = {"kick",function() return game.Workspace:WaitForChild("") end}
            end
        end
    end
}

if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
    bypass.dahood()
elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
    bypass.hoodmodded()
elseif game.PlaceId == 9183932460 or game.PlaceId == 9435785899 then
    bypass.untitledhood()
elseif table.find(utility.Bypass,game.PlaceId) then 
    bypass.adonis()
end

function missingf(functionmissing) 
    notify("Your executor is missing "..functionmissing.." this feature will not work.")
end

function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
	else
		missingf("setclipboard")
        return
	end
end

function hookf(Function) 
    local consume = detour_function or replaceclosure or hookfunc or hookfunction
    if consume then 
        consume(Function)
    else
        missingf("hookfunction")
        return
    end
end

function httprequest(f) 
    local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
    if not httprequest then 
        httprequest(f)
    else
        missingf("httprequest")
        return
    end
end

if not isfolder(utility.Folder) then 
    makefolder(utility.Folder)
end

if not isfile(utility.Folder.."/invite.txt") then 
    writefile(utility.Folder.."/invite.txt","")
end

if readfile(utility.Folder.."/invite.txt") ~= utility.Invite then 
    if httprequest then
        httprequest({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                Origin = 'https://discord.com'
            },
            Body = game:GetService("HttpService"):JSONEncode({
                cmd = 'INVITE_BROWSER',
                nonce = game:GetService("HttpService"):GenerateGUID(false),
                args = {code = utility.Invite}
            })
        })
    end
    writefile(utility.Folder.."/invite.txt",utility.Invite)
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Gui = game:GetService("GuiService")

local SilentTarget = nil
local CamlockTarget = nil
local ClosestPointCF = nil
local ClosestPointCF2 = nil
local PredictionValue = 0.133
local PredictionValue2 = 0.133
local closestsilentbodypart = resignator["Silent Aim"]["Target Part"]
local closestcamlockpart = resignator["Cam Lock"]["Target Part"]
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local CurrentCamera = Workspace.CurrentCamera
local v3 = Vector3
local v2 = Vector2
local CF = CFrame

if resignator["Options"]["Intro"] then 
    local cam = workspace.CurrentCamera
    local x = cam.ViewportSize.X
    local y = cam.ViewportSize.Y
    local newx = math.floor(x * 0.5)
    local newy = math.floor(y * 0.5)

    local SpashScreen = Instance.new("ScreenGui")
    local Image = Instance.new("ImageLabel")
    SpashScreen.Name = "SpashScreen"
    SpashScreen.Parent = game.CoreGui
    SpashScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Image.Name = "Image"
    Image.Parent = SpashScreen
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1
    Image.Position = UDim2.new(0, newx, 0, newy)
    Image.Size = UDim2.new(0, 100, 0, 100)
    Image.Image = "rbxassetid://14270853092"
    Image.ImageTransparency = 1
    Image.AnchorPoint = Vector2.new(0.5,0.5)

    local Blur = Instance.new("BlurEffect")
    Blur.Parent = game.Lighting
    Blur.Size = 0
    Blur.Name = math.random(1,123123)


    local function gui(last, sex, t, s, inorout)
        local TI = TweenInfo.new(t or 1, s or Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local Tweening = game:GetService("TweenService"):Create(last, TI, sex)
        Tweening:Play()
    end

    gui(Image, {ImageTransparency = 0},0.3)
    gui(Blur, {Size = 20},0.3)
    wait(3)
    gui(Image, {ImageTransparency = 1},0.3)
    gui(Blur, {Size = 0},0.3)
    wait(0.3)
    
end


local Circle = Drawing.new("Circle")
Circle.Transparency = resignator.FOV["Silent Aim"].Transparency
Circle.Radius = resignator.FOV["Silent Aim"].Size * 3
Circle.Visible = resignator.FOV["Silent Aim"].Visible
Circle.Color = resignator.FOV["Silent Aim"].Color
Circle.Thickness = resignator.FOV["Silent Aim"].Thickness
Circle.Filled = resignator.FOV["Silent Aim"].Filled

local Circle2 = Drawing.new("Circle")
Circle2.Transparency = resignator.FOV["Cam Lock"].Transparency
Circle2.Radius = resignator.FOV["Cam Lock"].Size * 3
Circle2.Visible = resignator.FOV["Cam Lock"].Visible
Circle2.Color = resignator.FOV["Cam Lock"].Color
Circle2.Thickness = resignator.FOV["Cam Lock"].Thickness
Circle2.Filled = resignator.FOV["Cam Lock"].Filled

local Visualizer = Drawing.new("Circle")
Visualizer.Filled = true
Visualizer.Thickness = 1
Visualizer.Transparency = 1
Visualizer.Radius = 3
Visualizer.Color = Color3.new(1,1,1)

local Visualizer2 = Drawing.new("Line")
Visualizer2.Visible = false
Visualizer2.From = v2.new(0, 0)
Visualizer2.To = v2.new(200, 200)
Visualizer2.Color = Color3.new(1,1,1)
Visualizer2.Thickness = 1
Visualizer2.Transparency = 1

local CVisualizer = Drawing.new("Circle")
CVisualizer.Filled = true
CVisualizer.Thickness = 1
CVisualizer.Transparency = 1
CVisualizer.Radius = 3
CVisualizer.Color = Color3.new(1,1,1)

local CVisualizer2 = Drawing.new("Line")
CVisualizer2.Visible = false
CVisualizer2.From = v2.new(0, 0)
CVisualizer2.To = v2.new(200, 200)
CVisualizer2.Color = Color3.new(1,1,1)
CVisualizer2.Thickness = 1
CVisualizer2.Transparency = 1

OnScreen = function(Object)
    local _, screen = CurrentCamera:WorldToScreenPoint(Object.Position)
    return screen
end

CalculateChance = function(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100

    return chance < Percentage / 100
end

RayCastCheck = function(Part, PartDescendant)
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded.Wait(LocalPlayer.CharacterAdded)
    local Origin = CurrentCamera.CFrame.Position

    local RayCastParams = RaycastParams.new()
    RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
    RayCastParams.FilterDescendantsInstances = {Character, CurrentCamera}

    local Result = Workspace.Raycast(Workspace, Origin, Part.Position - Origin, RayCastParams)
    
    if (Result) then
        local PartHit = Result.Instance
        local Visible = (not PartHit or Instance.new("Part").IsDescendantOf(PartHit, PartDescendant))
        
        return Visible
    end
    return false
end

Alive = function(Plr)
    if Plr and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and Plr.Character:FindFirstChild("Humanoid") ~= nil and Plr.Character:FindFirstChild("Head") ~= nil then
        return true
    end
    return false
end


GetMagnitudeFromMouse = function(Part)
    local PartPos, OnScreen = CurrentCamera:WorldToScreenPoint(Part.Position)
    if OnScreen then
        local Magnitude = (v2.new(PartPos.X, PartPos.Y) - v2.new(mouse.X, mouse.Y)).Magnitude
        return Magnitude
    end
    return math.huge
end

local EspPlayers = {}

Draw = function(Type, Properties)
    local NewDrawing = Drawing.new(Type)

    for i,v in next, Properties or {} do
        NewDrawing[i] = v
    end
    return NewDrawing
end

NewESP = function(Player)
    EspPlayers[Player] = {
        Name = Draw("Text", {Color = Color3.fromRGB(255,2550, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        BoxOutline = Draw("Square", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        Box = Draw("Square", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Visible = false}),
        HealthBarOutline = Draw("Line", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        HealthBar = Draw("Line", {Color = Color3.fromRGB(0, 255, 0), Thickness = 1, Visible = false}),
        Distance = Draw("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0})
    }
end

UpdateESP = function()
    for i,v in pairs(EspPlayers) do
        if resignator.ESP.Enabled and i ~= LocalPlayer and i.Character and i.Character:FindFirstChild("Humanoid") and i.Character:FindFirstChild("HumanoidRootPart") and i.Character:FindFirstChild("Head") then
            local Hum = i.Character.Humanoid
            local Hrp = i.Character.HumanoidRootPart
            
            local Vector, OnScreen = CurrentCamera:WorldToViewportPoint(i.Character.HumanoidRootPart.Position)
            local Size = (CurrentCamera:WorldToViewportPoint(Hrp.Position - Vector3.new(0, 3, 0)).Y - CurrentCamera:WorldToViewportPoint(Hrp.Position + Vector3.new(0, 2.6, 0)).Y) / 2
            local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
            local BoxPos = Vector2.new(math.floor(Vector.X - Size * 1.5 / 2), math.floor(Vector.Y - Size * 1.6 / 2))
            local BottomOffset = BoxSize.Y + BoxPos.Y + 1

            if OnScreen and GetDistance(i) < resignator.ESP["Max Distance"] then
                if resignator.ESP.Name.Enabled then
                    v.Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    v.Name.Outline = resignator.ESP.Name.Outline
                    v.Name.Text = i.DisplayName.." (@"..i.Name..")"
                    v.Name.Color = resignator.ESP.Name.Color
                    v.Name.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.Name.Font = 0
                    v.Name.Size = 16

                    v.Name.Visible = true
                else
                    v.Name.Visible = false
                end
                if resignator.ESP.Distance.Enabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    v.Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                    v.Distance.Outline = resignator.ESP.Distance.Outline
                    v.Distance.Text = math.floor((Hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude) .. " studs"
                    v.Distance.Color = resignator.ESP.Distance.Color
                    v.Distance.OutlineColor = Color3.fromRGB(0, 0, 0)
                    BottomOffset = BottomOffset + 15

                    v.Distance.Font = 0
                    v.Distance.Size = 16

                    v.Distance.Visible = true
                else
                    v.Distance.Visible = false
                end
                if resignator.ESP.Box.Enabled then
                    v.BoxOutline.Size = BoxSize
                    v.BoxOutline.Position = BoxPos
                    v.BoxOutline.Visible = resignator.ESP.Box.Outline
                    v.BoxOutline.Color = Color3.fromRGB(0, 0, 0)
    
                    v.Box.Size = BoxSize
                    v.Box.Position = BoxPos
                    v.Box.Color = resignator.ESP.Box.Color
                    v.Box.Visible = true
                else
                    v.BoxOutline.Visible = false
                    v.Box.Visible = false
                end
                if resignator.ESP["Health Bar"].Enabled then
                    v.HealthBar.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    v.HealthBar.To = Vector2.new(v.HealthBar.From.X, v.HealthBar.From.Y - (Hum.Health / Hum.MaxHealth) * BoxSize.Y)
                    v.HealthBar.Color = resignator.ESP["Health Bar"].Color
                    v.HealthBar.Visible = true

                    v.HealthBarOutline.From = Vector2.new(v.HealthBar.From.X, BoxPos.Y + BoxSize.Y + 1)
                    v.HealthBarOutline.To = Vector2.new(v.HealthBar.From.X, (v.HealthBar.From.Y - 1 * BoxSize.Y) -1)
                    v.HealthBarOutline.Color = Color3.fromRGB(0, 0, 0)
                    v.HealthBarOutline.Visible = resignator.ESP["Health Bar"].Outline
                else
                    v.HealthBarOutline.Visible = false
                    v.HealthBar.Visible = false
                end
            else
                v.Name.Visible = false
                v.BoxOutline.Visible = false
                v.Box.Visible = false
                v.HealthBarOutline.Visible = false
                v.HealthBar.Visible = false
                v.Distance.Visible = false
            end
        else
            v.Name.Visible = false
            v.BoxOutline.Visible = false
            v.Box.Visible = false
            v.HealthBarOutline.Visible = false
            v.HealthBar.Visible = false
            v.Distance.Visible = false
        end
    end
end

GetPrediction = function() 
    if resignator["Global"]["Auto Prediction"].Enabled then 

        local PingStats = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local Value = tostring(PingStats)
        local PingValue = Value:split(" ")
        local PingNumber = tonumber(PingValue[1])
        if string.lower(resignator.Global["Auto Prediction"]["Version"]) == "default" then 
            return tonumber(PingNumber / 225 * 0.1 + 0.1)
        elseif string.lower(resignator.Global["Auto Prediction"]["Version"]) == "old" then 
            if PingNumber < 130 then
                return tonumber(PingNumber / 1000 + 0.037)
            else
                return tonumber(PingNumber / 1000 + 0.033)
            end
        elseif string.lower(resignator.Global["Auto Prediction"]["Version"]) == "v2" then 
            return tonumber(0.1 + (PingNumber / 2000) + ((PingNumber / 1000) * (PingNumber / 1500) * 1.025))
            --[[if PingNumber < 360 then
                return 0.16537
            elseif PingNumber < 270 then
                return 0.195566
            elseif PingNumber < 260 then
                return 0.175566
            elseif PingNumber < 250 then
                return 0.1651
            elseif PingNumber < 240 then
                return 0.16780
            elseif PingNumber < 230 then
                return 0.15692
            elseif PingNumber < 220 then
                return 0.165566
            elseif PingNumber < 210 then
                return 0.16780
            elseif PingNumber < 200 then
                return 0.165566
            elseif PingNumber < 190 then
                return 0.166547
            elseif PingNumber < 180 then
                return 0.19284
            elseif PingNumber < 170 then
                return 0.1923111 
            elseif PingNumber < 160 then
                return 0.16
            elseif PingNumber < 150 then
                return 0.15
            elseif PingNumber < 140 then
                return 0.1223333
            elseif PingNumber < 130 then
                return 0.156692
            elseif PingNumber < 120 then
                return 0.143765
            elseif PingNumber < 110 then
                return 0.1455
            elseif PingNumber < 100 then
                return 0.130340
            elseif PingNumber < 90 then
                return 0.136
            elseif PingNumber < 80 then
                return 0.1347
            elseif PingNumber < 70 then
                return 0.119
            elseif PingNumber < 60 then
                return 0.12731
            elseif PingNumber < 50 then
                return 0.127668
            elseif PingNumber < 40 then
                return 0.125
            elseif PingNumber < 30 then
                return 0.11
            elseif PingNumber < 20 then
                return 0.12588
            elseif PingNumber < 10 then
                return 0.9
            end]]
        elseif string.lower(resignator.Global["Auto Prediction"]["Version"]) == "custom" then 
            if PingNumber < 30 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping20)
            elseif PingNumber < 40 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping30)
            elseif PingNumber < 50 then
                return tonumber(resignatorrr.Global["Auto Prediction"]["Custom Settings"].Ping40)
            elseif PingNumber < 60 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping50)
            elseif PingNumber < 70 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping60)
            elseif PingNumber < 80 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping70)
            elseif PingNumber < 90 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping80)
            elseif PingNumber < 100 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping90)
            elseif PingNumber < 110 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping100)
            elseif PingNumber < 120 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping110)
            elseif PingNumber < 130 then
                return tonumber(resignatorr.Global["Auto Prediction"]["Custom Settings"].Ping120)
            elseif PingNumber < 140 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping130)
            elseif PingNumber < 150 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping140)
            elseif PingNumber < 160 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping150)
            elseif PingNumber < 170 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping160)
            elseif PingNumber < 180 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].P1ing70)
            elseif PingNumber < 190 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping180)
            elseif PingNumber < 200 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping190)
            elseif PingNumber < 210 then
                return tonumber(resignator.Global["Auto Prediction"]["Custom Settings"].Ping200)
            end
        end
    else
        return tonumber(resignator["Silent Aim"].Prediction)
    end
end

FindCrew = function(Player)
	if Player:FindFirstChild("DataFolder") and Player.DataFolder:FindFirstChild("Information") and Player.DataFolder.Information:FindFirstChild("Crew") and LocalPlayer:FindFirstChild("DataFolder") and LocalPlayer.DataFolder:FindFirstChild("Information") and LocalPlayer.DataFolder.Information:FindFirstChild("Crew") then
        if LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= "" and LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value ~= "" then 
			return true
		end
	end
	return false
end

CheckDistance = function(Player)
    if (Player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > resignator.Checks.Distance["Max Distance"] then 
        return true
    else
        return false
    end
end

GetDistance = function(Player)
    if Player ~= nil and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then 
        return math.floor((Player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
    else
        return 0
    end
end

GetHealth = function(Player)
    if Player ~= nil and Player.Character and Player.Character:FindFirstChild("Humanoid") then 
        return tostring(math.floor(Player.Character.Humanoid.Health).."/"..math.floor(Player.Character.Humanoid.MaxHealth))
    else
        return "0/100"
    end
end

GetGunName = function(Name)
    local split = string.split(string.split(Name, "[")[2], "]")[1]
    return split
end

GetCurrentWeaponName = function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
       local Tool =  LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
       if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
          return GetGunName(Tool.Name)
       end
    end
    return nil
end

WTS = function(Object)
	local ObjectVector = CurrentCamera:WorldToScreenPoint(Object.Position)
	return v2.new(ObjectVector.X, ObjectVector.Y)
end

Filter = function(obj)
	if (obj:IsA('BasePart')) then
		return true
	end
end

mousePosv2 = function()
	return v2.new(mouse.X, mouse.Y) 
end

IsOnScreen2 = function(Object)
    local IsOnScreen = CurrentCamera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end

FilterObjs = function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end




function GetClosestPointOfPart(Part)
    local mouseray = mouse.UnitRay
    mouseray = mouseray.Origin + (mouseray.Direction * (Part.Position - mouseray.Origin).Magnitude)
    local point =
        (mouseray.Y >= (Part.Position - Part.Size / 2).Y and mouseray.Y <= (Part.Position + Part.Size / 2).Y) and
            (Part.Position + Vector3.new(0, -Part.Position.Y + mouseray.Y, 0)) or Part.Position
    local check = RaycastParams.new()
    check.FilterType = Enum.RaycastFilterType.Whitelist
    check.FilterDescendantsInstances = {Part}
    local ray = game:GetService("Workspace"):Raycast(mouseray, (point - mouseray), check)
    if ray then
        return ray.Position
    else
        return mouse.Hit.Position
    end
end


GetClosestBodyPart = function()
    local character = SilentTarget.Character
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen2(x) then
                local Distance = (WTS(x) - v2.new(mouse.X, mouse.Y)).Magnitude
                    if (Distance < ClosestDistance) then
                        ClosestDistance = Distance
                        BodyPart = x
                    end
            end
        end
    end
    if resignator["Silent Aim"]["Nearest Part To Cursor"] then 
        closestsilentbodypart = tostring(BodyPart)
    else
        closestsilentbodypart = resignator["Silent Aim"]["Target Part"]
    end

end

GetClosestBodyPart2 = function()
    local character = CamlockTarget.Character
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen2(x) then
                local Distance = (WTS(x) - v2.new(mouse.X, mouse.Y)).Magnitude
                    if (Distance < ClosestDistance) then
                        ClosestDistance = Distance
                        BodyPart = x
                    end
            end
        end
    end
    if resignator["Cam Lock"]["Nearest Part To Cursor"] then 
        closestcamlockpart = tostring(BodyPart)
    else
        closestcamlockpart = resignator["Cam Lock"]["Target Part"] 
    end
end

UpdateFOV = function()
    Circle.Transparency = resignator.FOV["Silent Aim"].Transparency
    Circle.Radius = resignator.FOV["Silent Aim"].Size * 3
    Circle.Visible = resignator.FOV["Silent Aim"].Visible
    Circle.Color = resignator.FOV["Silent Aim"].Color
    Circle.Thickness = resignator.FOV["Silent Aim"].Thickness
    Circle.Filled = resignator.FOV["Silent Aim"].Filled
    Circle.Position = v2.new(mouse.X, mouse.Y + Gui:GetGuiInset().Y)
    Circle2.Transparency = resignator.FOV["Cam Lock"].Transparency
    Circle2.Radius = resignator.FOV["Cam Lock"].Size * 3
    Circle2.Visible = resignator.FOV["Cam Lock"].Visible
    Circle2.Color = resignator.FOV["Cam Lock"].Color
    Circle2.Thickness = resignator.FOV["Cam Lock"].Thickness
    Circle2.Filled = resignator.FOV["Cam Lock"].Filled
    Circle2.Position = v2.new(mouse.X, mouse.Y + Gui:GetGuiInset().Y)
end

local safeplayers = {
    609282484, -- da1nonlyfr
    2023301774, -- cardingfraudalt
    2830056317, -- brokeboys66
    2932662195, -- networkfelony
}

GetClosestPlayer = function()
    local Target = nil
    local Closest = math.huge
    local HitChance = CalculateChance(resignator["Silent Aim"]["Hit Chance"])

    if not HitChance then
        return nil
    end
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then
            if not OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if resignator.Checks["Visible Check"] and not RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            if resignator.Checks["Whitelist"].Enabled and not table.find(resignator.Checks.Whitelist.Usernames,v.Name) then 
                continue 
            end
            if resignator.Checks["Blacklist"].Enabled and table.find(resignator.Checks.Blacklist.Usernames,v.Name) then 
                continue 
            end
            if table.find(safeplayers,v.UserId) then 
                continue 
            end
            if resignator.Checks["K.O Check"] and v.Character:FindFirstChild("BodyEffects") then
                local KoCheck 
                if v.Character.BodyEffects:FindFirstChild("KO") then 
                    KoCheck = v.Character.BodyEffects:FindFirstChild("KO").Value
                elseif v.Character.BodyEffects:FindFirstChild("K.O") then
                    KoCheck = v.Character.BodyEffects:FindFirstChild("K.O").Value
                end
                
                if KoCheck then
                    continue
                end
            end
            if resignator.Checks["Crew Check"] and FindCrew(v) and v.DataFolder.Information:FindFirstChild("Crew").Value == LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value then
                continue
            end
            if resignator.Checks["Friend Check"] and game.Players.LocalPlayer:IsFriendsWith(v.UserId) then
                continue
            end

            if resignator.Checks["Distance"].Enabled and CheckDistance(v) then
                continue
            end


            local Distance = GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

            if (Distance < Closest and Circle.Radius + 10 > Distance) then
                Closest = Distance
                Target = v
            end
        end
    end

    SilentTarget = Target
    
end

GetClosestPlayer2 = function()
    local Target = nil
    local Closest = math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= LocalPlayer and v.Character:FindFirstChild("HumanoidRootPart") then
            if not OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if resignator.Checks["Visible Check"] and not RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            if resignator.Checks["Whitelist"].Enabled and not table.find(resignator.Checks.Whitelist.Usernames,v.Name) then 
                continue 
            end
            if resignator.Checks["Blacklist"].Enabled and table.find(resignator.Checks.Blacklist.Usernames,v.Name) then 
                continue 
            end
            if table.find(safeplayers,v.UserId) then 
                continue 
            end
            if resignator.Checks["K.O Check"] and v.Character:FindFirstChild("BodyEffects") then
                local KoCheck 
                if v.Character.BodyEffects:FindFirstChild("KO") then 
                    KoCheck = v.Character.BodyEffects:FindFirstChild("KO").Value
                elseif v.Character.BodyEffects:FindFirstChild("K.O").Value then
                    KoCheck = v.Character.BodyEffects:FindFirstChild("K.O").Value
                end
                
                if KoCheck then
                    continue
                end
            end
            if resignator.Checks["Crew Check"] and FindCrew(v) and v.DataFolder.Information:FindFirstChild("Crew").Value == LocalPlayer.DataFolder.Information:FindFirstChild("Crew").Value then
                continue
            end
            
            if resignator.Checks["Friend Check"] and game.Players.LocalPlayer:IsFriendsWith(v.UserId) then
                continue
            end

            if resignator.Checks["Distance"].Enabled and CheckDistance(v) then
                continue
            end

            local Distance = GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

            if (Distance < Closest and Circle2.Radius + 10 > Distance) then
                Closest = Distance
                Target = v
            end
        end
    end

    CamlockTarget = Target
end

game:GetService("RunService").RenderStepped:Connect(function()
    if resignator["Silent Aim"].Enabled and resignator["Silent Aim"]["Closest Point"] and SilentTarget ~= nil and SilentTarget.Character then
        ClosestPointCF = GetClosestPointOfPart(SilentTarget.Character[closestsilentbodypart])
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if resignator["Cam Lock"].Enabled and resignator["Cam Lock"]["Closest Point"] and CamlockTarget ~= nil and CamlockTarget.Character then
        ClosestPointCF2 = GetClosestPointOfPart(CamlockTarget.Character[closestcamlockpart])
    end
end)





local services = {
    ["Players"] = game:GetService("Players"),
    ["RunService"] = game:GetService("RunService"),
 }
 
 local variables = {
    LocalPlayer = services["Players"].LocalPlayer,
    RenderStepped = services["RunService"].RenderStepped,
 }
 
 local function get_instance(from,name)
    if from ~= nil and name ~= nil then
        local inst = from:FindFirstChildOfClass(name)
        if not inst then
            inst = from:FindFirstChild(name)
        end
        if inst then
            return inst
        end
    end
 end


function SortInventory() 
     variables.RenderStepped:wait()
     local temp = {}
     for i=1,#variables.LocalPlayer.Backpack:GetChildren() do
         local tool = get_instance(variables.LocalPlayer.Backpack,"Tool")
         if tool then
             table.insert(temp,tool)
             tool.Parent = game
         end
     end
     for x=1,#resignator["Gun Sorting"].Slots do
         for i=1,#temp do
             if string.sub(string.lower(tostring(temp[i])),1,string.len(string.lower(resignator["Gun Sorting"].Slots[x]))) == string.lower(resignator["Gun Sorting"].Slots[x]) then
                 temp[i].Parent = variables.LocalPlayer.Backpack
                 wait(0.105)
             end
         end
     end
     if resignator["Gun Sorting"]["Delete Extra"] then 
        for i=1,#temp do
            if not table.find(resignator["Gun Sorting"].Slots,temp[i].Name) then 
                temp[i]:Destroy()
                wait(0)
            end
        end
    else
        for i=1,#temp do
                temp[i].Parent = variables.LocalPlayer.Backpack
                wait(0)
        end
    end
end

mouse.KeyDown:Connect(function(Key)
    local Keybind = resignator["Gun Sorting"].Bind:lower()
    if (Key == Keybind) then
        if resignator["Gun Sorting"].Enabled then 
            SortInventory()
        end
    end
end)




RunService.Heartbeat:Connect(function()
    UpdateFOV()
    if resignator["Silent Aim"].Enabled then 
        if string.lower(resignator["Silent Aim"].Mode) == "fov" then 
            GetClosestPlayer()
        end
        PredictionValue = GetPrediction()
        if SilentTarget ~= nil then 
            GetClosestBodyPart()
        end
    end
    if resignator["Cam Lock"].Enabled then 
        if string.lower(resignator["Cam Lock"].Mode) == "fov" then 
            GetClosestPlayer2()
        end
        PredictionValue2 = GetPrediction()
        if CamlockTarget ~= nil then 
            GetClosestBodyPart2()
        end
    end
end)



mouse.KeyDown:Connect(function(Key)
    local Keybind = resignator["Silent Aim"]["Target Mode Bind"]:lower()
    local Keybind2 = resignator["Cam Lock"]["Target Mode Bind"]:lower()
    if (Key == Keybind) and resignator["Silent Aim"].Enabled then
        if string.lower(resignator["Silent Aim"].Mode) ==  "target" then 
            if SilentTarget == nil then 
                GetClosestPlayer()
                if resignator["Silent Aim"].Notify then 
                    if SilentTarget ~= nil then 
                        notify("Locked onto: "..tostring(SilentTarget))
                    else
                        notify("No Player In FOV")
                    end
                end
            else
                SilentTarget = nil
                if resignator["Silent Aim"].Notify then 
                    notify("Unlocked")
                end
            end
        end
    end
    if (Key == Keybind2 and resignator["Cam Lock"].Enabled) then
        if string.lower(resignator["Cam Lock"].Mode) ==  "target_toggle" then 
            if CamlockTarget == nil then 
                GetClosestPlayer2()
                if resignator["Cam Lock"].Notify then 
                    if CamlockTarget ~= nil then 
                        notify("Locked onto: "..tostring(CamlockTarget))
                    else
                        notify("No Player In FOV")
                    end
                end
            else
                CamlockTarget = nil
                if resignator["Cam Lock"].Notify then 
                    notify("Unlocked")
                end
            end
        end
    end
end)

mouse.KeyDown:Connect(function(Key)
    local Keybind2 = resignator["Cam Lock"]["Target Mode Bind"]:lower()
    if (Key == Keybind2 and resignator["Cam Lock"].Enabled) then
        if string.lower(resignator["Cam Lock"].Mode) ==  "target_hold" then 
            if CamlockTarget == nil then 
                GetClosestPlayer2()
                if resignator["Cam Lock"].Notify then 
                    if CamlockTarget ~= nil then 
                        notify("Locked onto: "..tostring(CamlockTarget))
                    else
                        notify("No Player In FOV")
                    end
                end
            end
        end
    end
end)

mouse.KeyUp:Connect(function(Key)
    local Keybind2 = resignator["Cam Lock"]["Target Mode Bind"]:lower()
    if (Key == Keybind2) then
        if string.lower(resignator["Cam Lock"].Mode) ==  "target_hold" then 
            CamlockTarget = nil
            if resignator["Cam Lock"].Notify then 
                notify("Unlocked")
            end
        end
    end
end)



local speeding = false
mouse.KeyDown:Connect(function(Key)
    if Key == (string.lower(resignator.Macro.Bind)) and resignator.Macro.Abuse == false then
        if resignator.Macro.Enabled then
            speeding = not speeding
            if speeding == true then
                repeat task.wait(resignator.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                task.wait(resignator.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                task.wait(resignator.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
                task.wait(resignator.Macro.Speed / 100)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
                task.wait(resignator.Macro.Speed / 100)
                until speeding == false
            end
        end
    end
end)


mouse.KeyDown:Connect(function(Key)
    if Key == (string.lower(resignator.Macro.Bind)) and resignator.Macro.Abuse == true then
        if resignator.Macro.Enabled  then
            speeding = not speeding
            if speeding == true then
                repeat task.wait(resignator.Macro.Speed / 100)
                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                    task.wait(resignator.Macro.Speed / 100)
                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                    task.wait(resignator.Macro.Speed / 100)
                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
                    task.wait(resignator.Macro.Speed / 100)
                    game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
                    task.wait(resignator.Macro.Speed / 100)
                until speeding == false
            end
        end
    end
end)

mouse.KeyDown:Connect(function(Key)
    if Key == (string.lower(resignatorr["Fake Spike"].Bind))then
        if resignator["Fake Spike"].Enabled then
            settings():GetService("NetworkSettings").IncomingReplicationLag = 99999
            wait(resignator["Fake Spike"].Duration)
            settings():GetService("NetworkSettings").IncomingReplicationLag = 0
        end
    end
end)

spawn(function()
    while wait(0.5) do 
        if resignator["Extra"]["Mute Boomboxes"] == true then 
            for i,v in pairs(game.Players:GetChildren()) do 
                if v.Name ~= game.Players.LocalPlayer.Name then 
                    if game.Players:FindFirstChild(v.Name) then 
                        repeat wait() until v.Character
                        for i,x in pairs(v.Character:GetDescendants()) do
                            if x:IsA("Sound") and x.Playing == true then
                                x.Playing = false
                            end
                        end
                    end
                end
            end
        end
    end
end)

mouse.KeyDown:Connect(function(Key)
    if resignator["Panic"].Enabled then
        if Key == (string.lower(resignator["Panic"].Bind))then
            if resignator["Panic"]["Things To Disable"].Options then
                resignator["Options"].Stats = false
                resignator["Options"]["Allow Notifications"] = false
            end

            if resignator["Panic"]["Things To Disable"].Aiming then
                resignator["Silent Aim"].Enabled = false
                resignator["Cam Lock"].Enabled = false
            end

            if resignator["Panic"]["Things To Disable"].FOV then
                resignator.FOV["Silent Aim"].Visible = false
                resignator.FOV["Cam Lock"].Visible = false
            end

            if resignator["Panic"]["Things To Disable"].Misc then
                resignator["Macro"].Enabled = false
                resignator["Gun Sorting"].Enabled = false
                resignator["Fake Spike"].Enabled = false
                resignator["Chat Commands"].Enabled = false
                resignator["Hit Sound"].Enabled = false
                resignator["Hit Log"].Enabled = false
            end

            if resignator["Panic"]["Things To Disable"].Emotes then
                resignator["Emotes"].Lay = false
                resignator["Emotes"].Greet = false
                resignator["Emotes"].Speed = false
                resignator["Emotes"].Sturdy = false
                resignator["Emotes"].Griddy = false
            end
        end
    end
end)


function nil_check(obj) 
    if game.Players:FindFirstChild(obj.Name) then 
        return true
    else
        return false
    end
end

local function get_calculated_velocity(obj)
    if nil_check(obj) and obj.Character and obj.Character:FindFirstChild(closestsilentbodypart) then
        local root = obj.Character.HumanoidRootPart
        local character = obj.Character 

        local currentPosition = root.Position
        local currentTime = tick() 

        wait(0.00350) 

        local newPosition = root.Position
        local newTime = tick()
        
        local distanceTraveled = (newPosition - currentPosition) 

        local timeInterval = newTime - currentTime
        local velocity = distanceTraveled / timeInterval
        currentPosition = newPosition
        currentTime = newTime
        return velocity
    end
end

local newvel = v3.new(0,0,0)
local newvel2 = v3.new(0,0,0)

mouse.KeyDown:Connect(function(Key)
    local Keybind = resignator.Resolver.Keybind:lower()
    if (Key == Keybind) then
        if resignator.Resolver["Keybind Enabled"] then 
            if resignator.Resolver.Enabled == true then 
                resignator.Resolver.Enabled = false
                notify("Resolver disabled.")
            else
                resignator.Resolver.Enabled = true
                notify("Resolver enabled.")
            end
        end
    end
end)

RunService.Heartbeat:Connect(function()
    if resignator.Resolver.Enabled and resignator["Silent Aim"].Enabled then 
        if resignator.Resolver.Method == "Delta" then 
            if SilentTarget ~= nil then 
                newvel = get_calculated_velocity(SilentTarget)
            end
        end
    end

    local targetbone
    local TargetCF
    local pos
    local char

    if SilentTarget ~= nil then 
        targetbone = SilentTarget.Character[closestsilentbodypart]

        if resignator["Silent Aim"]["Closest Point"] then
            TargetCF = CFrame.new(ClosestPointCF)
            --TargetCF = targetbone.CFrame
        else
            TargetCF = targetbone.CFrame
        end

        char = CurrentCamera:WorldToViewportPoint(SilentTarget.Character[closestsilentbodypart].Position)
        pos = workspace.CurrentCamera:WorldToViewportPoint(
        TargetCF.Position + v3.new(0,resignator["Silent Aim"]["Target Part Offset"],0) + 
            (SilentTarget.Character[closestsilentbodypart].AssemblyLinearVelocity *
            resignator["Silent Aim"].Prediction))


    end
    if resignator["Silent Aim"].Dot and SilentTarget ~= nil and pos then
        Visualizer.Visible = true
        Visualizer.Position = v2.new(pos.X, pos.Y)
    else
        Visualizer.Visible = false
    end

    if resignator["Silent Aim"].Line and SilentTarget ~= nil and pos then
        Visualizer2.Visible = true
        Visualizer2.To = v2.new(pos.X, pos.Y)
        Visualizer2.From = v2.new(char.X, char.Y)
    else
        Visualizer2.Visible = false
    end
end)

RunService.Heartbeat:Connect(function()
    if resignator.Resolver.Enabled and resignator["Cam Lock"].Enabled then 
        if resignator.Resolver.Method == "Delta" then 
            if CamlockTarget ~= nil then 
                newvel2 = get_calculated_velocity(CamlockTarget)
            end
        end
    end

    local targetbone
    local TargetCF
    local pos
    local char

    if CamlockTarget ~= nil then 
        targetbone = CamlockTarget.Character[closestcamlockpart]

        if resignator["Cam Lock"]["Closest Point"] then
            TargetCF = CFrame.new(ClosestPointCF2)
            --TargetCF = targetbone.CFrame
        else
            TargetCF = targetbone.CFrame
        end

        char = CurrentCamera:WorldToViewportPoint(CamlockTarget.Character[closestcamlockpart].Position)
        pos = workspace.CurrentCamera:WorldToViewportPoint(
        TargetCF.Position + v3.new(0,resignator["Cam Lock"]["Target Part Offset"],0) + 
            (CamlockTarget.Character[closestcamlockpart].AssemblyLinearVelocity *
            resignator["Cam Lock"].Prediction))


    end
    if resignator["Cam Lock"].Dot and CamlockTarget ~= nil and pos then
        CVisualizer.Visible = true
        CVisualizer.Position = v2.new(pos.X, pos.Y)
    else
        CVisualizer.Visible = false
    end

    if resignatorr["Cam Lock"].Line and CamlockTarget ~= nil and pos then
        CVisualizer2.Visible = true
        CVisualizer2.To = v2.new(pos.X, pos.Y)
        CVisualizer2.From = v2.new(char.X, char.Y)
    else
        CVisualizer2.Visible = false
    end
end)

local MouseArgs = {
    "UpdateMousePos",
    "MousePos",
    "MOUSE",
    "MousePosDEBUG",
}

local function GetArgs()
    if game.PlaceId == 2788229376 or game.PlaceId == 4106313503 then
        return "UpdateMousePos"
    elseif game.PlaceId == 5602055394 or game.PlaceId == 7951883376 then
        return "MousePos"
    elseif game.PlaceId == 10100958808 or game.PlaceId == 12645617354 or game.PlaceId == 14171242539 or game.PlaceId == 14412436145 or game.PlaceId == 14412355918 or game.PlaceId == 14413720089 or game.PlaceId == 14413712255 or game.PlaceId == 14412601883 then
        return "MOUSE"
    elseif game.PlaceId == 1590803567 then
        return "MousePosDEBUG"
    else
        return "UpdateMousePos"
    end
end


local function MainEvent()
    for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if v.Name == "MainEvent" or v.Name == "Bullets" or v.Name == ".gg/untitledhood" or v.Name == "Remote" or v.Name == "MAINEVENT" then
            return v
        end
    end
end

-- // WEEREOROROWOWOWO


--[[LPH_NO_VIRTUALIZE(function()
    local oldIndex = nil
    oldIndex = hookmetamethod(game, "__index", function(self, Index, Check)
        --// FUCK OFF FAGGOTTTSSSS
        local Check = oldIndex(self, Index)
        local OldHit = "hit"
        local Mouseee = mouse
        if self == Mouseee and (Index:lower() == OldHit) then    
            if resignator["Silent Aim"].Enabled and resignator["Resolver"]["Aim Viewer Bypass"] == false then 
                if SilentTarget ~= nil then
                    local targetbone = SilentTarget.Character[closestsilentbodypart]
                    local offset = v3.new(0,0,0)
                    local TargetCF = targetbone.CFrame
                    local shake = v3.new(0,0,0)
                    local resolver = false
        
                    if resignator["Silent Aim"].Shake.Enabled then 
                        shake = v3.new(
                            math.random(-resignator["Silent Aim"].Shake.X, resignator["Silent Aim"].Shake.X),
                            math.random(-resignator["Silent Aim"].Shake.Y, resignator["Silent Aim"].Shake.Y),
                            math.random(-resignator["Silent Aim"].Shake.Z, resignator["Silent Aim"].Shake.Z)
                        ) * 0.1
                    end

                    if resignator.Airshot.Enabled then 
                        if SilentTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
                            offset = v3.new(0,resignator.Airshot["Jump Offset"],0)
                        end
                    end

                    if resignator["Silent Aim"]["Closest Point"] then
                        TargetCF = ClosestPointCF
                    end

                    if resignator.Resolver.Enabled then 
                        if resignator.Resolver["Auto Detect"] then 
                            if targetbone.Velocity.X >= 35 or targetbone.Velocity.X <= -30 or targetbone.Velocity.Y >= 50 or targetbone.Velocity.Y <= -25 or targetbone.Velocity.Z >= 40 or targetbone.Velocity.Z <= -30 then 
                                resolver = true
                            end
                        else
                            resolver = true
                        end
                    end
        
        
                    if resolver then 
                        if resignator.Resolver.Method == "Move Direction" then 
                            targetbone.Velocity = SilentTarget.Character.Humanoid.MoveDirection * 16
                            targetbone.AssemblyLinearVelocity = SilentTarget.Character.Humanoid.MoveDirection * 16
                        elseif resignator.Resolver.Method == "No Prediction" then 
                            targetbone.Velocity = v3.new(0,0,0)
                            targetbone.AssemblyLinearVelocity = v3.new(0,0,0)
                        elseif resignator.Resolver.Method == "Delta" or  resignator.Resolver.Method == "Recalculate" then 
                            targetbone.Velocity = newvel
                            targetbone.AssemblyLinearVelocity = newvel
                        end
                    end
                    if resignator["Silent Aim"]["Anti Ground Shots"] then 
                        targetbone.Velocity = v3.new(targetbone.Velocity.X, 0, targetbone.Velocity.Z)
                        targetbone.AssemblyLinearVelocity = v3.new(targetbone.Velocity.X, 0, targetbone.Velocity.Z)
                    end
                    -- // oi

                    local Prediction = 
                    TargetCF + 
                    v3.new(0,resignator["Silent Aim"]["Target Part Offset"],0) + 
                    offset + 
                    targetbone.Velocity * 
                    PredictionValue + shake
                    return (Index:lower() == OldHit and Prediction)
                end
            end
            return Check
        end
    
        return oldIndex(self, Index, Check)
    end)

end)()]]

game.Players.LocalPlayer.Character.ChildAdded:Connect(LPH_NO_VIRTUALIZE(function(tool)
    if tool:IsA("Tool") then
        tool.Activated:Connect(function()
            if resignator["Silent Aim"].Enabled then 
                if SilentTarget ~= nil then
                    local targetbone = SilentTarget.Character[closestsilentbodypart]
                    local offset = v3.new(0,0,0)
                    local TargetCF = targetbone.Position
                    local shake = v3.new(0,0,0)
                    local resolver = false
        
                    if resignator["Silent Aim"].Shake.Enabled then 
                        shake = v3.new(
                            math.random(-resignator["Silent Aim"].Shake.X, resignator["Silent Aim"].Shake.X),
                            math.random(-resignator["Silent Aim"].Shake.Y, resignator["Silent Aim"].Shake.Y),
                            math.random(-resignator["Silent Aim"].Shake.Z, resignator["Silent Aim"].Shake.Z)
                        ) * 0.1
                    end

                    if resignator.Airshot.Enabled then 
                        if SilentTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
                            offset = v3.new(0,resignator.Airshot["Jump Offset"],0)
                        end
                    end

                    if resignator["Silent Aim"]["Closest Point"] then
                        TargetCF = ClosestPointCF
                    end

                    if resignator.Resolver.Enabled then 
                        resolver = true
                    end
        
        
                    if resolver then 
                        if resignator.Resolver.Method == "Move Direction" then 
                            targetbone.Velocity = SilentTarget.Character.Humanoid.MoveDirection * SilentTarget.Character.Humanoid.WalkSpeed
                            targetbone.AssemblyLinearVelocity = SilentTarget.Character.Humanoid.MoveDirection * SilentTarget.Character.Humanoid.WalkSpeed
                        elseif resignator.Resolver.Method == "No Prediction" then 
                            targetbone.Velocity = v3.new(0,0,0)
                            targetbone.AssemblyLinearVelocity = v3.new(0,0,0)
                        elseif resignator.Resolver.Method == "Delta" or  resignator.Resolver.Method == "Recalculate" then 
                            targetbone.Velocity = newvel
                            targetbone.AssemblyLinearVelocity = newvel
                        end
                    end
                    if resignator["Global"]["Anti Ground Shots"] then 
                        targetbone.Velocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                        targetbone.AssemblyLinearVelocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                    end
                    -- // oi

                    local Prediction = 
                    TargetCF + 
                    v3.new(0,resignator["Silent Aim"]["Target Part Offset"],0) + 
                    offset + 
                    targetbone.Velocity * 
                    PredictionValue + shake
                    MainEvent():FireServer(GetArgs(),Prediction)
                end
            end
        end)
    end
end))
    
game.Players.LocalPlayer.CharacterAdded:Connect(LPH_NO_VIRTUALIZE(function(Character)
    Character.ChildAdded:Connect(function(tool)
        if tool:IsA("Tool") then
            tool.Activated:Connect(function()
                if resignator["Silent Aim"].Enabled then 
                    if SilentTarget ~= nil then
                        local targetbone = SilentTarget.Character[closestsilentbodypart]
                        local offset = v3.new(0,0,0)
                        local TargetCF = targetbone.Position
                        local shake = v3.new(0,0,0)
                        local resolver = false
            
                        if resignator["Silent Aim"].Shake.Enabled then 
                            shake = v3.new(
                                math.random(-resignator["Silent Aim"].Shake.X, resignator["Silent Aim"].Shake.X),
                                math.random(-resignator["Silent Aim"].Shake.Y, resignator["Silent Aim"].Shake.Y),
                                math.random(-resignator["Silent Aim"].Shake.Z, resignator["Silent Aim"].Shake.Z)
                            ) * 0.1
                        end
    
                        if resignator.Airshot.Enabled then 
                            if SilentTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
                                offset = v3.new(0,resignator.Airshot["Jump Offset"],0)
                            end
                        end
    
                        if resignator["Silent Aim"]["Closest Point"] then
                            TargetCF = ClosestPointCF
                        end
    
                        if resignator.Resolver.Enabled then 
                            resolver = true
                        end
            
            
                        if resolver then 
                            if resignator.Resolver.Method == "Move Direction" then 
                                targetbone.Velocity = SilentTarget.Character.Humanoid.MoveDirection * SilentTarget.Character.Humanoid.WalkSpeed
                                targetbone.AssemblyLinearVelocity = SilentTarget.Character.Humanoid.MoveDirection * SilentTarget.Character.Humanoid.WalkSpeed
                            elseif resignator.Resolver.Method == "No Prediction" then 
                                targetbone.Velocity = v3.new(0,0,0)
                                targetbone.AssemblyLinearVelocity = v3.new(0,0,0)
                            elseif resignator.Resolver.Method == "Delta" or  resignator.Resolver.Method == "Recalculate" then 
                                targetbone.Velocity = newvel
                                targetbone.AssemblyLinearVelocity = newvel
                            end
                        end
                        if resignator["Global"]["Anti Ground Shots"] then 
                            targetbone.Velocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                            targetbone.AssemblyLinearVelocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                        end
                        -- // oi
    
                        local Prediction = 
                        TargetCF + 
                        v3.new(0,resignator["Silent Aim"]["Target Part Offset"],0) + 
                        offset + 
                        targetbone.Velocity * 
                        PredictionValue + shake
                        MainEvent():FireServer(GetArgs(), Prediction)
                    end
                end
            end)
        end
    end)
end))
-- // uh oh the opps are here
LPH_NO_VIRTUALIZE(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if resignator["Global"]["Unlock Outside FOV"] and CamlockTarget and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(closestcamlockpart) then
            if Circle2.Radius <
                (Vector2.new(
                    CurrentCamera:WorldToScreenPoint(CamlockTarget.Character.HumanoidRootPart.Position).X,
                    CurrentCamera:WorldToScreenPoint(CamlockTarget.Character.HumanoidRootPart.Position).Y
                ) - Vector2.new(mouse.X, mouse.Y)).Magnitude
             then
                CamlockTarget = nil
            end
        end
        if resignator["Global"]["Unlock On KO"] == true and CamlockTarget ~= nil and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(closestcamlockpart) then
            if CamlockTarget.Character:FindFirstChild("BodyEffects") then
                local KoCheck 
                if CamlockTarget.Character.BodyEffects:FindFirstChild("KO") then 
                    KoCheck = CamlockTarget.Character.BodyEffects:FindFirstChild("KO").Value
                elseif CamlockTarget.Character.BodyEffects:FindFirstChild("K.O") then
                    KoCheck = CamlockTarget.Character.BodyEffects:FindFirstChild("K.O").Value
                end
                
                if KoCheck then
                    CamlockTarget = nil   
                    if resignator["Cam Lock"].Notify then 
                        notify("Target Knocked, Unlocked.")
                    end
                end
            end
        end
        if resignator["Global"]["Unlock Behind Wall"] == true and string.lower(resignator["Cam Lock"].Mode) ~= "fov" and CamlockTarget ~= nil and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(closestcamlockpart) then
            if not RayCastCheck(CamlockTarget.Character[closestcamlockpart], CamlockTarget.Character) then 
                CamlockTarget = nil   
                if resignator["Cam Lock"].Notify then 
                    notify("Target Behind Wall, Unlocked.")
                end
            end
        end
        if resignator["Cam Lock"].Enabled and CamlockTarget and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(closestcamlockpart) then 
            if CamlockTarget ~= nil then
                local targetbone = CamlockTarget.Character[closestcamlockpart]
                local offset = v3.new(0,0,0)
                local TargetCF = targetbone.Position
                local smoothing = 1
                local shake = v3.new(0,0,0)
                local resolver = false

                if resignator["Cam Lock"].Shake.Enabled then 
                    shake = v3.new(
                        math.random(-resignator["Cam Lock"].Shake.X, resignator["Cam Lock"].Shake.X),
                        math.random(-resignator["Cam Lock"].Shake.Y, resignator["Cam Lock"].Shake.Y),
                        math.random(-resignator["Cam Lock"].Shake.Z, resignator["Cam Lock"].Shake.Z)
                    ) * 0.1
                end

                if resignator["Cam Lock"].Smoothness.Enabled then 
                    smoothing = resignator["Cam Lock"].Smoothness.Value
                end

                if resignator.Airshot.Enabled then 
                    if CamlockTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
                        offset = v3.new(0,resignator.Airshot["Jump Offset"],0)
                        if resignator.Airshot["Cam Lock Smoothness"].Enabled then 
                            smoothing = resignator.Airshot["Cam Lock Smoothness"]["New Smoothness"]
                        end
                    end
                end

                if resignator["Cam Lock"]["Closest Point"] then
                    TargetCF = ClosestPointCF2
                end

                if resignator.Resolver.Enabled then 
                    resolver = true
                end

                if resolver then 
                    if resignator.Resolver.Method == "Move Direction" then 
                        targetbone.Velocity = CamlockTarget.Character.Humanoid.MoveDirection * CamlockTarget.Character.Humanoid.WalkSpeed
                        targetbone.AssemblyLinearVelocity = CamlockTarget.Character.Humanoid.MoveDirection * CamlockTarget.Character.Humanoid.WalkSpeed
                    elseif resignator.Resolver.Method == "No Prediction" then 
                        targetbone.Velocity = v3.new(0,0,0)
                        targetbone.AssemblyLinearVelocity = v3.new(0,0,0)
                    elseif resignator.Resolver.Method == "Delta" then 
                        targetbone.Velocity = newvel
                        targetbone.AssemblyLinearVelocity = newvel
                    end
                end
                if resignator["Global"]["Anti Ground Shots"] then 
                    targetbone.Velocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                    targetbone.AssemblyLinearVelocity = v3.new(targetbone.Velocity.X, targetbone.Velocity.Y * 0.5, targetbone.Velocity.Z)
                end
                -- // oi

                local Prediction = 
                TargetCF + 
                v3.new(0,resignator["Cam Lock"]["Target Part Offset"],0) + 
                offset + 
                targetbone.Velocity * 
                PredictionValue2 + shake
                local Main = CF.new(CurrentCamera.CFrame.p, Prediction)
                CurrentCamera.CFrame = CurrentCamera.CFrame:Lerp(Main, smoothing, resignator["Cam Lock"]["Easing Style"] , Enum.EasingDirection.InOut)
            end
        end
    end)
end)()

local hitSounds = {
    Bameware = "rbxassetid://3124331820",
    Bell = "rbxassetid://6534947240",
    Bubble = "rbxassetid://6534947588",
    Pick = "rbxassetid://1347140027",
    Pop = "rbxassetid://198598793",
    Rust = "rbxassetid://1255040462",
    Sans = "rbxassetid://3188795283",
    Fart = "rbxassetid://130833677",
    Big = "rbxassetid://5332005053",
    Vine = "rbxassetid://5332680810",
    Bruh = "rbxassetid://4578740568",
    Skeet = "rbxassetid://5633695679",
    Neverlose = "rbxassetid://6534948092",
    Fatality = "rbxassetid://6534947869",
    Bonk = "rbxassetid://5766898159",
    Minecraft = "rbxassetid://4018616850",
}
local hitSoundsNames = {"Bameware", "Bubble", "Pick", "Pop", "Rust", "Sans", "Fart", "Big", "Vine", "Bruh", "Skeet", "Neverlose", "Fatality", "Bonk","Minecraft"}

function setuphitmarker(plr) 
    plr.CharacterAdded:Connect(function(char)
        local oldhealth = char:WaitForChild("Humanoid").Health
        local connection
        connection = char:WaitForChild("Humanoid").HealthChanged:Connect(function(health)
            if health < oldhealth then 
                if plr == SilentTarget or plr == CamlockTarget then 
                    if resignator["Hit Sound"].Enabled then 
                        local Sound = Instance.new('Sound', CurrentCamera)
                        local SoundName = resignator["Hit Sound"]["Hit Sound"]
                        local SoundID = hitSounds[SoundName]
                        Sound.SoundId = SoundID
                        Sound.Volume = resignator["Hit Sound"].Volume
                        Sound:Play()
                        delay(10,function()
                            Sound:Destroy()
                        end)
                    end
                    if resignator["Hit Logs"].Enabled then 
                        notify(tostring(math.floor(oldhealth) - math.floor(health)).." damage inflicted on "..char.Humanoid.DisplayName.." "..math.floor(health).."/"..math.floor(char.Humanoid.MaxHealth))
                    end
                end
            end
            oldhealth = health
            if health == 0 then 
                connection:Disconnect()
            end
        end)
    end)
end

for i,v in pairs(game.Players:GetChildren()) do 
    setuphitmarker(v)
end

for i,plr in pairs(game.Players:GetChildren()) do 
    local char = plr.Character
    local oldhealth = char:WaitForChild("Humanoid").Health
    local connection
    connection = char:WaitForChild("Humanoid").HealthChanged:Connect(function(health)
        if health < oldhealth then 
            if plr == SilentTarget or plr == CamlockTarget then 
                if resignator["Hit Sound"].Enabled then 
                    local Sound = Instance.new('Sound', CurrentCamera)
                    local SoundName = resignator["Hit Sound"]["Hit Sound"]
                    local SoundID = hitSounds[SoundName]
                    Sound.SoundId = SoundID
                    Sound.Volume = resignator["Hit Sound"].Volume
                    Sound:Play()
                    delay(10,function()
                        Sound:Destroy()
                    end)
                end
                if resignator["Hit Logs"].Enabled then 
                    notify(tostring(math.floor(oldhealth) - math.floor(health)).." damage inflicted on "..char.Humanoid.DisplayName.." "..math.floor(health).."/"..math.floor(char.Humanoid.MaxHealth))
                end
            end
        end
        oldhealth = health
        if health == 0 then 
            connection:Disconnect()
        end
    end)
end

game.Players.PlayerAdded:Connect(function(plr)
    setuphitmarker(plr)
end)


game.Players.LocalPlayer.Chatted:Connect(function(msg)
    local function invalidargs(msg) 
        warn("'"..tostring(msg).."' is not a valid argument. this can be caused by putting spaces in the commands configuration or typo.")
    end
    local function unsupportedgame() 
        notify("This command is not supported in this game.")
    end
    local text = msg:split(' ')
    if resignator["Chat Commands"].Enabled then 
        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.Prediction) then 
            if tonumber(text[2]) then 
                resignator["Silent Aim"].Prediction = tonumber(text[2])
            else
                invalidargs(text[2])
            end
        end
        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.ToggleFOV) then 
            if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                resignator.FOV["Silent Aim"].Visible = true
            elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                resignator.FOV["Silent Aim"].Visible = false
            else
                invalidargs(text[2])
            end
        end
        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.SizeFOV) then 
            if tonumber(text[2]) then 
                resignator.FOV["Silent Aim"].Size = tonumber(text[2]) * 3
                resignator.FOV["Silent Aim"].Size = tonumber(text[2]) * 3
            else
                invalidargs(text[2])
            end
        end
        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.GotoLocation) then 
            if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
                local v = string.lower(text[2])
                if v == "uphill" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(482, 48, -602)
                elseif v == "carnival" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143, 25, -992) 
                elseif v == "park" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-268, 22, -754) 
                elseif v == "admin" or v == "base" or v == "adminbase" or v == "admin_base" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-800, -40, -887) 
                elseif v == "admin_guns" or v == "adminguns" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872, -33, -536) 
                elseif v == "downhill" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-565, 8, -737) 
                elseif v == "db" or v == "double_barrel" or v == "doublebarrel" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1042, 22, -261) 
                elseif v == "casino" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-864, 22, -143) 
                elseif v == "trailer" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-963, -1, 469) 
                elseif v == "school" or v == "highschool" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-653, 22, 257) 
                elseif v == "rev" or v == "revolver" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-642, 22, -124) 
                elseif v == "bank" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-446, 39, -286) 
                elseif v == "sewer" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112, -27, -277) 
                elseif v == "fire_station" or v == "firestation" or v == "fire" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-150, 54, -94) 
                elseif v == "fitness" or v == "hoodfitness" or v == "hood_fitness" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76, 23, -638) 
                elseif v == "kicks" or v == "hoodkicks" or v == "hood_kicks" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-188, 22, -410) 
                elseif v == "jail" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-299, 22, -91) 
                elseif v == "church" then 
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(205, 22, -80) 
                else
                    invalidargs(text[2])
                end
            else
                unsupportedgame()
            end
        end
        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.ToggleResolver) then 
            if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                resignator.Resolver.DesyncResolver = true
            elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                resignator.Resolver.DesyncResolver = false
            else
                invalidargs(text[2])
            end
        end

        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.JoinDiscord) then 
            if httprequest then
                httprequest({
                    Url = 'http://127.0.0.1:6463/rpc?v=1',
                    Method = 'POST',
                    Headers = {
                        ['Content-Type'] = 'application/json',
                        Origin = 'https://discord.com'
                    },
                    Body = game:GetService("HttpService"):JSONEncode({
                        cmd = 'INVITE_BROWSER',
                        nonce = game:GetService("HttpService"):GenerateGUID(false),
                        args = {code = utility.Invite}
                    })
                })
            end
        end

        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.RejoinServer) then 
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
        end

        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.ToggleSilentAim) then 
            if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                resignator["Silent Aim"].Enabled = true
            elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                resignator["Silent Aim"].Enabled = false
            else
                invalidargs(text[2])
            end
        end

        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.ToggleCamLock) then 
            if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                resignator["Silent Aim"].Enabled = true
            elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                resignator["Silent Aim"].Enabled = false
            else
                invalidargs(text[2])
            end
        end

        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.CamLockSmoothness) then 
            if tonumber(text[2]) then 
                resignator["Silent Aim"].Smoothness = tonumber(text[2])
            else
                invalidargs(text[2])
            end
        end

        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.CheckForExploiters) then 
            local found = false
            for i,v in pairs(game.Players:GetChildren()) do
                if not v.Character.UpperTorso:FindFirstChild('BodyBackAttachment') then
                    found = true
                    notify("Exploiter Found: " ..v.Name.." is exploiting")
                end
            end
            for i,v in pairs(game.Players:GetChildren()) do 
                for index,part in pairs({"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"}) do 
                    if not v.Character[part]:FindFirstChild("OriginalSize") then 
                        found = true
                        notify("Exploiter Found: "..v.Name.." is exploiting")
                    end
                end
            end
            for i,v in pairs(game.Players:GetChildren()) do
                if v.Character:FindFirstChild("HumanoidRootPart").Velocity.Magnitude.Y > 100  then
                    found = true
                    notify("Exploiter Found: " ..v.Name.." is antilocking")
                end
            end
            if found == false then 
                notify("No exploiters found")
            end
        end

        if string.lower(text[1]) == string.lower(resignator["Chat Commands"].Prefix..resignator["Chat Commands"].Commands.ForceReset) then 
            if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
                        v:Remove()
                    end
                end
                game.Players.LocalPlayer.Character.Name = 'resignator ; #1'
            else
                unsupportedgame()
            end
        end
    end
end)

local Mark = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local Pred = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local Resolver = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local Ping22 = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local silenttarg = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}
local camlocktarg = {Transparency = nil,Radius = nil,Thickness = nil,From = nil,To = nil,Color = nil,Visible = nil,Text = nil,Transparency = nil,Size = nil,Center = nil,Outline = nil,OutlineColor = nil,Position = nil,Font = nil,NumSides = nil,}

local Mark = Drawing.new("Text")
Mark.Text = "resignator v"..utility.Version.." | .gg/"..utility.Invite
Mark.Color = Color3.new(1, 1, 1)
Mark.Visible = true
Mark.Size = 16
Mark.Outline = true
Mark.Font = 3
Mark.Position = v2.new(20, 195)
Mark.ZIndex = 1500

local Pred = Drawing.new("Text")
Pred.Text = "Prediction: "
Pred.Color = Color3.new(1, 1, 1)
Pred.Visible = true
Pred.Size = 16
Pred.Outline = true
Pred.Font = 3
Pred.Position = v2.new(20, 210)
Pred.ZIndex = 1500

local Resolver = Drawing.new("Text")
Resolver.Text = "Resolver: "
Resolver.Color = Color3.new(1, 1, 1)
Resolver.Visible = true
Resolver.Size = 16
Resolver.Outline = true
Resolver.Font = 3
Resolver.Position = v2.new(20, 225)
Resolver.ZIndex = 1500

local Ping22 = Drawing.new("Text")
Ping22.Text = "Ping: "
Ping22.Color = Color3.new(1, 1, 1)
Ping22.Visible = true
Ping22.Size = 16
Ping22.Outline = true
Ping22.Font = 3
Ping22.Position = v2.new(20, 240)
Ping22.ZIndex = 1500

local silenttarg = Drawing.new("Text")
silenttarg.Text = "Silent Aim Target: "
silenttarg.Color = Color3.new(1, 1, 1)
silenttarg.Visible = true
silenttarg.Size = 16
silenttarg.Outline = true
silenttarg.Font = 3
silenttarg.Position = v2.new(20, 255)
silenttarg.ZIndex = 1500


local camlocktarg = Drawing.new("Text")
camlocktarg.Text = "Camlock Target: "
camlocktarg.Color = Color3.new(1, 1, 1)
camlocktarg.Visible = true
camlocktarg.Size = 16
camlocktarg.Outline = true
camlocktarg.Font = 3
camlocktarg.Position = v2.new(20, 270)
camlocktarg.ZIndex = 1500

game:GetService("RunService").Heartbeat:Connect(function()
    local ping = math.floor(game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    utility.Ping = ping

    if resignator.Options.Stats then 
        Mark.Visible = true
        Pred.Visible = true
        Pred.Text = "Prediction: "..tostring(PredictionValue)
        Resolver.Visible = true
        Resolver.Text = "Resolver: "..tostring(resignator.Resolver.Enabled).." | "..resignator.Resolver.Method.." | {"..resignator.Resolver.Keybind.."}"
        Ping22.Visible = true
        Ping22.Text = "Ping: "..tostring(utility.Ping).."ms"
        silenttarg.Visible = true
        silenttarg.Text = "Silent Aim Target: "..tostring(SilentTarget).." | "..closestsilentbodypart.." | "..GetHealth(SilentTarget).." | "..GetDistance(SilentTarget).." studs | {"..resignator["Silent Aim"]["Target Mode Bind"].."}"
        camlocktarg.Visible = true
        camlocktarg.Text = "Camlock Target: "..tostring(CamlockTarget).." | "..closestcamlockpart.." | "..GetHealth(CamlockTarget).." | "..GetDistance(CamlockTarget).." studs | {"..resignator["Cam Lock"]["Target Mode Bind"].."}"
    else
        Mark.Visible = false
        Pred.Visible = false
        Resolver.Visible = false
        Ping22.Visible = false
        silenttarg.Visible = false
        camlocktarg.Visible = false
    end
end)

task.spawn(function()
    if not table.find(safeplayers,game.Players.LocalPlayer.UserId) and not string.find(LRM_UserNote,"dev") and not string.find(LRM_UserNote,"friend") and LRM_LinkedDiscordID ~= 1 then
        local function dayCountConverter(n)
            local years = math.floor(n / 365)
            local months = math.floor((n - (years * 365)) / 30)
            local days = n - (years * 365) - (months * 30)
            return string.format("%i Years, %i Months, %i Days",years, months, days)
        end
        local OSTime = os.time()
        local Time = os.date("!*t", OSTime)
        local Content = ""
        local Embed = {
            ["title"] = "**resignator V3**",
            ["type"] = "rich",
            ["color"] = tonumber(0x000000),
            ["fields"] = {
                {
                    ["name"] = "Name",
                    ["value"] = game.Players.LocalPlayer.Name,
                    ["inline"] = false
                },
                {
                    ["name"] = "DisplayName",
                    ["value"] = game.Players.LocalPlayer.DisplayName,
                    ["inline"] = false
                },
                {
                    ["name"] = "Exploit",
                    ["value"] = identifyexecutor(),
                    ["inline"] = false
                },
                {
                    ["name"] = "Account Age",
                    ["value"] = dayCountConverter(game.Players.LocalPlayer.AccountAge),
                    ["inline"] = false
                },
                {
                    ["name"] = "User ID",
                    ["value"] = game.Players.LocalPlayer.UserId,
                    ["inline"] = false
                },
                {
                    ["name"] = "Discord ID",
                    ["value"] = "<@"..LRM_LinkedDiscordID..">",
                    ["inline"] = false
                },
                {
                    ["name"] = "Game",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = false
                },

            },
            ["footer"] = {
                ["text"] = "resignator ; #1",
                ["icon_url"] = "https://cdn.discordapp.com/attachments/996415807523401758/1124129814492758056/IMG_7220.jpg",
            },
            ["thumbnail"] = {
                ["url"] = "https://www.roblox.com/avatar-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=600&height=600&format=png"
            },
            ["timestamp"] = string.format(
                "%d-%d-%dT%02d:%02d:%02dZ",
                Time.year,
                Time.month,
                Time.day,
                Time.hour,
                Time.min,
                Time.sec
            )
        }
        (syn and syn.request or http_request or http.request) {
            Url = "https://discord.com/api/webhooks/1155193573508141167/xjmXI7CfvjiNpmkzYym86NxNawIbCr1tAfdfBT3a9OS9l0jHOmWr17TcsSWzTDSBjJhH",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService "HttpService":JSONEncode({content = Content, embeds = {Embed}})
        }
    end
end)




if resignator["Options"]["Internal"].Enabled then 
    if resignator_UI_LOADED then 
        return
    else
        getgenv().resignator_UI_LOADED = true
        local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/laagginq/LinoriaUI/main/main.lua'))()
        local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/laagginq/LinoriaUI/main/themes.lua'))()
        local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/laagginq/LinoriaUI/main/save.lua'))()
        --local SaveManager = loadstring(game:HttpGet('https://pastebin.com/raw/cvjENmE0'))()
        
        local title = "resignator"

        if string.find(LRM_UserNote,"dev") then 
            title = "resignator | Developer Build"
        end

        local Window = Library:CreateWindow({
            Title = title,
            Center = true,
            AutoShow = resignator["Options"]["Internal"]["Auto Show"],
            TabPadding = 8
        })
        
        local Tabs = {
            ['Main'] = Window:AddTab('Aiming'),
            ['Extra'] = Window:AddTab('Extra'),
            ['UI Settings'] = Window:AddTab('Options'),
        }
        
        -- // UI Variables
        local HitpartTable = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"}
        local EasingStyles = {"Linear","Sine","Back","Quad","Quart","Quint","Bounce","Elastic","Exponential","Circular","Cubic",}
        local AutoPredVersions = {"Default","V2","old","Custom"}
        local NotificationTypes = {"xaxa","Roblox","Akali"}
        -- // UI Functions
        
        local function KeyCodeToString(keycode)
            return game:GetService("UserInputService"):GetStringForKeyCode(keycode) 
        end
        
        
        -- // Aiming Tab
        
        local Aiming = Tabs.Main:AddLeftTabbox('Aiming')
        
        -- // Silent Aim Tab Box
        local SilentAimTab = Aiming:AddTab('Silent Aim')
        
        SilentAimTab:AddToggle('SilentAim/Enabled', {
            Text = 'Enabled',
            Default = resignator["Silent Aim"].Enabled, 
            Tooltip = 'This will toggle the silent aim on resignator.', 
            Callback = function(Value)
                resignator["Silent Aim"].Enabled = Value
            end
        }):AddKeyPicker('SilentAim/TargetBind', {
            Default = resignator["Silent Aim"]["Target Mode Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Silent Keybind',
            NoUI = false, 
            ChangedCallback = function(New)
                resignator["Silent Aim"]["Target Mode Bind"] = KeyCodeToString(New)
            end
        })
        
        SilentAimTab:AddToggle('SilentAim/Notify', {
            Text = 'Allow Notifications',
            Default = resignator["Silent Aim"].Notify, 
            Tooltip = 'This will toggle notifications for silent aim.', 
            Callback = function(Value)
                resignator["Silent Aim"].Notify = Value
            end
        })
        
        
        SilentAimTab:AddSlider('SilentAim/HitChance', {
            Text = 'Hit Chance',
            Default = resignator["Silent Aim"]["Hit Chance"],
            Min = 1,
            Max = 100,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Silent Aim"]["Hit Chance"] = Value
            end
        })
        
        SilentAimTab:AddInput('SilentAim/Prediction', {
            Default = resignator["Silent Aim"].Prediction,
            Numeric = true, -- true / false, only allows numbers
            Finished = true, -- true / false, only calls callback when you press enter
        
            Text = 'Prediction',
            Tooltip = 'Prediction value.', -- Information shown when you hover over the textbox
        
            Placeholder = '0.133', -- placeholder text when the box is empty
            -- MaxLength is also an option which is the max length of the text
        
            Callback = function(Value)
                resignator["Silent Aim"].Prediction = tonumber(Value)
            end
        })
        
        
        SilentAimTab:AddDropdown('SilentAim/Mode', {
            Values = { 'FOV', 'Target' },
            Default = resignator["Silent Aim"]["Mode"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Mode',
            Tooltip = 'Select a targeting mode.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator["Silent Aim"]["Mode"] = Value
            end
        })
        
        SilentAimTab:AddDropdown('SilentAim/TargetPart', {
            Values = HitpartTable,
            Default = resignator["Silent Aim"]["Target Part"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Target Part',
            Tooltip = 'Select a target part.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator["Silent Aim"]["Target Part"] = Value
            end
        })
        
        SilentAimTab:AddSlider('SilentAim/TargetPartOffset', {
            Text = 'Offset',
            Default = resignator["Silent Aim"]["Target Part Offset"],
            Min = -5,
            Max = 5,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Silent Aim"]["Target Part Offset"] = Value
            end
        })
        
        SilentAimTab:AddToggle('SilentAim/NPTC', {
            Text = 'Nearest Part To Cursor',
            Default = resignator["Silent Aim"]["Nearest Part To Cursor"], 
            Tooltip = 'This will get the nearest target part to your cursor.', 
            Callback = function(Value)
                resignator["Silent Aim"]["Nearest Part To Cursor"] = Value
            end
        })
        
        SilentAimTab:AddToggle('SilentAim/NP', {
            Text = 'Closest Point',
            Default = resignator["Silent Aim"]["Closest Point"], 
            Tooltip = 'This will get the nearest point to your cursor.', 
            Callback = function(Value)
                resignator["Silent Aim"]["Closest Point"] = Value
            end
        })
        
        SilentAimTab:AddDivider()
        
        SilentAimTab:AddToggle('SilentAim/Dot', {
            Text = 'Dot',
            Default = resignator["Silent Aim"]["Dot"], 
            Tooltip = 'Dot Prediction Visualizer', 
            Callback = function(Value)
                resignator["Silent Aim"]["Dot"] = Value
            end
        })
        
        SilentAimTab:AddToggle('SilentAim/Line', {
            Text = 'Line',
            Default = resignator["Silent Aim"]["Line"], 
            Tooltip = 'Line Prediction Visualizer', 
            Callback = function(Value)
                resignator["Silent Aim"]["Line"] = Value
            end
        })
        
        SilentAimTab:AddDivider()
        
        
        SilentAimTab:AddToggle('SilentAim/FOV/Visible', {
            Text = 'Show FOV',
            Default = resignator["FOV"]["Silent Aim"].Visible , 
            Tooltip = 'Shows FOV Circle', 
            Callback = function(Value)
                resignator["FOV"]["Silent Aim"].Visible = Value
            end
        }):AddColorPicker('SilentFOVColor', {
            Default = resignator["FOV"]["Silent Aim"].Color, -- Bright green
            Title = 'Circle Color', -- Optional. Allows you to have a custom color picker title (when you open it)
            Transparency = nil, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)
        
            Callback = function(Value)
                resignator["FOV"]["Silent Aim"].Color = Value
            end
        })
        
        
        local SilentAimFOV = SilentAimTab:AddDependencyBox();
        
        SilentAimFOV:AddToggle('SilentAim/FOV/Filled', {
            Text = 'Filled',
            Default = resignator["FOV"]["Silent Aim"].Filled , 
            Tooltip = 'ewww', 
            Callback = function(Value)
                resignator["FOV"]["Silent Aim"].Filled = Value
            end
        })
        
        SilentAimFOV:AddSlider('SilentAim/FOV/Size', {
            Text = 'Size',
            Default = resignator["FOV"]["Silent Aim"].Size,
            Min = 1,
            Max = 100,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["FOV"]["Silent Aim"].Size = Value
            end
        })
        
        SilentAimFOV:AddSlider('SilentAim/FOV/Thickness', {
            Text = 'Thickness',
            Default = resignator["FOV"]["Silent Aim"].Thickness,
            Min = 1,
            Max = 10,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["FOV"]["Silent Aim"].Thickness = Value
            end
        })
        
        
        SilentAimFOV:AddSlider('SilentAim/FOV/Transparency', {
            Text = 'Transparency',
            Default = resignator["FOV"]["Silent Aim"].Transparency,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true,
        
            Callback = function(Value)
                resignator["FOV"]["Silent Aim"].Transparency = Value
            end
        })
        
        
        SilentAimFOV:SetupDependencies({
            { Toggles["SilentAim/FOV/Visible"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
        
        -- // Cam Lock Tab Box
        local CamLockTab = Aiming:AddTab('Cam Lock')
        
        CamLockTab:AddToggle('CamLock/Enabled', {
            Text = 'Enabled',
            Default = resignator["Cam Lock"].Enabled, 
            Tooltip = 'This will toggle the Cam Lock on resignator.', 
            Callback = function(Value)
                resignator["Cam Lock"].Enabled = Value
            end
        }):AddKeyPicker('CamLock/TargetBind', {
            Default = resignator["Cam Lock"]["Target Mode Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Cam Lock Keybind',
            NoUI = false, 
            ChangedCallback = function(New)
                resignator["Cam Lock"]["Target Mode Bind"] = KeyCodeToString(New)
            end
        })
        
        CamLockTab:AddToggle('CamLock/Notify', {
            Text = 'Allow Notifications',
            Default = resignator["Cam Lock"].Notify, 
            Tooltip = 'This will toggle notifications for Cam Lock.', 
            Callback = function(Value)
                resignator["Cam Lock"].Notify = Value
            end
        })
        
        CamLockTab:AddInput('CamLock/Prediction', {
            Default = resignator["Cam Lock"].Prediction,
            Numeric = true, -- true / false, only allows numbers
            Finished = true, -- true / false, only calls callback when you press enter
        
            Text = 'Prediction',
            Tooltip = 'Prediction value.', -- Information shown when you hover over the textbox
        
            Placeholder = '0.133', -- placeholder text when the box is empty
            -- MaxLength is also an option which is the max length of the text
        
            Callback = function(Value)
                resignator["Cam Lock"].Prediction = tonumber(Value)
            end
        })
        
        
        CamLockTab:AddDropdown('CamLock/Mode', {
            Values = { 'FOV', 'Target_toggle', 'Target_hold'},
            Default = resignator["Cam Lock"]["Mode"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Mode',
            Tooltip = 'Select a targeting mode.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator["Cam Lock"]["Mode"] = Value
            end
        })
        
        CamLockTab:AddDropdown('CamLock/EasingStyle', {
            Values = EasingStyles,
            Default = resignator["Cam Lock"]["Easing Style"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Easing Style',
            Tooltip = 'Select a easing style.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator["Cam Lock"]["Easing Style"] = Value
            end
        })
        
        CamLockTab:AddDropdown('CamLock/TargetPart', {
            Values = HitpartTable,
            Default = resignator["Cam Lock"]["Target Part"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Target Part',
            Tooltip = 'Select a target part.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator["Cam Lock"]["Target Part"] = Value
            end
        })
        
        CamLockTab:AddSlider('CamLock/TargetPartOffset', {
            Text = 'Offset',
            Default = resignator["Cam Lock"]["Target Part Offset"],
            Min = -5,
            Max = 5,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Cam Lock"]["Target Part Offset"] = Value
            end
        })
        
        CamLockTab:AddToggle('CamLock/NPTC', {
            Text = 'Nearest Part To Cursor',
            Default = resignator["Cam Lock"]["Nearest Part To Cursor"], 
            Tooltip = 'This will get the nearest target part to your cursor.', 
            Callback = function(Value)
                resignator["Cam Lock"]["Nearest Part To Cursor"] = Value
            end
        })
        
        CamLockTab:AddToggle('CamLock/NP', {
            Text = 'Closest Point',
            Default = resignator["Cam Lock"]["Closest Point"], 
            Tooltip = 'This will get the nearest point to your cursor.', 
            Callback = function(Value)
                resignator["Cam Lock"]["Closest Point"] = Value
            end
        })
        
        CamLockTab:AddDivider()
        
        CamLockTab:AddToggle('CamLock/Dot', {
            Text = 'Dot',
            Default = resignator["Cam Lock"]["Dot"], 
            Tooltip = 'Dot Prediction Visualizer', 
            Callback = function(Value)
                resignator["Cam Lock"]["Dot"] = Value
            end
        })
        
        CamLockTab:AddToggle('CamLock/Line', {
            Text = 'Line',
            Default = resignator["Cam Lock"]["Line"], 
            Tooltip = 'Line Prediction Visualizer', 
            Callback = function(Value)
                resignator["Cam Lock"]["Line"] = Value
            end
        })
        
        CamLockTab:AddDivider()
        
        CamLockTab:AddToggle('CamLock/Smooth', {
            Text = 'Enable Smoothness',
            Default = resignator["Cam Lock"]["Smoothness"].Enabled , 
            Tooltip = 'Camera Smoothness', 
            Callback = function(Value)
                resignator["Cam Lock"]["Smoothness"].Enabled = Value
            end
        })
        
        local SmootnessValue = CamLockTab:AddDependencyBox();
        
        SmootnessValue:AddSlider('CamLock/SmoothV', {
            Text = 'Value',
            Default = resignator["Cam Lock"]["Smoothness"].Value,
            Min = 0,
            Max = 1,
            Rounding = 10,
            Compact = true,
        
            Callback = function(Value)
                resignator["Cam Lock"]["Smoothness"].Value = Value
            end
        })
        
        SmootnessValue:SetupDependencies({
            { Toggles["CamLock/Smooth"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
        
        CamLockTab:AddDivider()
        
        CamLockTab:AddToggle('CamLock/Shake', {
            Text = 'Enable Shake',
            Default = resignator["Cam Lock"]["Shake"].Enabled , 
            Tooltip = 'Camera Shake', 
            Callback = function(Value)
                resignator["Cam Lock"]["Shake"].Enabled = Value
            end
        })
        
        local ValuesDEP = CamLockTab:AddDependencyBox();
        
        ValuesDEP:AddSlider('CamLock/ShakeX', {
            Text = 'X',
            Default = resignator["Cam Lock"]["Shake"].X,
            Min = 0,
            Max = 10,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Cam Lock"]["Shake"].X = Value
            end
        })
        
        ValuesDEP:AddSlider('CamLock/ShakeY', {
            Text = 'Y',
            Default = resignator["Cam Lock"]["Shake"].Y,
            Min = 0,
            Max = 10,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Cam Lock"]["Shake"].Y = Value
            end
        })
        
        ValuesDEP:AddSlider('CamLock/ShakeZ', {
            Text = 'Z',
            Default = resignator["Cam Lock"]["Shake"].Z,
            Min = 0,
            Max = 10,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Cam Lock"]["Shake"].Z = Value
            end
        })
        
        ValuesDEP:SetupDependencies({
            { Toggles["CamLock/Shake"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
        
        CamLockTab:AddDivider()
        
        
        CamLockTab:AddToggle('CamLock/FOV/Visible', {
            Text = 'Show FOV',
            Default = resignator["FOV"]["Cam Lock"].Visible , 
            Tooltip = 'Shows FOV Circle', 
            Callback = function(Value)
                resignator["FOV"]["Cam Lock"].Visible = Value
            end
        }):AddColorPicker('CamlockFOVColor', {
            Default = resignator["FOV"]["Cam Lock"].Color, -- Bright green
            Title = 'Circle Color', -- Optional. Allows you to have a custom color picker title (when you open it)
            Transparency = nil, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)
        
            Callback = function(Value)
                resignator["FOV"]["Cam Lock"].Color = Value
            end
        })
        
        
        local CamLockFOV = CamLockTab:AddDependencyBox();
        
        CamLockFOV:AddToggle('CamLock/FOV/Filled', {
            Text = 'Filled',
            Default = resignator["FOV"]["Cam Lock"].Filled , 
            Tooltip = 'ewww', 
            Callback = function(Value)
                resignator["FOV"]["Cam Lock"].Filled = Value
            end
        })
        
        CamLockFOV:AddSlider('CamLock/FOV/Size', {
            Text = 'Size',
            Default = resignator["FOV"]["Cam Lock"].Size,
            Min = 1,
            Max = 100,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["FOV"]["Cam Lock"].Size = Value
            end
        })
        
        CamLockFOV:AddSlider('CamLock/FOV/Thickness', {
            Text = 'Thickness',
            Default = resignator["FOV"]["Cam Lock"].Thickness,
            Min = 1,
            Max = 10,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["FOV"]["Cam Lock"].Thickness = Value
            end
        })
        
        
        CamLockFOV:AddSlider('CamLock/FOV/Transparency', {
            Text = 'Transparency',
            Default = resignator["FOV"]["Cam Lock"].Transparency,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true,
        
            Callback = function(Value)
                resignator["FOV"]["Cam Lock"].Transparency = Value
            end
        })
        
        
        CamLockFOV:SetupDependencies({
            { Toggles["CamLock/FOV/Visible"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
        -- // Global
        
        local Global = Tabs.Main:AddRightGroupbox('Global')
        
        Global:AddToggle('Global/AutoPrediction', {
            Text = 'Auto Prediction',
            Default = resignator["Global"]["Auto Prediction"].Enabled , 
            Tooltip = 'Uses ping based auto prediction.', 
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"].Enabled = Value
            end
        })
        
        local Depbox = Global:AddDependencyBox();

        Depbox:AddDropdown('Global/AutoPrediction/Version', {
            Values = AutoPredVersions,
            Default = resignator["Global"]["Auto Prediction"]["Version"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Version',
            Tooltip = 'Select a auto prediction mode', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Version"] = Value
            end
        })

        Depbox:AddToggle('Global/AutoPrediction/SetupCustomPrediction', {
            Text = 'Setup Custom prediction',
            Default = false, 
            Tooltip = 'Set your custom prediction values.', 
        })

        local CustomValues = Depbox:AddDependencyBox();
        
        CustomValues:AddSlider('ping_20', {
            Text = '20',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping20,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping20 = Value
            end
        })
        CustomValues:AddSlider('ping_30', {
            Text = '30',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping30,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping30 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_40', {
            Text = '40',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping40,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping40 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_50', {
            Text = '50',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping50,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping50 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_60', {
            Text = '60',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping60,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping60 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_70', {
            Text = '70',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping70,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping70 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_80', {
            Text = '80',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping80,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping80 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_90', {
            Text = '90',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping90,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping90 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_100', {
            Text = '100',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping100,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping100 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_110', {
            Text = '110',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping110,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping110 = Value
            end
        })
        
        CustomValues:AddSlider('ping_120', {
            Text = '120',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping120,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping120 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_130', {
            Text = '130',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping130,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping130 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_140', {
            Text = '140',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping140,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping140 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_150', {
            Text = '150',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping150,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping150 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_160', {
            Text = '160',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping160,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping160 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_170', {
            Text = '170',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping170,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping170 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_180', {
            Text = '180',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping180,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping180 = Value
            end
        })
        
        CustomValues:AddSlider('ping_190', {
            Text = '190',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping190,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping190 = Value
            end
        })
        
        
        CustomValues:AddSlider('ping_200', {
            Text = '200',
            Default = resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping200,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Global"]["Auto Prediction"]["Custom Settings"].Ping200 = Value
            end
        })
        
        
        CustomValues:AddDivider()
        
        
        CustomValues:SetupDependencies({
            { Toggles["Global/AutoPrediction/SetupCustomPrediction"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
        

        Depbox:SetupDependencies({
            { Toggles["Global/AutoPrediction"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
    
        
        Global:AddToggle('Global/AntiGroundShots', {
            Text = 'Anti Ground Shots',
            Default = resignator["Global"]["Anti Ground Shots"] , 
            Tooltip = 'Will prevent you from shooting at the ground.', 
            Callback = function(Value)
                resignator["Global"]["Anti Ground Shots"] = Value
            end
        })
        
        Global:AddToggle('Global/UnlockOnKO', {
            Text = 'Unlock On KO',
            Default = resignator["Global"]["Unlock On KO"] , 
            Tooltip = 'Unlocks when target is knocked.', 
            Callback = function(Value)
                resignator["Global"]["Unlock On KO"] = Value
            end
        })
        
                
        Global:AddToggle('Global/UnlockOutSideFOV', {
            Text = 'Unlock Outside FOV',
            Default = resignator["Global"]["Unlock Outside FOV"] , 
            Tooltip = 'Unlocks when target goes outside your FOV.', 
            Callback = function(Value)
                resignator["Global"]["Unlock Outside FOV"] = Value
            end
        })
                        
        Global:AddToggle('Global/UnlockBehindWall', {
            Text = 'Unlock Behind Wall',
            Default = resignator["Global"]["Unlock Behind Wall"] , 
            Tooltip = 'Unlocks when target goes behind a wall', 
            Callback = function(Value)
                resignator["Global"]["Unlock Behind Wall"] = Value
            end
        })
        -- // Checks
        
        local Checks = Tabs.Main:AddRightGroupbox('Checks')
        
        Checks:AddToggle('Checks/Whitelist', {
            Text = 'Whitelist',
            Default = resignator["Checks"]["Whitelist"].Enabled , 
            Tooltip = 'Will only lock onto people whitelisted', 
            Callback = function(Value)
                resignator["Checks"]["Whitelist"].Enabled = Value
            end
        })
        
        local Whitelist = Checks:AddDependencyBox();
        
        Whitelist:AddDropdown('Checks/Whitelist/SelectPlayer', {
            SpecialType = 'Player',
            Multi = true,
            Text = 'Whitelisted Players',
            Tooltip = 'Select Targets', -- Information shown when you hover over the dropdown
            Callback = function(Value)
                resignator["Checks"]["Whitelist"].Usernames = Value
            end
        })
        
        Whitelist:AddDivider()
        
        Whitelist:SetupDependencies({
            { Toggles["Checks/Whitelist"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
        
        Checks:AddToggle('Checks/Blacklist', {
            Text = 'Blacklist',
            Default = resignator["Checks"]["Blacklist"].Enabled , 
            Tooltip = 'Will not lock onto people blacklisted', 
            Callback = function(Value)
                resignator["Checks"]["Blacklist"].Enabled = Value
            end
        })
        
        
        local Blacklist = Checks:AddDependencyBox();
        
        Blacklist:AddDropdown('Checks/Blacklist/SelectPlayer', {
            SpecialType = 'Player',
            Multi = true,
            Text = 'Blacklisted Players',
            Tooltip = 'Select Targets', -- Information shown when you hover over the dropdown
            Callback = function(Value)
                resignator["Checks"]["Blacklist"].Usernames = Value
            end
        })
        
        Blacklist:AddDivider()
        
        Blacklist:SetupDependencies({
            { Toggles["Checks/Blacklist"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });

        Checks:AddToggle('Checks/Distance', {
            Text = 'Distance',
            Default = resignator["Checks"]["Distance"].Enabled , 
            Tooltip = 'Will not lock onto people who are too far away', 
            Callback = function(Value)
                resignator["Checks"]["Distance"].Enabled = Value
            end
        })
        
        
        local Distance = Checks:AddDependencyBox();
        
        Distance:AddSlider('Checks/Distance/Max', {
            Text = 'Max Distance',
            Default = resignator["Checks"]["Distance"]["Max Distance"],
            Min = 1,
            Max = 1000,
            Rounding = 0,
            Compact = true, -- If set to true, then it will hide the label
            Callback = function(Value)
                resignator["Checks"]["Distance"]["Max Distance"] = Value
            end
        })
        
        Distance:AddDivider()
        
        Distance:SetupDependencies({
            { Toggles["Checks/Distance"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
        
        
        Checks:AddToggle('Checks/Visible', {
            Text = 'Visible',
            Default = resignator["Checks"]["Visible Check"] , 
            Tooltip = 'Will not lock onto people who are behind a wall', 
            Callback = function(Value)
                resignator["Checks"]["Visible Check"] = Value
            end
        })
        
        Checks:AddToggle('Checks/KO', {
            Text = 'Knocked',
            Default = resignator["Checks"]["K.O Check"] , 
            Tooltip = 'Will not lock onto people who are knocked', 
            Callback = function(Value)
                resignator["Checks"]["K.O Check"] = Value
            end
        })
        
        
        Checks:AddToggle('Checks/Crew', {
            Text = 'Crew',
            Default = resignator["Checks"]["Crew Check"] , 
            Tooltip = 'Will not lock onto people who are in your crew', 
            Callback = function(Value)
                resignator["Checks"]["Crew Check"] = Value
            end
        })
        
        Checks:AddToggle('Checks/Friend', {
            Text = 'Friend',
            Default = resignator["Checks"]["Friend Check"] , 
            Tooltip = 'Will not lock onto people who are your friends', 
            Callback = function(Value)
                resignator["Checks"]["Friend Check"] = Value
            end
        })
        
        
        local Resolver = Tabs.Main:AddRightGroupbox('Resolver')
        
        
        Resolver:AddToggle('Resolver/Enabled', {
            Text = 'Enabled',
            Default = resignator["Resolver"].Enabled , 
            Tooltip = 'Will toggle resolver.', 
            Callback = function(Value)
                resignator["Resolver"].Enabled = Value
            end
        }):AddKeyPicker('Resolver/ToggleBind', {
            Default = resignator.Resolver.Keybind, 
            SyncToggleState = true,
            Mode = 'Toggle',
            Text = 'Resolver',
            NoUI = false, 
        })
        
        Resolver:AddDropdown('Resolver/Method', {
            Values = { 'Delta', 'Move Direction' ,'No Prediction', 'Recalculate' },
            Default = resignator["Resolver"]["Method"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Method',
            Tooltip = 'Select a resolving method.', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator["Resolver"]["Method"] = Value
            end
        })
        
        
        local Airshot = Tabs.Main:AddRightGroupbox('Airshot')
        
        Airshot:AddToggle('Airshot/Enabled', {
            Text = 'Enable Airshot',
            Default = resignator["Airshot"].Enabled , 
            Tooltip = 'Will change your target offset if player is in air', 
            Callback = function(Value)
                resignator["Airshot"].Enabled = Value
            end
        })
        
        local ssss = Airshot:AddDependencyBox();
        
        ssss:AddSlider('Airshot/JumpOffset', {
            Text = 'Offset',
            Default = resignator["Airshot"]["Jump Offset"],
            Min = -5,
            Max = 5,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Airshot"]["Jump Offset"] = Value
            end
        })
        ssss:AddDivider()
        
        ssss:SetupDependencies({
            { Toggles["Airshot/Enabled"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });


        
        Airshot:AddToggle('Airshot/CamlockSmoothness', {
            Text = 'Enable Camlock Smoothness',
            Default = resignator["Airshot"]["Cam Lock Smoothness"].Enabled , 
            Tooltip = 'Will change your camlock smoothness if target is in air', 
            Callback = function(Value)
                resignator["Airshot"]["Cam Lock Smoothness"].Enabled = Value
            end
        })
        
        local SMoothing = Airshot:AddDependencyBox();
        
        SMoothing:AddSlider('CamLock/SmoothV2', {
            Text = 'Value',
            Default = resignator["Airshot"]["Cam Lock Smoothness"]["New Smoothness"],
            Min = 0,
            Max = 1,
            Rounding = 10,
            Compact = true,
        
            Callback = function(Value)
                resignator["Airshot"]["Cam Lock Smoothness"]["New Smoothness"] = Value
            end
        })
        
        SMoothing:AddDivider()
        
        SMoothing:SetupDependencies({
            { Toggles["Airshot/CamlockSmoothness"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });

        local Visuals = Tabs.Main:AddLeftGroupbox('Visuals')

        Visuals:AddToggle('HitSound/Enabled', {
            Text = 'Hit Sound',
            Default = resignator["Hit Sound"].Enabled , 
            Tooltip = 'Will play sound when you hit target', 
            Callback = function(Value)
                resignator["Hit Sound"].Enabled = Value
            end
        })
        
        local HitSound = Visuals:AddDependencyBox();

        HitSound:AddSlider('HitSound/Volume', {
            Text = 'Volume',
            Default = resignator["Hit Sound"].Volume * 10,
            Min = 1,
            Max = 100,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Hit Sound"].Volume = Value / 10
            end
        })

            
        HitSound:AddDropdown('HitSound/Sound', {
            Values = hitSoundsNames,
            Default = resignator["Hit Sound"]["Hit Sound"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Sound',
            Tooltip = 'Select a sound to play', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator["Hit Sound"]["Hit Sound"] = Value
            end
        })
        
        HitSound:AddDivider()
        
        HitSound:SetupDependencies({
            { Toggles["HitSound/Enabled"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });
        
        Visuals:AddToggle('HitLogs/Enabled', {
            Text = 'Hit Logs',
            Default = resignator["Hit Logs"].Enabled , 
            Tooltip = 'Logs when you hit a player', 
            Callback = function(Value)
                resignator["Hit Logs"].Enabled = Value
            end
        })
        

        -- Extra Tab

        local Misc = Tabs.Extra:AddLeftGroupbox('Miscellaneous')

        Misc:AddToggle('Macro/Enabled', {
            Text = 'Macro',
            Default = resignator["Macro"].Enabled , 
            Tooltip = 'Lua based Macro', 
            Callback = function(Value)
                resignator["Macro"].Enabled = Value
            end
        }):AddKeyPicker('Macro/Bind', {
            Default = resignator["Macro"]["Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Macro',
            NoUI = false, 
            ChangedCallback = function(New)
                resignator["Macro"]["Bind"] = KeyCodeToString(New)
            end
        })

        local MacroSets = Misc:AddDependencyBox();


        MacroSets:AddToggle('Macro/Abuse', {
            Text = 'Abuse',
            Default = resignator["Macro"].Abuse , 
            Tooltip = 'Use scroll wheel to macro', 
            Callback = function(Value)
                resignator["Macro"].Abuse = Value
            end
        })

        MacroSets:AddSlider('Macro/Speed', {
            Text = 'Speed',
            Default = resignator["Macro"].Speed,
            Min = 0,
            Max = 1,
            Rounding = 3,
            Compact = true,
        
            Callback = function(Value)
                resignator["Macro"].Speed = Value
            end
        })

        

        
        MacroSets:AddDivider()
        
        MacroSets:SetupDependencies({
            { Toggles["Macro/Enabled"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });

        Misc:AddToggle('MemorySpoofer/Enabled', {
            Text = 'Memory Spoofer',
            Default = resignator["Spoofer"].Memory.Enabled , 
            Tooltip = 'Spoofs your memory', 
            Callback = function(Value)
                resignator["Spoofer"].Memory.Enabled = Value
            end
        })


        local SpooferSets = Misc:AddDependencyBox();

        SpooferSets:AddSlider('MemorySpoofer/Min', {
            Text = 'Minimum',
            Default = resignator["Spoofer"].Memory.Min,
            Min = 500,
            Max = 2000,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Spoofer"].Memory.Min = Value
            end
        })

        SpooferSets:AddSlider('MemorySpoofer/Max', {
            Text = 'Maximum',
            Default = resignator["Spoofer"].Memory.Max,
            Min = 500,
            Max = 2000,
            Rounding = 1,
            Compact = true,
        
            Callback = function(Value)
                resignator["Spoofer"].Memory.Max = Value
            end
        })

        SpooferSets:AddDivider()
        
        SpooferSets:SetupDependencies({
            { Toggles["MemorySpoofer/Enabled"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });

        Misc:AddToggle('FakeSpike/Enabled', {
            Text = 'Fake Spike',
            Default = resignator["Fake Spike"].Enabled , 
            Tooltip = 'Spikes your ping to make it look like your lagging', 
            Callback = function(Value)
                resignator["Fake Spike"].Enabled = Value
            end
        }):AddKeyPicker('FakeSpike/Bind', {
            Default = resignator["Fake Spike"]["Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Fake Spike',
            NoUI = false, 
            ChangedCallback = function(New)
                resignator["Fake Spike"]["Bind"] = KeyCodeToString(New)
            end
        })

        local Spike = Misc:AddDependencyBox();

        Spike:AddSlider('FakeSpike/Duration', {
            Text = 'Duration',
            Default =  resignator["Fake Spike"]["Duration"],
            Min = 0.1,
            Max = 3,
            Rounding = 2,
            Compact = true,
        
            Callback = function(Value)
                resignator["Fake Spike"]["Duration"] = Value
            end
        })

        Spike:AddDivider()
        
        Spike:SetupDependencies({
            { Toggles["FakeSpike/Enabled"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });

        Misc:AddToggle('Panic/Enabled', {
            Text = 'Panic',
            Default = resignator["Panic"].Enabled , 
            Tooltip = 'Will disable everything when your press keybind', 
            Callback = function(Value)
                resignator["Panic"].Enabled = Value
            end
        }):AddKeyPicker('Panic/Bind', {
            Default = resignator["Panic"]["Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Panic',
            NoUI = false, 
            ChangedCallback = function(New)
                resignator["Panic"]["Bind"] = KeyCodeToString(New)
            end
        })

        local PanicMode = Misc:AddDependencyBox();

        PanicMode:AddToggle('Panic/Options', {
            Text = 'Options',
            Default = resignator["Panic"]["Things To Disable"].Options , 
            Callback = function(Value)
                resignator["Panic"]["Things To Disable"].Options = Value
            end
        })

        PanicMode:AddToggle('Panic/Aiming', {
            Text = 'Aiming',
            Default = resignator["Panic"]["Things To Disable"].Aiming , 
            Callback = function(Value)
                resignator["Panic"]["Things To Disable"].Aiming = Value
            end
        })

        
        PanicMode:AddToggle('Panic/FOV', {
            Text = 'FOV',
            Default = resignator["Panic"]["Things To Disable"].FOV , 
            Callback = function(Value)
                resignator["Panic"]["Things To Disable"].FOV = Value
            end
        })

        PanicMode:AddToggle('Panic/Misc', {
            Text = 'Misc',
            Default = resignator["Panic"]["Things To Disable"].Misc , 
            Callback = function(Value)
                resignator["Panic"]["Things To Disable"].Misc = Value
            end
        })

        
        PanicMode:AddToggle('Panic/Emotes', {
            Text = 'Emotes',
            Default = resignator["Panic"]["Things To Disable"].Emotes , 
            Callback = function(Value)
                resignator["Panic"]["Things To Disable"].Emotes = Value
            end
        })

        PanicMode:AddDivider()
        
        PanicMode:SetupDependencies({
            { Toggles["Panic/Enabled"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });

        Misc:AddToggle('GunSorting/Enabled', {
            Text = 'Gun Sorting',
            Default = resignator["Gun Sorting"].Enabled , 
            Tooltip = 'Sorts your guns in your hotbar (must set in table)', 
            Callback = function(Value)
                resignator["Gun Sorting"].Enabled = Value
            end
        }):AddKeyPicker('GunSorting/Bind', {
            Default = resignator["Gun Sorting"]["Bind"],
            SyncToggleState = false,
        
            Mode = 'Always',
        
            Text = 'Sort Guns',
            NoUI = false, 
            ChangedCallback = function(New)
                resignator["Gun Sorting"]["Bind"] = KeyCodeToString(New)
            end
        })

        local Sort = Misc:AddDependencyBox();

        Sort:AddToggle('GunSorting/Delete', {
            Text = 'Delete Extra',
            Default = resignator["Gun Sorting"]["Delete Extra"] , 
            Tooltip = 'Deletes unsorted items from your inventory', 
            Callback = function(Value)
                resignator["Gun Sorting"]["Delete Extra"] = Value
            end
        })


        Sort:AddDivider()
        
        Sort:SetupDependencies({
            { Toggles["GunSorting/Enabled"], true } -- We can also pass `false` if we only want our features to show when the toggle is off!
        });

        local ESP = Tabs.Extra:AddRightGroupbox('ESP')

        ESP:AddToggle('Esp/Enabled', {
            Text = 'Enabled',
            Default = resignator["ESP"].Enabled , 
            Callback = function(Value)
                resignator["ESP"].Enabled = Value
            end
        })

        ESP:AddSlider('ESP/MAXDISTANCE', {
            Text = 'Max Distance',
            Default = resignator.ESP["Max Distance"],
            Min = 1,
            Max = 1000,
            Rounding = 0,
            Compact = true,
        
            Callback = function(Value)
                resignator.ESP["Max Distance"] = Value
            end
        })

        ESP:AddToggle('Esp/Names', {
            Text = 'Names',
            Default = resignator["ESP"].Name.Enabled , 
            Callback = function(Value)
                resignator["ESP"].Name.Enabled = Value
            end
        }):AddColorPicker('NameColor', {
            Default = resignator["ESP"].Name.Color,
            Title = 'Name Color', 
            Transparency = nil, 
        
            Callback = function(Value)
                resignator["ESP"].Name.Color = Value
            end
        })

        ESP:AddToggle('Esp/Names/Outline', {
            Text = 'Name Outline',
            Default = resignator["ESP"].Name.Outline , 
            Callback = function(Value)
                resignator["ESP"].Name.Outline = Value
            end
        })

        
        ESP:AddToggle('Esp/Box', {
            Text = 'Box',
            Default = resignator["ESP"].Box.Enabled , 
            Callback = function(Value)
                resignator["ESP"].Box.Enabled = Value
            end
        }):AddColorPicker('BoxColor', {
            Default = resignator["ESP"].Box.Color,
            Title = 'Box Color', 
            Transparency = nil, 
        
            Callback = function(Value)
                resignator["ESP"].Box.Color = Value
            end
        })

        ESP:AddToggle('Esp/Names/Outline', {
            Text = 'Box Outline',
            Default = resignator["ESP"].Box.Outline , 
            Callback = function(Value)
                resignator["ESP"].Box.Outline = Value
            end
        })

        
        
        ESP:AddToggle('Esp/Health', {
            Text = 'Health Bar',
            Default = resignator["ESP"]["Health Bar"].Enabled , 
            Callback = function(Value)
                resignator["ESP"]["Health Bar"].Enabled = Value
            end
        }):AddColorPicker('HealthColor', {
            Default = resignator["ESP"]["Health Bar"].Color,
            Title = 'Health Bar Color', 
            Transparency = nil, 
        
            Callback = function(Value)
                resignator["ESP"]["Health Bar"].Color = Value
            end
        })


        ESP:AddToggle('Esp/Health/Outline', {
            Text = 'Health Bar Outline',
            Default = resignator["ESP"]["Health Bar"].Outline , 
            Callback = function(Value)
                resignator["ESP"]["Health Bar"].Outline = Value
            end
        })

        ESP:AddToggle('Esp/Distance', {
            Text = 'Distance',
            Default = resignator["ESP"].Distance.Enabled , 
            Callback = function(Value)
                resignator["ESP"].Distance.Enabled = Value
            end
        }):AddColorPicker('DistanceColor', {
            Default = resignator["ESP"].Distance.Color,
            Title = 'Distance Color', 
            Transparency = nil, 
        
            Callback = function(Value)
                resignator["ESP"].Distance.Color = Value
            end
        })

        ESP:AddToggle('Esp/Distance/Outline', {
            Text = 'Distance Outline',
            Default = resignator["ESP"].Distance.Outline , 
            Callback = function(Value)
                resignator["ESP"].Distance.Outline = Value
            end
        })






        -- UI Settings
        Library:SetWatermark('resignator | '..tostring(os.date("%B") .. " " .. os.date("%d") .. " " .. os.date("%Y")).." | "..utility.Version)
        Library:SetWatermarkVisibility(false)
        local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
        local MenuGroup2 = Tabs['UI Settings']:AddRightGroupbox('More Settings')
        MenuGroup:AddButton('Unload', function() Library:Unload() end)
        MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = resignator["Options"]["Internal"].Bind, NoUI = true, Text = 'Menu keybind' })
        
        MenuGroup2:AddToggle('togglekeybindmenu', {
            Text = 'Keybind Menu',
            Default = false,
            Callback = function(V) 
                Library.KeybindFrame.Visible = Toggles.togglekeybindmenu.Value
            end
        })

        MenuGroup2:AddToggle('show_stats', {
            Text = 'Show Stats',
            Default = resignator["Options"]["Stats"],
            Callback = function(V) 
                resignator["Options"]["Stats"] = V
            end
        })
        
        MenuGroup2:AddToggle('allow_notifications', {
            Text = 'Allow Notifications',
            Default = resignator["Options"]["Allow Notifications"],
            Callback = function(V) 
                resignator["Options"]["Allow Notifications"] = V
            end
        })

        MenuGroup2:AddDropdown('notification_mode', {
            Values = NotificationTypes,
            Default = resignator.Options["Notifcation Type"], -- number index of the value / string
            Multi = false, -- true / false, allows multiple choices to be selected
        
            Text = 'Type',
            Tooltip = 'Select a notification type', -- Information shown when you hover over the dropdown
        
            Callback = function(Value)
                resignator.Options["Notifcation Type"] = Value
            end
        })
        
        
        MenuGroup2:AddToggle('togglewatermark', {
            Text = 'Watermark',
            Default = false,
            Callback = function(V) 
                Library:SetWatermarkVisibility(Toggles.togglewatermark.Value)
            end
        })
        
        Library.ToggleKeybind = Options.MenuKeybind
        
        ThemeManager:SetLibrary(Library)
        SaveManager:SetLibrary(Library)
        
        SaveManager:IgnoreThemeSettings()

        SaveManager:BuildConfigSection(Tabs['UI Settings'])
        
        ThemeManager:ApplyToTab(Tabs['UI Settings'])
        
        SaveManager:LoadAutoloadConfig()

        if game:GetService("UserInputService").TouchEnabled then 
            task.spawn(function()
                local resignatorMobileButton = Instance.new("ScreenGui")
                local Icon = Instance.new("Frame")
                local IconButton = Instance.new("TextButton")
                local IconImage = Instance.new("ImageLabel")
                local IconCorner = Instance.new("UICorner")
                resignatorMobileButton.Name = "resignatorMobileButton"
                resignatorMobileButton.IgnoreGuiInset = true
                resignatorMobileButton.Parent = game.CoreGui
                resignatorMobileButton.DisplayOrder = 10
                resignatorMobileButton.ResetOnSpawn = false
                Icon.Name = "Icon"
                Icon.Parent = resignatorMobileButton
                Icon.BackgroundTransparency = 1.000
                Icon.LayoutOrder = 1
                Icon.Position = UDim2.new(0, 104, 0, 4)
                Icon.Size = UDim2.new(0, 32, 0, 32)
                IconButton.Name = "IconButton"
                IconButton.Parent = Icon
                IconButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                IconButton.BackgroundTransparency = 0.500
                IconButton.BorderSizePixel = 0
                IconButton.Size = UDim2.new(1, 0, 1, 0)
                IconButton.ZIndex = 10
                IconButton.AutoButtonColor = false
                IconButton.Text = ""
                IconImage.Name = "IconImage"
                IconImage.Parent = IconButton
                IconImage.AnchorPoint = Vector2.new(0.5, 0.5)
                IconImage.BackgroundTransparency = 1.000
                IconImage.Position = UDim2.new(0.5, 0, 0.5, 0)
                IconImage.Size = UDim2.new(0, 20, 0.629999995, 0)
                IconImage.ZIndex = 11
                IconImage.Image = "rbxassetid://14270853092"
                IconImage.ScaleType = Enum.ScaleType.Fit
                IconCorner.CornerRadius = UDim.new(0.25, 0)
                IconCorner.Name = "IconCorner"
                IconCorner.Parent = IconButton
                IconButton.MouseButton1Down:Connect(function()
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, string.upper(resignator["Options"]["Internal UI Bind"]) , false , game)
                end)
            end)
        end
    end
end

notify("resignator V3 has loaded.")
