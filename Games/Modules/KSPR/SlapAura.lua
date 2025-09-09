local SlapAura = {}
local plr = game:GetService("Players").LocalPlayer
local Used = false

function SlapAura.Setup()
    while _G.SlapAuraActivated do
        local char = plr.Character or plr.CharacterAdded:Wait()
        local tool = char:FindFirstChild("Soul Devourer") or plr.Backpack:FindFirstChild("Soul Devourer")
            
        if not tool then
            repeat
                tool = plr.Backpack.ChildAdded:Wait()
            until tool.Name == "Soul Devourer"
        end
            
        local SlapEvent = tool:WaitForChild("Server"):WaitForChild("Slap")
        local range = tonumber(_G.SlapAuraArea) or 10

        local charHRP = char:FindFirstChild("HumanoidRootPart") 
                or char:FindFirstChild("Torso") 
                or char:FindFirstChild("UpperTorso")
        if charHRP then
            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                if v ~= plr and v.Character then
                    local hum = v.Character:FindFirstChildOfClass("Humanoid")
                    local hrp = v.Character:FindFirstChild("HumanoidRootPart")
                            or v.Character:FindFirstChild("Torso")
                            or v.Character:FindFirstChild("UpperTorso")
                    if hum and hrp and hum.Health > 0 then
                        if (hrp.Position - charHRP.Position).Magnitude <= range then
                            SlapEvent:FireServer(v.Character)
                        end
                    end
                end
            end

            -- Dummies
            local dummiesFolder = workspace:FindFirstChild("Dummies")
            if dummiesFolder then
                for _, v in ipairs(dummiesFolder:GetChildren()) do
                    if v:IsA("Model") then
                        local hum = v:FindFirstChildOfClass("Humanoid")
                        local hrp = v:FindFirstChild("HumanoidRootPart")
                                or v:FindFirstChild("Torso")
                                or v:FindFirstChild("UpperTorso")
                        if hum and hrp and hum.Health > 0 then
                            if (hrp.Position - charHRP.Position).Magnitude <= range then
                                SlapEvent:FireServer(v)
                            end
                        end
                    end
                end
             end
        end

        task.wait(0.1)
    end
end

return SlapAura
