--[[
	ProjectEuler.net
	Solution to Problem 8
	by Neil Sainsbury
	13th December, 2011
	
	Solution approach:
		Treat the 1000-digit number as a string and split up in segments separated by
		'0'. If segment length < 5, discard segment. For each remaining segment
		establish reference, and then continually shift container right by
		1, each time calculating new accumulator value.
		
		eg.
		Starting digits = "7316717653133…"
		ref = [73167]17653133…
		
		If we now shift product container right by 1. ie. 7[31671]7653133… we can see
		that 7 got dropped from the product, while 1 was added. Or accumulator:
		down x7 (7), up x1 (7). Shift right again to 73[16717]653133 and now accumulator:
		down x3 (21), up x7 (3). In other words 16717 is x3 less than our ref 73167.
		If accumulator > x1, we have found a new max reference.
		
		Do this for each segment, and then compares max refs found in each for largest
--]]

local number = [[
7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450]]

local function product(array)
	local accumulator = 1
	
	for i = 1, #array do
		accumulator = accumulator * array[i]
	end
	
	return accumulator
end

local function fillContainer(container, segment, startIndx)
	for i = 0, 4 do
		container[i+1] = string.sub(segment, startIndx+i, startIndx+i)
	end
end

local max_prod = 0
for segment in string.gmatch(number, "[^0]+") do
	if (#segment >= 5) then
		local ref_max = {}
		local container = {}
		
		fillContainer(ref_max, segment, 1)
		fillContainer(container, segment, 1)
		
		local seg_max_prod = product(ref_max)
		local accumulator = seg_max_prod
		
		for i = 6, #segment do
			local head = table.remove(container, 1)
			accumulator = accumulator / head
			
			local tail = string.sub(segment, i, i)
			table.insert(container, tail)
			accumulator = accumulator * tail
			
			if (accumulator > seg_max_prod) then
				seg_max_prod = accumulator
			end
		end
		
		if (seg_max_prod > max_prod) then
			max_prod = seg_max_prod
		end
	end
end

print("The greatest product is "..max_prod)