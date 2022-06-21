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
utils.UserInputService
utils.TweenService

--[[

Players                  -- Players Service
ReplicatedStorage        -- ReplicatedStorage Service
RunService               -- RunService
UserInputService         -- UserInputService
TweenService             -- TweenService

--]]
```

## Variables
```lua
utils.Player
utils.Character
utils.Humanoid
utils.HRP
utils.Camera
utils.PlayerCount
utils.FOV
utils.Health
utils.UserId
utils.Mouse
utils.Displayname
utils.Name
utils.Age
utils.Uptime
utils.Stats

--[[

Player                   -- LocalPlayer
Character                -- LocalPlayer's Character
Humanoid                 -- LocalPlayer's Humanoid
HRP                      -- LocalPlayer's HumanoidRootPart
Camera                   -- LocalPlayer's Camera
PlayerCount              -- Number of players in your server
FOV                      -- LocalPlayer's FOV
Health                   -- LocalPlayer's Health
UserId                   -- LocalPlayer's UserId
Mouse                    -- LocalPlayer's Mouse
Displayname              -- LocalPlayer's Displayname
Name                     -- LocalPlayer's Name
Age                      -- LocalPlayer's account age
Uptime                   -- Client Uptime Table
                           {
                               Uptime.Days       -- Client uptime in days
                               Uptime.Hours      -- Client uptime in hours
                               Uptime.Minutes    -- Client uptime in minutes
                               Uptime.Seconds    -- Client uptime in seconds
                               Uptime.Formatted  -- Formatted client uptime.  E.g. 00  :  00  :   00   :  00
                           }                                                      Days  Hours  Minutes  Seconds
                           
Stats                    -- Statistics Table
                           {
                               Stats.FPS         -- Client frames per second
                               Stats.Memory      -- Client memory usage
                               Stats.Ping        -- Client ping
                           }

--]]
```

## Functions
```lua
utils:LoadURL(url)
utils:Try(function, name, verbose)
utils:GetExecutor()

--[[

LoadURL                  -- Used to load a script from a url
Try                      -- Used for debugging functions. Will log according to the state of execution; Successful or failure.
GetExecutor              -- Returns the current executor. 15 different possible executors that can be returned, if a executor is not in the list, it will return 'Undetectable'.

--]]
```
