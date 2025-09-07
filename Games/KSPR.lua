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
local DescriptionGlove = GloveGroupBox:AddLabel("This is a label")
local WrappedLabel = GloveGroupBox:AddLabel({
    Text = "This is a wrapped label that will break into multiple lines",
    DoesWrap = true
})

local TabGlove = MainTab:AddLeftTabbox("Glove Stuffs")
local SlapGlove = GloveTab:AddTab("Slap")
local GenralGlove = GloveTab:AddTab("General")