local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local Window = Library:CreateWindow({
    Title = "Ink Game",
    Footer = "Solytra Hub",
    Icon = "triangle",
    ToggleKeybind = Enum.KeyCode.M,
    Center = true,
    AutoShow = true
}) 

local GamesTab = Window:AddTab("Games", "gamepad")
local CombatTab = Window:AddTab("Combat", "crosshair")

local GLRDTab = GamesTab:AddLeftGroupbox("Green Light Red Light")