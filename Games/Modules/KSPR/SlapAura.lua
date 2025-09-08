local SlapAura = {}

function SlapAura.Setup(b)
    print("Loaded")
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local tool = char:FindFirstAncestorOfClass("Tool") -- substitui "Tool" pelo nome certo da ferramenta
    local SlapEvent = tool:WaitForChild("Server"):WaitForChild("Slap")
    if not tool then 
        return
    end

    if b then
        local Hitbox = Instance.new("Part")
        Hitbox.Name = "Hitbox"
        Hitbox.Size = _G.SlapAuraArea or Vector3.new(5,5,5)
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
