# Vision Utility Module

## Loading the Module
```lua
local utils = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vision-Software-LLC/scripts/main/utils/source.lua"))()
```

## Services
```lua
utils.Players
utils.ReplicatedStorage
utils.RunService
utils.TweenService
utils.UserInputService

--[[

Players                  -- Players Service
ReplicatedStorage        -- ReplicatedStorage Service
RunService               -- RunService
TweenService             -- TweenService
UserInputService         -- UserInputService

--]]
```

## Variables
```lua
utils.Age
utils.Camera
utils.Character
utils.Displayname
utils.FOV
utils.HRP
utils.Health
utils.Humanoid
utils.Mouse
utils.Player
utils.PlayerCount
utils.State
utils.Stats
utils.Uptime
utils.UserId
utils.Username

--[[

Age                      -- LocalPlayer's account age
Camera                   -- LocalPlayer's Camera
Character                -- LocalPlayer's Character
Displayname              -- LocalPlayer's Displayname
FOV                      -- LocalPlayer's FOV
HRP                      -- LocalPlayer's HumanoidRootPart
Health                   -- LocalPlayer's Health
Humanoid                 -- LocalPlayer's Humanoid
Mouse                    -- LocalPlayer's Mouse
Name                     -- LocalPlayer's Name
Player                   -- LocalPlayer
PlayerCount              -- Number of players in your server
State                    -- State of LocalPlayer's Humanoid (ex. Jumping)
Stats                    -- Statistics Table
                           {
                               Stats.FPS         -- Client frames per second
                               Stats.Memory      -- Client memory usage
                               Stats.Ping        -- Client ping
                           }                   
Uptime                   -- Client Uptime Table
UserId                   -- LocalPlayer's UserId
                           {
                               Uptime.Days       -- Client uptime in days
                               Uptime.Hours      -- Client uptime in hours
                               Uptime.Minutes    -- Client uptime in minutes
                               Uptime.Seconds    -- Client uptime in seconds
                               Uptime.Formatted  -- Formatted client uptime.  E.g. 00  :  00  :   00   :  00
                           }                                                      Days  Hours  Minutes  Seconds
Username                 -- LocalPlayer's @Username

--]]
```

## Functions
```lua
utils:LoadUrl(<string> url)
utils:Try(<function>, <string> name, <bool> verbose)
utils:GetExecutor()
utils:FindObj(<string> name, <bool?> showall)

--[[

LoadUrl                  -- Used to load a script from a url
Try                      -- Used for debugging functions. Will log according to the state of execution; Successful or failure.
GetExecutor              -- Returns the current executor. 15 different possible executors that can be returned, if a executor is not in the list, it will return 'Undetectable'.
FindObj                  -- Returns the first Instance matching name. If showall is true, returns a table of instances matching name within workspace, ReplicatedStorage, and CoreGui.
--]]
```
