local FlyModule = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local tpwalking = false
local flyActive = false

FlyModule.Speed = 50
FlyModule._XConn = nil

function FlyModule:_FlyLoop()
    local character = LocalPlayer.Character
    if not character then return end
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not rootPart then return end

    humanoid.PlatformStand = true

    local bg = Instance.new("BodyGyro")
    bg.P = 9e4
    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.CFrame = rootPart.CFrame
    bg.Parent = rootPart

    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.Velocity = Vector3.new(0,0,0)
    bv.Parent = rootPart

    local ctrl = {f=0,b=0,l=0,r=0}

    tpwalking = true
    spawn(function()
        while tpwalking and rootPart.Parent do
            RunService.RenderStepped:Wait()
            local cam = workspace.CurrentCamera
            local lookVec = cam.CFrame.LookVector

            local moveVec = Vector3.new(0,0,0)
            if ctrl.f + ctrl.b ~= 0 or ctrl.l + ctrl.r ~= 0 then
                moveVec = (lookVec * (ctrl.f + ctrl.b)) + ((cam.CFrame * CFrame.new(ctrl.l + ctrl.r,(ctrl.f + ctrl.b)*0.2,0)).p - cam.CFrame.p)
                bv.Velocity = moveVec * self.Speed
            else
                bv.Velocity = Vector3.new(0,0,0)
            end

            bg.CFrame = cam.CFrame
        end
    end)

    self.InputConn = UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.W then ctrl.f = 1 end
        if input.KeyCode == Enum.KeyCode.S then ctrl.b = -1 end
        if input.KeyCode == Enum.KeyCode.A then ctrl.l = -1 end
        if input.KeyCode == Enum.KeyCode.D then ctrl.r = 1 end
        if input.KeyCode == Enum.KeyCode.Space then rootPart.CFrame = rootPart.CFrame + Vector3.new(0,1,0) end
        if input.KeyCode == Enum.KeyCode.LeftShift then rootPart.CFrame = rootPart.CFrame + Vector3.new(0,-1,0) end
    end)

    self.InputEndConn = UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then ctrl.f = 0 end
        if input.KeyCode == Enum.KeyCode.S then ctrl.b = 0 end
        if input.KeyCode == Enum.KeyCode.A then ctrl.l = 0 end
        if input.KeyCode == Enum.KeyCode.D then ctrl.r = 0 end
    end)

    self._bg = bg
    self._bv = bv
end

function FlyModule:_StopFly()
    tpwalking = false
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then humanoid.PlatformStand = false end
    end

    if self._bg then self._bg:Destroy() self._bg = nil end
    if self._bv then self._bv:Destroy() self._bv = nil end

    if self.InputConn then self.InputConn:Disconnect() self.InputConn = nil end
    if self.InputEndConn then self.InputEndConn:Disconnect() self.InputEndConn = nil end
end

function FlyModule:Toggle(state)
    if state then
        if flyActive then return end
        flyActive = true
        self:_FlyLoop()

        -- registra input X para alternar fly
        if not self._XConn then
            self._XConn = UserInputService.InputBegan:Connect(function(input, processed)
                if processed then return end
                if input.KeyCode == Enum.KeyCode.X then
                    self:Toggle() -- alterna fly
                end
            end)
        end
    else
        if not flyActive then return end
        flyActive = false
        self:_StopFly()

        -- desconecta input X
        if self._XConn then
            self._XConn:Disconnect()
            self._XConn = nil
        end
    end
end

return FlyModule
