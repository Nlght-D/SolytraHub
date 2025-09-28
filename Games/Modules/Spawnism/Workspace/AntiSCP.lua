local module = {}
module.Enabled = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local SCP = workspace:WaitForChild("SCP-173")
local Head = SCP:GetChildren()[1]

function module.Toggle(Value)
    module.Enabled = Value
end

RunService.RenderStepped:Connect(function()
    if not module.Enabled then return end

    Character = LocalPlayer.Character
    if not Character then return end

    local hrp = Character:FindFirstChild("HumanoidRootPart")
    if not hrp or not Head then return end

    hrp.CFrame = CFrame.lookAt(hrp.Position, Head.Position)
end)

return module
