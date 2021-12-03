-- Madonox
-- 2021

local SignalFunction = {}
SignalFunction.__index = SignalFunction

function SignalFunction:Connect(func)
	if not self.Functions then
		self.Functions = {}
	end
	table.insert(self.Functions,func)
end
function SignalFunction:RegisterKey(key)
	if self.Key == nil then
		self.Key = key
	end
end
function SignalFunction:Fire(key,...)
	if self.Key == key then
		for i,v in ipairs(self.Functions) do
			v(...)
		end
	end
end

return SignalFunction
