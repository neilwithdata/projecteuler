--[[
	ProjectEuler.net
	Solution to Problem 7
	by Neil Sainsbury
	12th December, 2011
	
	Optimization #1:
	Any integer greater than 1 can be written as the unique product of prime
	numbers (fundamental theorem of arithmetic). Therefore for any given number
	N you can work out whether it is prime by testing whether it can be evenly
	divided by known primes < sqrt(N)
--]]

-- Known primes as provided by problem statement
local knownPrimes = {2, 3, 5, 7, 11, 13}
local n = 14

local math_sqrt = math.sqrt

while (#knownPrimes < 10001) do
	local sqrtN = math_sqrt(n)
	
	local i = 1
	local prime = true
	while (knownPrimes[i] <= sqrtN) do
		if (n % knownPrimes[i] == 0) then -- n is not prime
			prime = false
			break
		end
		
		i = i + 1
	end
	
	if (prime) then
		table.insert(knownPrimes, n)
	end
	
	n = n + 1
end

print("The 10,0001st prime is "..knownPrimes[#knownPrimes])