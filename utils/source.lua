local utils = {}

-- // Version
utils.Version = '1.6.2b'

-- // Services
utils.Players = game:GetService("Players")
utils.ReplicatedStorage = game:GetService("ReplicatedStorage")
utils.RunService = game:GetService("RunService")
utils.UserInputService = game:GetService("UserInputService")
utils.TweenService = game:GetService("TweenService")

-- // Variables
utils.Player = utils.Players.LocalPlayer
utils.Character = utils.Player.Character
utils.Humanoid = utils.Character:FindFirstChild("Humanoid")
utils.HRP = utils.Character:FindFirstChild("HumanoidRootPart")
utils.Camera = workspace.CurrentCamera
utils.CoreGui = game:GetService("CoreGui")
utils.PlayerCount = tostring(#utils.Players:GetPlayers())
utils.FOV = utils.Camera.FieldOfView
utils.UserId = utils.Player.UserId
utils.Mouse = utils.Player:GetMouse()
utils.Displayname = utils.Player.DisplayName
utils.Username = utils.Player.Name
utils.Age = utils.Player.AccountAge
utils.TeamColor = utils.Player.TeamColor
if utils.Humanoid ~= nil then
    utils.Health = utils.Humanoid.Health
    utils.State = utils.Humanoid:GetState()
    utils.WalkSpeed = utils.Humanoid.WalkSpeed
    utils.JumpPower = utils.Humanoid.JumpPower
    utils.MaxHealth = utils.Humanoid.MaxHealth
end

utils.Icons = {
    FluentIcons = {
		Home = "rbxassetid://9792462652",
		Aimbot = "rbxassetid://9766671041",
		Visuals = "rbxassetid://9766673555",
		Player = "rbxassetid://9766672602",
		Misc = "rbxassetid://9766671943",
		Settings = "rbxassetid://9766674082",
		Credits = "rbxassetid://9766675093",
		Exit = "rbxassetid://9766676906"
	},
	FeatherIcons = {
		Home = "rbxassetid://9792650361",
		Aimbot = "rbxassetid://9792632523",
		Visuals = "rbxassetid://9792631281",
		Player = "rbxassetid://9792631906",
		Misc = "rbxassetid://9792634811",
		Settings = "rbxassetid://9792633222",
		Credits = "rbxassetid://9792634075",
		Exit = "rbxassetid://9792635572"
	},
	NotificationIcons = {
		Success = "rbxassetid://9838874163",
		Warning = "rbxassetid://9838873385",
		Error = "rbxassetid://9838876113",
		Informational = "rbxassetid://9838877673",
		Custom = "rbxassetid://9838878267"
	},
	VisionLogo = "rbxassetid://10006089373"
}


utils.Uptime = {
    Days = math.floor( elapsedTime() / 86400 ),
    Hours = math.floor( elapsedTime() / 3600 ),
    Minutes = math.floor( elapsedTime() / 60 ),
    Seconds = math.floor( elapsedTime() ),
    Formatted = string.format( "%02dd:%02dh:%02dm:%02ds", math.floor( elapsedTime() / 86400 % 24 ),  math.floor( elapsedTime() / 3600 % 60 ), math.floor( elapsedTime() / 60 % 60 ), math.floor( elapsedTime() % 60 ) )
}


utils.Stats = {
    FPS = 60,
    Memory = math.round(game:GetService('Stats'):GetTotalMemoryUsageMb()),
    Ping = math.round(tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), ' ')[1]))
}

utils.RunService.RenderStepped:Connect(function (delta)
    -- // Stats Refresh
    utils.Stats.FPS = math.round(1 / delta)
    utils.Stats.Memory = math.round(game:GetService('Stats'):GetTotalMemoryUsageMb())
    utils.Stats.Ping = math.round(tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), ' ')[1]))

end)

