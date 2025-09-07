local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local Window = Library:CreateWindow({
    Title = "KS:PR",
    Footer = "Made by: #?%#(*",
    ToggleKeybind = Enum.KeyCode.RightControl,
    Center = true,
    AutoShow = true
}) 

local MainTab = Window:AddTab("Main", "home")
local LeftGroupbox = MainTab:AddLeftGroupbox("Settings")
local RightGroupbox = MainTab:AddRightGroupbox("Information")