local module = {}
local remote = game:GetService("ReplicatedStorage"):WaitForChild("ShopEvent")

function module.Buy(SelectedItem)
    local Item = game:GetService("ReplicatedStorage"):WaitForChild("ShopItems"):FindFirstChild(SelectedItem)
    if Item then
        remote:FireServer(Item.Name)
    end
end

return module