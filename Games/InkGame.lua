local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()

local ModulesPath = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/Modules/Ink%20Game"
local GamesPath, MiscPath, UtilsPath = ModulesPath .. "/Games/", ModulesPath .. "/Misc/", ModulesPath .. "/Utils/"

local function Require(Path, Name)
    local f = loadstring(game:HttpGet(Path .. Name .. ".lua"))
    if f then
        local ok, res = pcall(f)
        return res
    end
end

-- Games
local GLRLModule = Require(GamesPath, "GreenLightRedLight")

-- Misc
local PlayerModule = Require(MiscPath, "PlayerModule")

-- Utils
local GetPlayersModule = Require(UtilsPath, "GetPlayers")
warn("Loaded")

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
local PlayersList = GetPlayersModule.GetPlayers()
local SelectPlayer = GLRLGroupbox:AddDropdown("SelectPlayer", {
    Values = PlayersList,
    Default = 1,
    Text = "Select A Player",
    Callback = function(Value)
        SelectedPlayer = Value
        print("Dropdown new value:", SelectedPlayer)
    end
})

local HelpInjuredPlayer = GLRLGroupbox:AddButton({
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
