local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local Window = Library:CreateWindow({
    Title = "KS:PR",
    Footer = "Made by: #?%#(*",
    ToggleKeybind = Enum.KeyCode.M,
    Center = true,
    AutoShow = true
}) 

local MainTab = Window:AddTab("Main", "home")

local GloveGroupBox = MainTab:AddLeftGroupbox("Glove Stuffs")

local TabGlove = MainTab:AddLeftTabbox("Glove Stuffs")
local SlapGlove = GloveTab:AddTab("Slap")
local GenralGlove = GloveTab:AddTab("General")