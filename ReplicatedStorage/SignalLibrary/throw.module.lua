-- Madonox
-- 2021

local throw = {}

function throw.error(msg)
	warn(string.format("SignalSender ERROR:\n"..msg))
end
function throw.warn(msg)
	warn(string.format("SignalSender WARNING:\n"..msg))
end
function throw.log(msg)
	warn(string.format("SignalSender LOG:\n"..msg))
end

return throw
