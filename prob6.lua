--[[
	ProjectEuler.net
	Solution to Problem 6
	by Neil Sainsbury
	2nd December, 2011
--]]

local N = 100

-- find the square of the sum
local squareSum = 0
for i = 1, N do
	squareSum = squareSum + i
end
squareSum = math.pow(squareSum, 2)

-- find the sum of the squares
local sumSquares = 0
for i = 1, N do
	sumSquares = sumSquares + math.pow(i, 2)
end

print("The difference is "..squareSum - sumSquares)