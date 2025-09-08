local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local SlapAuraModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/Modules/KSPR/SlapAura.lua"))()
local Window = Library:CreateWindow({
    Title = "KS:PR",
    Footer = "Made by: #?%#(*",
    ToggleKeybind = Enum.KeyCode.M,
    Center = true,
    AutoShow = true
}) 

local MainTab = Window:AddTab("Main", "home")
local SlapGeneralGroupBox = MainTab:AddLeftGroupbox("Slap General")

local SlapAuraActiverToogle = SlapGeneralGroupBox:AddToggle("SlapAuraToggle", {
    Text = "Slap Aura",
    Risky = true,
    Callback = function(Value)
        _G.SlapAuraActivated = Value
        SlapAuraModule.Setup()
    end
}) 

local Keybind = SlapAuraActiverToogle:AddKeyPicker("MyKeybind", {
    Default = "F",
    Text = "Example Keybind",
    Mode = "Toggle",
    SyncToggleState = false,
    Callback = function(Value)
        _G.SlapAuraActivated = Value
        SlapAuraModule.Setup()
    end
})

_G.SlapAuraArea = 5
local SlapAuraAreaSlider = SlapGeneralGroupBox:AddSlider("SlapAuraArea", {
    Text = "Aura Area",
    Default = 5,
    Min = 0,
    Max = 25,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        _G.SlapAuraArea = Value
    end
})

