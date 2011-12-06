--[[
	ProjectEuler.net
	Solution to Problem 1
	by Neil Sainsbury
	2nd December, 2011
--]]

local N = 1000

local sum = 0
for n = 1, (N-1) do
	if (n % 3 == 0 or n % 5 == 0) then
		sum = sum + n
	end
end

print("Sum of all multiples is "..sum)
		