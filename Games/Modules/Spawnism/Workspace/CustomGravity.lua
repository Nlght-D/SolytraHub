local module = {}
local DefaultGravity = 196.1

function module.Toggle(Value, Number)
    if Value then
        workspace.Gravity = Number
    else
        workspace.Gravity = DefaultGravity
    end
end

return module