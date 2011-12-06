--[[
	ProjectEuler.net
	Solution to Problem 5
	by Neil Sainsbury
	3rd December, 2011
	
	Optimization #1:
		Rather than checking every single number if evenly divisible by 1-20, can get
		away with only checking every 20th number since each must be divisible by 20
		
	Optimization #2:
		When checking if N is evenly divisible by X (1 <= X <= 20), if N
		is divisible by X it is unnecessary to also check X's factors eg. don't need
		to check if number is evenly divisible by 2, 4, 5, 10 if it is evenly
		divisible by 20
--]]

local function evenlyDivisible(num)
	local numsToCheck = {19, 18, 17, 16, 15, 14, 13, 12, 11}
	
	for _,n in ipairs(numsToCheck) do
		if (num % n ~= 0) then
			return false
		end
	end
	
	return true
end

local i = 20
while (true) do
	if (evenlyDivisible(i)) then
		break
	else
		i = i + 20
	end
end

print("The smallest positive number evenly divisible from 1 - 20 is "..i)