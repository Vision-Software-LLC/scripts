local utils = {}

-- // Version
utils.Version = '1.3.0-beta'

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
utils.Health = utils.Humanoid.Health
utils.UserId = utils.Player.UserId
utils.Mouse = utils.Player:GetMouse()
utils.Displayname = utils.Player.DisplayName
utils.Username = utils.Player.Name
utils.Age = utils.Player.AccountAge
utils.State = utils.Humanoid:GetState()
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
  utils.Stats.FPS = math.round(1 / delta)
  utils.Stats.Memory = math.round(game:GetService('Stats'):GetTotalMemoryUsageMb())
  utils.Stats.Ping = math.round(tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), ' ')[1]))
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
    return loadstring(game:HttpGet(url))()
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

log('info', 'Initialized.')

print(unpack(utils:FindObj('DoMoNiCgt', true)))

--return utils;
