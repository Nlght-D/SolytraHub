local module = {}
module.Enabled = false

local GravityValue = Instance.new("NumberValue")
local DefaultGravity = 196.1

GravityValue.Changed:Connect(function()
	if module.Enabled then
		workspace.Gravity = GravityValue.Value
	end
end)

function module.Toggle(Value, Number)
	module.Enabled = Value

	if not Value then
		workspace.Gravity = DefaultGravity
		GravityValue.Value = DefaultGravity
		return
	end

	GravityValue.Value = Number or DefaultGravity
end

return module
