--[[
	ProjectEuler.net
	Solution to Problem 3
	by Neil Sainsbury
	3rd December, 2011
	
	Optimization #1:
		Rather than brute force searching for all the primes and then finding the
		largest, the idea here is to only search for a prime factor larger than
		the largest already known.
--]]

local n = 600851475143
local largest = 1

for p = largest + 1, math.sqrt(n) do
	if (n % p == 0) then
		n = n / p
		
		if (p > largest) then
			largest = p
		end
	end
end

print("The largest prime factor is "..largest)