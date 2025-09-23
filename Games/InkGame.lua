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

local GLRLTab = GamesTab:AddLeftGroupbox("Green Light Red Light")
local GodMode = Groupbox:AddToggle("GLRL God Mode", {
    Text = "God Mode",
    Default = false,
    Callback = function(Value)
        
    end
})

local CombatTab = Window:AddTab("Combat", "crosshair")