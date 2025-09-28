local NoClip = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

NoClip.Enabled = false
local clipConnection

function NoClip.Enable()
    if NoClip.Enabled then return end
    NoClip.Enabled = true

    local player = Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()

    clipConnection = RunService.Stepped:Connect(function()
        if not char then return end
        for _, part in ipairs(char:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

function NoClip.Disable()
    NoClip.Enabled = false
    if clipConnection then
        clipConnection:Disconnect()
        clipConnection = nil
    end

    local player = Players.LocalPlayer
    local char = player.Character
    if char then
        for _, part in ipairs(char:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

function NoClip.Toggle(Value)
    if Value then
        NoClip.Enable()
    else
        NoClip.Disable()
    end
end

return NoClip
