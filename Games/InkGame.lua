local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local GLRLModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/Modules/Ink%20Game/GreenLightRedLight.lua"))()
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
local GLRLGodMode = GLRLTab:AddToggle("God Mode", {
    Text = "God Mode",
    Default = false,
    Callback = function(Value)

    end
})

local GLRLGoToEnd = GLRLTab:AddButton({
    Text = "Teleport To End",
    Func = function()
        GLRLModule.TeleportToEnd()
    end,
})


local CombatTab = Window:AddTab("Combat", "crosshair")