local utils = {}

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
utils.PlayerCount = tostring(#utils.Players:GetPlayers())
utils.FOV = utils.Camera.FieldOfView
utils.Health = utils.Humanoid.Health
utils.UserId = utils.Player.UserId
utils.Mouse = utils.Player:GetMouse()
utils.Displayname = utils.Player.DisplayName
utils.Name = utils.Player.Name
utils.Age = utils.Player.AccountAge
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

coroutine.wrap(function()
    local RunService = game:GetService("RunService")
    local TimeFunction = RunService:IsRunning() and time or os.clock
    
    local LastIteration, Start
    local FrameUpdateTable = {}
    
    local function HeartbeatUpdate()
        LastIteration = TimeFunction()
        for Index = #FrameUpdateTable, 1, -1 do
            FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
        end
    
        FrameUpdateTable[1] = LastIteration
        utils.Stats.FPS = tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))
    end
    
    Start = TimeFunction()
    local rFPS = RunService.Heartbeat:Connect(HeartbeatUpdate)
end)()

-- // Functions
local function log(type, message)
    if type == "info" then
        print("[Vision/Utils] " .. tostring(message))
    elseif type == "warn" then
        warn("[Vision/Utils] " .. tostring(message))
    elseif type == "error" then
        warn('[Vision/Utils] ERROR: ' .. tostring(message))
    end
end


function utils:LoadURL(url)
    local success, err = pcall( function() loadstring(game:HttpGet(url))() end )
    if not success then
        log("error", err)
    end
end

function utils:Try(func, name, verbose)
    local success, err = pcall(function() loadstring(func) end)
    if not success and verbose then
        log("error", string.format("%s failed to execute, Error: %s", name, err))
    elseif success and verbose then
        log("info", string.format("%s successfully executed.", name))
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

return utils;