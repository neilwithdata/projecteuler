--[[
	ProjectEuler.net
	Solution to Problem 4
	by Neil Sainsbury
	6th December, 2011
	
--]]

-- next palindrome down from 998,001 (999x999)
local digits = {9, 9, 7, 7, 9, 9}
local pivot = 3
local numDigits = 6
local evenDigits = true

local function getDecimalValue(digits)
	local value = 0
	local n = #digits
	
	for i = 1, n do
		value = value + digits[i] * (10^(n-i))
	end
	
	return value
end

-- Truly horrible implementation…but it works! :-)
local function getNextPalindrome()
	-- Reduce value at pivot by 1
	if (digits[pivot] == 0) then
		if (digits[pivot - 1] == 0) then
			if (digits[1] == 1) then
				table.remove(digits, 1);
				digits[1] = 9
				digits[2] = 9
				
				numDigits = numDigits - 1
				evenDigits = (numDigits % 2 == 0)
			else
				digits[1] = digits[1] - 1
				digits[pivot - 1] = 9
			end
		else
			digits[pivot - 1] = digits[pivot - 1] - 1
		end
		
		digits[pivot] = 9
	else
		digits[pivot] = digits[pivot] - 1
	end
	
	-- now build up the mirror around the pivot
	if (evenDigits) then
		local x = 0
		for i = pivot + 1, numDigits do
			digits[i] = digits[pivot - x]
			x = x + 1
		end
	else
		for i = 1, numDigits - pivot do
			digits[pivot + i] = digits[pivot - i]
		end
	end
	
	local decimalVal = getDecimalValue(digits)
	
	-- if number is below 10,000 (100x100)
	if (decimalVal < 10000) then
		return nil
	else
		return decimalVal
	end
end

local palindrome = getDecimalValue(digits)
while (palindrome) do
	local math_floor = math.floor
	local math_max = math.max
	local math_sqrt = math.sqrt

	-- is the current palindrome, N, a product of two 3-digit numbers
	-- search between N/999 and sqrt(N)
	local minFactor = math_floor(palindrome / 999)
	local min = math_max(100, minFactor)
	local max = math_sqrt(palindrome)
	
	for n = min, max do
		if (palindrome % n == 0) then
			print("The largest palindrome is "..palindrome)
			os.exit()
		end
	end

	palindrome = getNextPalindrome()
end


