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
local MyToggle = GloveGroupBox:AddToggle("MyToggle", {
    Text = "Example Toggle",
    Default = false,
    Tooltip = "This is a toggle",
    Callback = function(Value)
        print("Toggle changed to:", Value)
    end
})

-- You can use :OnChanged to add another callback
MyToggle:OnChanged(function(Value)
    print("Toggle changed via OnChanged:", Value)
})

-- You can also create checkboxes instead of switch-style toggles
local MyCheckbox = GloveGroupBox:AddCheckbox("MyCheckbox", {
    Text = "Example Checkbox",
    Default = false,
    Callback = function(Value)
        print("Checkbox changed to:", Value)
    end
})