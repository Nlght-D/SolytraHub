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
local Button = GloveGroupBox:AddButton({
    Text = "Teste",
    Func = function()
        print("Button clicked!")
    end,
    DoubleClick = true -- Requires double-click for risky actions
})
Button:AddButton({
    Text = "Sub Button",
    Func = function()
        print("Teste2")
    end
})