print("params")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"))()

local ModulesPath = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Games/Modules/Ink%20Game"
local GamesPath, MiscPath = ModulesPath .. "/Games/", ModulesPath .. "/Misc/"

local GLRLModule = loadstring(game:HttpGet(Games .. "GreenLightRedLight.lua"))()

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


local MiscTab = Window:AddTab("Misc", "file-box")

local PlayerTab = Misc:AddLeftGroupbox("Player [NOT FE]")
