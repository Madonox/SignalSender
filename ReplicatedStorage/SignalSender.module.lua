-- Madonox
-- 2021

local SignalSender = {}
SignalSender.__index = SignalSender

local SignalLibrary = {}
for i,v in ipairs(script.Parent.SignalLibrary:GetChildren()) do
	if v:IsA("ModuleScript") then
		if not SignalLibrary[v.Name] then
			SignalLibrary[v.Name] = require(v)
		else
			warn("SignalSender ERROR:\nPre-existing library detected!  Could not load properly!")
			break
		end
	else
		warn("SignalSender ERROR:\nNon-ModuleScript library detected!  Could not load properly!")
		break
	end
end

function SignalSender.new(methods)
	if typeof(methods) == "table" then
		local newSignal = {}
		setmetatable(newSignal,SignalSender)
		newSignal.SelfMethods = methods
		local localKey = SignalLibrary.UUID.letterPattern(5)
		newSignal.localKey = localKey
		if table.find(methods,"SelfMethods") then
			SignalLibrary.throw.error("Could not create signal;\nError: Attempted to overwrite base value.")
			return {}
		else
			for i,v in ipairs(methods) do
				newSignal[v] = setmetatable({},SignalLibrary.SignalFunction)
				newSignal[v]:RegisterKey(localKey)
			end
			return newSignal
		end
	else
		SignalLibrary.throw.error("Invalid method table format!")
	end
end
function SignalSender:Fire(method,...)
	if self[method] then
		local args = {...}
		local success,err = pcall(function()
			self[method]:Fire(self.localKey,table.unpack(args))
		end)
		if not success then
			SignalLibrary.throw.error("Signal error:\n"..err)
		end
	end
end

return SignalSender
