local module = {
    Data = {
        Noclip = {
            FirstActivation = false,
            ActualActivated = false
        },
    }
}
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")

local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

function module.Noclip(Boolean)
    local NoclipTable = module.Data.Noclip
    if NoclipTable.FirstActivation then
        return
    end NoclipTable.FirstActivation = true
    NoclipTable.ActualActivated = Boolean

    local hrp = Character:WaitForChild("HumanoidRootPart")

    local spd = 3
    rs.RenderStepped:Connect(function()
        if NoclipTable.ActualActivated and hrp and Player.Character and Player.Character:FindFirstChild("Humanoid") then
            local cam = workspace.CurrentCamera.CFrame
            local pos = hrp.CFrame
            if uis:IsKeyDown(Enum.KeyCode.W) then
                pos = pos + cam.LookVector * spd
            end
            if uis:IsKeyDown(Enum.KeyCode.S) then
                pos = pos - cam.LookVector * spd
            end
            if uis:IsKeyDown(Enum.KeyCode.A) then
                pos = pos - cam.RightVector * spd
            end
            if uis:IsKeyDown(Enum.KeyCode.D) then
                pos = pos + cam.RightVector * spd
            end
            if uis:IsKeyDown(Enum.KeyCode.Space) then
                pos = pos + cam.UpVector * spd
            end
            if uis:IsKeyDown(Enum.KeyCode.LeftShift) then
                pos = pos - cam.UpVector * spd
            end
            hrp.CFrame = pos
        end
    end
end

return module