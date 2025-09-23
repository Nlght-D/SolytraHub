local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()

local ModulesPath = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/Modules/Ink%20Game"
local GamesPath, MiscPath = ModulesPath .. "/Games/", ModulesPath .. "/Misc/"

local GLRLModule = loadstring(game:HttpGet(GamesPath .. "GreenLightRedLight.lua"))()
local PlayerModule = loadstring(game:HttpGet(MiscPath .. "PlayerModule.lua"))()

local Window = Library:CreateWindow({
    Title = "Ink Game",
    Footer = "Solytra Hub",
    Icon = "triangle",
    ToggleKeybind = Enum.KeyCode.M,
    Center = true,
    AutoShow = true
}) 


local GamesTab = Window:AddTab("Games", "gamepad")

local GLRLGroupbox = GamesTab:AddLeftGroupbox("Green Light Red Light")
local GLRLGodMode = GLRLGroupbox:AddToggle("God Mode", {
    Text = "God Mode",
    Default = false,
    Callback = function(Value)
        GLRLModule.GodMode(Value)
    end
})

local GLRLGoToEnd = GLRLGroupbox:AddButton({
    Text = "Teleport To End",
    Func = function()
        GLRLModule.TeleportToEnd()
    end,
})

local SelectedPlayer = "Random"
local SelectPlayer = GLRLGroupbox:AddDropdown("SelectPlayer", {
    Values = {"Random", "Player1", "Player2", "Player3"},
    Default = 1,
    Text = "Select A Player",
    Callback = function(Value)
        SelectedPlayer = Value
        print("Dropdown new value:", SelectedPlayer)
    end
})

local HelpInjuredPlayer = Groupbox:AddButton({
    Text = "Help a Injured Player",
    Func = function()
        print("Button clicked!")
    end,
})

local MiscTab = Window:AddTab("Misc", "file-box")

local PlayerGroupbox = MiscTab:AddLeftGroupbox("Player [NOT FE]")
local PlayerNoclip = PlayerGroupbox:AddToggle("Noclip", {
    Text = "Noclip",
    Default = false,
    Risky = true,
    Callback = function(Value)
        PlayerModule.Noclip(Value)
    end
})
