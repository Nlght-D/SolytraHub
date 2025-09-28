local module = {}
module.Enabled = false

local GravityValue = Instance.new("NumberValue")
local DefaultGravity = 196.1

GravityValue.Changed:Connect(function()
	if not module.Enabled then
		return
	end
	workspace.Gravity = GravityValue.Value
end)

function module.Toggle(Value, Number)
	module.Enabled = Value
	if not Value then
		GravityValue.Value = DefaultGravity
		workspace.Gravity = DefaultGravity
		return
	end

	GravityValue.Value = Number
end

return module