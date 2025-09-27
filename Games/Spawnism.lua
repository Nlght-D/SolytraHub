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
local Aimbot = Require(FunPath, "Aimbot")

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
    Text = "Lazer",
    Default = false,

})

local FunLazerKeybind = FunLazer:AddKeyPicker("Lazer Keybind", {
    Default = "F",
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

local FunAimbotKeybind = FunLazer:AddKeyPicker("Aimbot Keybind", {
    Default = "K",
    Text = "Aimbot Keybind",
    Mode = "Toggle",
    
    SyncToggleState = true,
    Callback = function(Value)
        Aimbot.ToggleLockOn(Value)
    end
})



