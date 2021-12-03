-- Madonox
-- 2021

local letters = {"a","b","c","d","e","f","g","h","j","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}

local random = math.random

local UUID = {}

local function pickFromTable(tab)
	local num = random(1,#tab)
	return tab[num]
end

function UUID.letterPattern(len)
	local res = ""
	for i=1,len do
		local letter = pickFromTable(letters)
		if random(1,2) == 2 then
			letter = string.upper(letter)
		end
		res = res..letter
	end
	return res
end

return UUID
