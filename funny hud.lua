-- Gui to Lua
-- Version: 3.2

-- Instances:

local HUD = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local avatar = Instance.new("ImageLabel")
local displayname = Instance.new("TextLabel")
local username = Instance.new("TextLabel")

--Properties:

HUD.Name = "HUD"
if syn then syn.protect_gui(HUD) warn( '[Vision] GUI Protected by Synapse X' ) end
HUD.Parent = game:GetService("CoreGui")
HUD.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = HUD
main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
main.Position = UDim2.new(0.0198019799, 0, 0.796603084, 0)
main.Size = UDim2.new(0.270905644, 0, 0.184598953, 0)

UICorner.CornerRadius = UDim.new(0.219999999, 0)
UICorner.Parent = main

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(33, 33, 33)), ColorSequenceKeypoint.new(0.55, Color3.fromRGB(41, 19, 76)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(97, 24, 107))}
UIGradient.Rotation = 30
UIGradient.Parent = main

avatar.Name = "avatar"
avatar.Parent = main
avatar.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
avatar.Position = UDim2.new(0.0698689967, 0, 0.195767194, 0)
avatar.Size = UDim2.new(0.248908296, 0, 0.603174627, 0)
avatar.Image = string.format('https://www.roblox.com/headshot-thumbnail/image?userId=%s&width=420&height=420&format=png', game:GetService("Players").LocalPlayer.UserId)

local UICorner_2 = Instance.new("UICorner")
UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = avatar


displayname.Name = "displayname"
displayname.Parent = main
displayname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
displayname.BackgroundTransparency = 1.000
displayname.BorderSizePixel = 0
displayname.Position = UDim2.new(0.351528466, 0, 0.238095224, 0)
displayname.Size = UDim2.new(0.626637578, 0, 0.338624328, 0)
displayname.Font = Enum.Font.SourceSans
displayname.Text = game:GetService("Players").LocalPlayer.DisplayName
displayname.TextColor3 = Color3.fromRGB(255, 255, 255)
displayname.TextScaled = true
displayname.TextSize = 14.000
displayname.TextWrapped = true

username.Name = "username"
username.Parent = main
username.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
username.BackgroundTransparency = 1.000
username.BorderSizePixel = 0
username.Position = UDim2.new(0.371179074, 0, 0.539682567, 0)
username.Size = UDim2.new(0.587336302, 0, 0.129100591, 0)
username.Font = Enum.Font.SourceSans
username.Text = '@' .. game:GetService("Players").LocalPlayer.Name
username.TextColor3 = Color3.fromRGB(255, 255, 255)
username.TextScaled = true
username.TextSize = 14.000
username.TextTransparency = 0.300
username.TextWrapped = true

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightControl then
        main.Visible = not main.Visible
    end
end)

local Lib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/BoredStuff2/notify-lib/main/lib'),true))()
Lib.prompt('Vision', 'Press Right Control to toggle the HUD', 2)