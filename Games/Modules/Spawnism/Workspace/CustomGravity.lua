local module = {}
local GravityWorkspace = workspace.Gravity
local DefaultGravity = 196.1

function module.Toggle(Value, Number)
    if Value then
        GravityWorkspace = Number
    else
        GravityWorkspace = DefaultGravity
    end
end

return module