task.spawn(function()
    while task.wait() do
        -- // Variables Refresh
    utils.Player = utils.Players.LocalPlayer
    utils.Character = utils.Player.Character
    utils.Humanoid = utils.Character:FindFirstChildWhichIsA("Humanoid")
    utils.HRP = utils.Character:FindFirstChild("HumanoidRootPart")
    utils.Camera = workspace.CurrentCamera
    utils.CoreGui = game:GetService("CoreGui")
    utils.PlayerCount = tostring(#utils.Players:GetPlayers())
    utils.FOV = utils.Camera.FieldOfView
    utils.UserId = utils.Player.UserId
    utils.Mouse = utils.Player:GetMouse()
    utils.Displayname = utils.Player.DisplayName
    utils.Username = utils.Player.Name
    utils.Age = utils.Player.AccountAge
    utils.TeamColor = utils.Player.TeamColor
    if utils.Humanoid ~= nil then
        utils.Health = utils.Humanoid.Health
        utils.State = utils.Humanoid:GetState()
        utils.WalkSpeed = utils.Humanoid.WalkSpeed
        utils.JumpPower = utils.Humanoid.JumpPower
        utils.MaxHealth = utils.Humanoid.MaxHealth
    end
    -- // Uptime Refresh
    utils.Uptime.Days = math.floor( elapsedTime() / 86400 )
    utils.Uptime.Hours = math.floor( elapsedTime() / 3600 )
    utils.Uptime.Minutes = math.floor( elapsedTime() / 60 )
    utils.Uptime.Seconds = math.floor( elapsedTime() )
    utils.Uptime.Formatted = string.format( "%02dd:%02dh:%02dm:%02ds", math.floor( elapsedTime() / 86400 % 24 ),  math.floor( elapsedTime() / 3600 % 60 ), math.floor( elapsedTime() / 60 % 60 ), math.floor( elapsedTime() % 60 ) )
    end
end)

-- // Functions
local function log( type, message )
    if type == "info" then
        print("[Vision/Utils] INFO: " .. tostring(message))
    elseif type == "warn" then
        warn("[Vision/Utils] WARNING: " .. tostring(message))
    elseif type == "error" then
        warn('[Vision/Utils] ERROR: ' .. tostring(message))
    end
end


function utils:LoadUrl( url )
    return loadstring(game:HttpGetAsync(url))()
end

function utils:Try( func, name, verbose )
    local success, err = pcall(function() func() end)
    if not success and verbose then
        log("error", string.format('Function "%s" failed to run, Error: %s', name, err))
    elseif success and verbose then
        log("info", string.format('Function "%s" ran successfully!', name))
    end
end

function utils:GetExecutor()
    local exploit =
    (syn and syn.protect_gui and not getexecutorname and not is_sirhurt_closure and not pebc_execute and "Synapse X") or
    (getexecutorname and identifyexecutor and gethui and "ScriptWare") or
    (secure_load and "Sentinel") or
    (is_sirhurt_closure and "Sirhurt") or
    (pebc_execute and "ProtoSmasher") or
    (KRNL_LOADED and "Krnl") or
    (WrapGlobal and "WeAreDevs") or
    (isvm and "Proxo") or
    (shadow_env and "Shadow") or
    (jit and "EasyExploits") or
    (getreg()['CalamariLuaEnv'] and "Calamari") or
    (unit and "Unit") or
    (IS_VIVA_LOADED and "VIVA") or
    (IS_COCO_LOADED and "Coco") or
    ("Undetectable")
    return exploit
end

function utils:FindObj( name, showall )
    showall = showall or false

    local starttime = tick()
    if not showall then
        local v = game:FindFirstChild(name, true)
            if v and v.Name == name then
                local timetaken = string.sub((tick()) - (starttime), 1, 4)
                log('info', 'Found object: "' .. name .. '" in ' .. timetaken .. ' ms.')
                return v
            else
                return log('warn', 'Object not found: "' .. name .. '"')
            end
    else
        local found = {}
        for _,v in pairs( workspace:GetDescendants(), utils.ReplicatedStorage:GetDescendants(), utils.CoreGui:GetDescendants() ) do
            if v.Name == name then
                local timetaken = string.sub((tick()) - (starttime), 1, 4)
                log('info', 'Found object: "' .. name .. '" in ' .. timetaken .. ' ms.')
                table.insert(found, v)
            end
        end
        return found
        end
end

function utils:FindCharacter( name )
    local starttime = tick()
    local v = game:FindFirstChild(name, true)
        if v and v.Name == name and v.Humanoid then
            local timetaken = string.sub((tick()) - (starttime), 1, 4)
            log('info', 'Found character of "' .. name .. '" in ' .. timetaken .. ' ms.')
            return v
        else
            return log('warn', 'Character not found: "' .. name .. '"')
        end
end

-- This may be completely useless, but I'm leaving it here for now.
-- Also, it's not even really finished.
function utils:Tree()
    local workspaceChildren = workspace:GetChildren()
    local output
    if #workspace:GetChildren() == 0 then output = "- Workspace" else output = "V Workspace" end
    for i = 1, #workspaceChildren do
        local prefix = "V"
        if #workspaceChildren[i]:GetChildren() == 0 then prefix = "-" end
        output = output .. '\n \t ' .. prefix .. ' ' .. workspaceChildren[i].Name
        for _,v in ipairs(workspaceChildren[i]:GetChildren()) do
            local prefix = ">"
            if #v:GetChildren() == 0 then prefix = "-" else prefix = "V" end
            output = output .. "\n" .. "\t\t " .. prefix .. ' ' .. v.Name
        end
    end
    return output
end


if not getgenv().visionlive then log('info', 'Initialized Version ' .. utils.Version) end

return utils;
