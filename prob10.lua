--[[
	ProjectEuler.net
	Solution to Problem 10
	by Neil Sainsbury
	17th December, 2011
	
	Solution approach:
		Solved using Sieve of Eratosthenes w/ basic refinements:
		(ignore odd, start mult elimination from p^2)
--]]

-- Generate the list of all odd numbers < 2,000,000
-- for each index, hold only a boolean (true/false) to flag whether prime

local N = 2000000

local candidates = {}
for indx = 1, N-1 do
	candidates[indx] = true
end

local p = 3
local sum = 5

while (p < N) do
	local pMult = p^2
	local pInc = 2*p
	while (pMult < N) do
		candidates[pMult] = false
		pMult = pMult + pInc
	end

	-- Find first num > p not false (and only consider odd)
	p = p + 2
	while (p < N) do
		if (candidates[p]) then
			-- we found the next prime to move to
			sum = sum + p
			break
		end
		
		-- move to the next odd number candidate
		p = p + 2
	end
end

print("The sum of all primes below two million is "..sum)