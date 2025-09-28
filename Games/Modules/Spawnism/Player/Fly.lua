local Fly = {}
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

Fly.Enabled = false
Fly.Speed = 50

local bodyVelocity
local bodyGyro
local flyConnection

local ctrl = {f = 0, b = 0, l = 0, r = 0}

UserInputService.InputBegan:Connect(function(input)
    if not Fly.Enabled then return end
    if input.KeyCode == Enum.KeyCode.W then ctrl.f = 1 end
    if input.KeyCode == Enum.KeyCode.S then ctrl.b = 1 end
    if input.KeyCode == Enum.KeyCode.A then ctrl.l = 1 end
    if input.KeyCode == Enum.KeyCode.D then ctrl.r = 1 end
end)

UserInputService.InputEnded:Connect(function(input)
    if not Fly.Enabled then return end
    if input.KeyCode == Enum.KeyCode.W then ctrl.f = 0 end
    if input.KeyCode == Enum.KeyCode.S then ctrl.b = 0 end
    if input.KeyCode == Enum.KeyCode.A then ctrl.l = 0 end
    if input.KeyCode == Enum.KeyCode.D then ctrl.r = 0 end
end)

function Fly.Enable()
    if Fly.Enabled then return end
    Fly.Enabled = true

    local player = Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local torso = char:WaitForChild("Torso")
    local humanoid = char:WaitForChild("Humanoid")

    humanoid.PlatformStand = true

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGyro.P = 9e4
    bodyGyro.CFrame = torso.CFrame
    bodyGyro.Parent = torso

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVelocity.Velocity = Vector3.new(0,0,0)
    bodyVelocity.Parent = torso

    local speed = Fly.Speed

    flyConnection = RunService.RenderStepped:Connect(function()
        local cam = workspace.CurrentCamera

        local moveDir = Vector3.new(0,0,0)
        moveDir = moveDir + (cam.CFrame.LookVector * (ctrl.f - ctrl.b))
        moveDir = moveDir + (cam.CFrame.RightVector * (ctrl.r - ctrl.l))

        -- Velocidade
        if moveDir.Magnitude > 0 then
            moveDir = moveDir.Unit * speed
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDir = moveDir + Vector3.new(0, speed/2, 0)
        elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveDir = moveDir - Vector3.new(0, speed/2, 0)
        end

        bodyVelocity.Velocity = moveDir

        bodyGyro.CFrame = CFrame.new(torso.Position, torso.Position + cam.CFrame.LookVector)
    end)
end

function Fly.Disable()
    Fly.Enabled = false
    if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
    if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
    if flyConnection then flyConnection:Disconnect() flyConnection = nil end

    local player = Players.LocalPlayer
    local char = player.Character
    if char then
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
    end
end

function Fly.Toggle(Value)
    if Value then
        Fly.Enable()
    else
        Fly.Disable()
    end
end

function Fly.ChangeFlyVelocity(Value)
    Fly.Speed = Value
end

return Fly
