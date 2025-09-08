local SlapAura = {}
local SlapEvent = game:GetService("Players").LocalPlayer.Character:FindFirstAncestorOfClass("Tool"):WaitForChild("Server"):WaitForChild("Slap"):FireServer(unpack(args))

function SlapAura.Setup(Boolean)
    print("Hello")
	if Boolean then
		local Hitbox = Instance.new("Part")
		Hitbox.Size = _G.SlapAuraArea
		Hitbox.CanCollide = false
		Hitbox.Parent = game:GetService("Players").LocalPlayer.Character
		
		local WeldContraist = Instance.new("WeldConstraint")
		WeldContraist.Part0 = Hitbox
		WeldContraist.Part1 = game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		WeldContraist.Parent = Hitbox
		
		Hitbox.Touched:Connect(function(Hit)
			local Character = Hit.Parent
			if Character and Character:FindFirstChildOfClass("Humanoid") then
				SlapEvent:FireServer(Character)
			end
		end)
		return
	end
	
	local Hitbox = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hitbox")
	if Hitbox then
		Hitbox:Destroy()
	end
end

return SlapAura