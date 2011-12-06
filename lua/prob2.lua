--[[
	ProjectEuler.net
	Solution to Problem 2
	by Neil Sainsbury
	2nd December, 2011
--]]

local N = 4000000

local prev1, prev2 = 1, 2
local evenSum = 2

while true do
	local next = prev1 + prev2
	
	if (next > 4000000) then
		break
	end
	
	if (next % 2 == 0) then
		evenSum = evenSum + next
	end
	
	prev1, prev2 = prev2, next
end

print("The sum of all even-valued terms in the Fibonacci sequence up to "..N.." is "..evenSum)