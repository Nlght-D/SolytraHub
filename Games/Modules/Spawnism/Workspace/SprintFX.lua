local module = {}

function module.Create()
    if workspace:FindFirstChild("FX") then
        return
    end
    local FXFolder = Instance.new("Folder")
    FXFolder.Name = "FX"
    FXFolder.Parent = workspace
end

function module.Destroy()
    local FXFolder = workspace:FindFirstChild("FX")
    if FXFolder then
        FXFolder:Destroy()
        return
    end
end

return module