local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local ModulesPath = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/Modules/Spawnism"

local FunPath, PlayerPath = ModulesPath .. "/Fun/", ModulesPath .. "/Player/"

local function Require(Path, Name)
    local f = loadstring(game:HttpGet(Path .. Name .. ".lua"))
    if f then
        local ok, res = pcall(f)
        return res
    end
end

local BypassHomelander = Require(FunPath, "BypassHomelander")
local InfiniteStamina = Require(FunPath, "InfiniteStamina")

local Aimbot = Require(FunPath, "Aimbot")
local Esp = Require(FunPath, "Esp")

local Fly = Require(PlayerPath, "Fly")

local Window = Library:CreateWindow({
    Title = "Spawnism Hangout",
    Footer = "Solytra Hub",
    Icon = "file-json",
    ToggleKeybind = Enum.KeyCode.M,
    Center = true,
    AutoShow = true
})

local MainTab = Window:AddTab("Main", "ferris-wheel")

local FunGroupbox = MainTab:AddLeftGroupbox("Fun")
local FunLazer = FunGroupbox:AddToggle("Lazer", {
    Text = "Homelander Lazer",
    Tooltip = "THE CHOSEN ONE",
    Default = false,

})
local FunLazerKeybind = FunLazer:AddKeyPicker("Lazer Keybind", {
    Default = "Z",
    Text = "Lazer Keybind",
    Mode = "Toggle",
    
    SyncToggleState = true,
    Callback = function(Value)
        BypassHomelander.Bypass(Value)
    end
})

local FunAimbot = FunGroupbox:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
})
local FunAimbotKeybind = FunAimbot:AddKeyPicker("Aimbot Keybind", {
    Default = "K",
    Text = "Aimbot Keybind",
    Mode = "Toggle",
    
    SyncToggleState = true,
    Callback = function(Value)
        Aimbot.ToggleLockOn(Value)
    end
})
local FunAimbotSlider = FunGroupbox:AddSlider("Aimbot Slider", {
    Text = "Aimbot Distance",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        Aimbot.ChangeMaxDistance(Value)
    end
})

local FunInfiniteStamina = FunGroupbox:AddButton({
    Text = "Infinite Stamina",
    Func = function()
        InfiniteStamina.SetInfiniteStamina()
    end,
})

local FunEsp = FunGroupbox:AddButton({
    Text = "ESP Function",
    Func = function()
        Esp.Toggle()
    end,
})

local PlayerGroupbox = MainTab:AddRightGroupbox("Player")
local PlayerFly = FunGroupbox:AddToggle("Fly", {
    Text = "Fly",
    Tooltip = "TCO VS TDL",
    Default = false,
})
local PlayerFlyKeybind = FunLazer:AddKeyPicker("Fly Keybind", {
    Default = "F",
    Text = "Fly Keybind",
    Mode = "Toggle",
    
    SyncToggleState = true,
    Callback = function(Value)
        Fly.Toggle(Value)
    end
})
local PlayerFlySlider = FunGroupbox:AddSlider("Fly Slider", {
    Text = "Fly Velocity",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        Fly.ChangeFlyVelocity(Value)
    end
})