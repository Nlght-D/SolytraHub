local SlapAura = {}

function SlapAura.Setup(b)
    print("Loaded")
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()

    -- tenta achar Soul Devourer no char ou backpack
    local tool = char:FindFirstChild("Soul Devourer") or plr.Backpack:FindFirstChild("Soul Devourer")
    -- se não achou, espera até equipar
    if not tool then
        print("Aguardando Soul Devourer...")
        tool = plr.Backpack.ChildAdded:Wait()
        while tool.Name ~= "Soul Devourer" do
            tool = char.ChildAdded:Wait()
        end
    end

    -- agora tool nunca deve ser nil
    local SlapEvent = tool:WaitForChild("Server"):WaitForChild("Slap")

    if b then
        local Hitbox = Instance.new("Part")
        Hitbox.Name = "Hitbox"
        Hitbox.Size = Vector3.new(_G.SlapAuraArea, _G.SlapAuraArea, _G.SlapAuraArea) or Vector3.new(5,5,5)
        Hitbox.CanCollide = false
        Hitbox.Transparency = 1
        Hitbox.Parent = char

        local wc = Instance.new("WeldConstraint")
        wc.Part0 = Hitbox
        wc.Part1 = char:WaitForChild("HumanoidRootPart")
        wc.Parent = Hitbox

        Hitbox.Touched:Connect(function(hit)
            local hum = hit.Parent and hit.Parent:FindFirstChildOfClass("Humanoid")
            if hum and hum.Parent ~= char then
                SlapEvent:FireServer(hum.Parent)
            end
        end)
        return
    end

    local hb = char:FindFirstChild("Hitbox")
    if hb then
        hb:Destroy()
    end
end

return SlapAura
