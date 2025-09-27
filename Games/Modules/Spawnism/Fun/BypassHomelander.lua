local Module = {}
local player = game.Players.LocalPlayer
local remoteEvent = player.Character.LazerVision.RemoteEvent; player.CharacterAdded:Connect(function(Character)
    remoteEvent = Character.LazerVision.RemoteEvent
end)
local mouse

pcall(function()
    mouse = player:GetMouse()
end)

local running = false
local firingLoop

local function startFiring()
    if running then return end
    running = true
    local firstShot = false
    if mouse and mouse.Hit then
        remoteEvent:FireServer(mouse.Hit, firstShot, "Delete")
    end
    firingLoop = task.spawn(function()
        while running do
            if mouse and mouse.Hit then
                remoteEvent:FireServer(mouse.Hit, firstShot)
            end
            task.wait()
            firstShot = true
        end
    end)
end

local function stopFiring()
    running = false
    if mouse and mouse.Hit then
        remoteEvent:FireServer(mouse.Hit, nil, "Delete")
    end
    task.wait(2)
end

function Module.Bypass(enable)
    if enable then
        startFiring()
    else
        stopFiring()
    end
end

return Module
