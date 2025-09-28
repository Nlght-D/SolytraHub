local module = {}
module.Enabled = false
local GravityValue = Instance.new("NumberValue"); GravityValue.Changed:Connect(function(value)
	if not module.Enabled then
		return
	end
	workspace.Gravity = value
end)
local DefaultGravity = 196.1

function module.Toggle(Value, Number)
	module.Enabled = Value
	if not Value then
		workspace.Gravity = DefaultGravity
		return
	end
	
	GravityValue.Value = Number
end

return module