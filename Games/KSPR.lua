local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()
local Window = Library:CreateWindow({
    Title = "KS:PR",
    Footer = "Made by: #?%#(*",
    ToggleKeybind = Enum.KeyCode.M,
    Center = true,
    AutoShow = true
}) 

local MainTab = Window:AddTab("Main", "home")
local SlapAuraGroupBox = MainTab:AddLeftGroupbox("Slap Aura")
local SlapAuraActiverToogle = SlapAuraGroupBox:AddToggle("SlapAuraToggle", {
    Text = "Slap Aura [BETA]",
    Risky = true,
    Callback = function(Value)
        
    end
}) local SlapAuraAreaSlider = SlapAuraGroupBox:AddSlider("SlapAuraArea", {
    Text = "Aura Area",
    Default = 5,
    Min = 0,
    Max = 15,
    Rounding = 1,
    Compact = false,
    Callback = function(Value)
        print("Slider changed to:", Value)
    end
})