local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Soltra",
    SubTitle = "Shenigans",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "layout" }),
    Movement = Window:AddTab({ Title = "Movement", Icon = "rocket" }),
    Combat = Window:AddTab({ Title = "Combat", Icon = "sword" }),
    Utility = Window:AddTab({ Title = "Utility", Icon = "settings" }),
    Animations = Window:AddTab({ Title = "Animations", Icon = "film" }),
    Achievements = Window:AddTab({ Title = "Achievements", Icon = "crown" }),
    Fun = Window:AddTab({ Title = "Fun", Icon = "party-popper" }),
    Search = Window:AddTab({ Title = "Search", Icon = "search" })
}
local Options = Fluent.Options

local function AddScriptToggle(tab, id, title, description, scriptURL, defaultState)
	local toggle = tab:AddToggle(id, {
    	Title = title,
    	Description = description,
    	Default = defaultState or false
	})

    Options[id].Args = { scriptURL = scriptURL }
    local module = loadstring(game:HttpGet(scriptURL))()
    toggle:OnChanged(function()
        print(Options[id].Value)
        module:Toggle(Options[id].Value)
    end)
end

local ScriptsPath = "https://raw.githubusercontent.com/Nlght-D/SolytraHub/refs/heads/main/Modules/Scripts/Shenanigans/"
local MovementPath = ScriptsPath .. "Movement/"

AddScriptToggle(Tabs.Movement, "Fly", "Fly", "X to Fly!", MovementPath .. "Fly.lua")

print("Auto-Delete AC Started")
game.Workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "AntiCheatController" then
        descendant:Destroy()
        print("AC deleted")
    end
end)
