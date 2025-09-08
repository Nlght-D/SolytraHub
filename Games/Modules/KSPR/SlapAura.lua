local SlapAura = {}

function SlapAura.Setup(b)
    print("Loaded")
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local tool = char:FindFirstChild("Soul Devourer") or plr.Backpack:FindFirstChild("Soul Devourer")

    if not tool then
        tool = plr.Backpack.ChildAdded:Wait()
        while tool.Name ~= "Soul Devourer" do
            tool = char.ChildAdded:Wait()
        end
    end

    local SlapEvent = tool:WaitForChild("Server"):WaitForChild("Slap")

    if b then
        print("Iniciando Slap Aura")

        -- loop de detecção em vez de hitbox física
        task.spawn(function()
            while task.wait(0.15) and b do
                for _, v in ipairs(workspace:GetChildren()) do
                    local hum = v:FindFirstChildOfClass("Humanoid")
                    local hrp = v:FindFirstChild("HumanoidRootPart")
                    if hum and hrp and v ~= char then
                        if (hrp.Position - char.HumanoidRootPart.Position).Magnitude <= (_G.SlapAuraArea or 10) then
                            SlapEvent:FireServer(v)
                        end
                    end
                end
            end
        end)

        return
    end
end

return SlapAura
