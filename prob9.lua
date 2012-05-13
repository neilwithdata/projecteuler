--[[
	ProjectEuler.net
	Solution to Problem 9
	by Neil Sainsbury
	16th December, 2011
	
	Solution approach:
		Combining the two equations gives us:
			500 + ab/1000 = a+b
			
		Thus we know that:
			ab must be a multiple of 1000 ∴ either a and b must be even
			a+b must be at minimum 500
			b > a
		
		We can use these criteria to minimize our search for the triplet
--]]

local math_max = math.max

-- Now find all the Pythagorean triplets
for a = 2, 998, 2 do
	local bMin = math_max(500 - a, a + 1)
	local bMax = 1000 - bMin - a
	
	for b = bMin, bMax do
		if (a*b % 1000 == 0) then
		
			if (500 + a*b/1000 == a+b) then
				local c = 1000 - a - b
				print("The product abc is "..a*b*c)
				os.exit()
			end
		end
	end

end