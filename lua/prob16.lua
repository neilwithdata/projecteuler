--[[
	ProjectEuler.net
	Solution to Problem 16
	by Neil Sainsbury
	3 January, 2011
	
	Solution approach:
		Simple and it works :-)
--]]

local result = math.pow(2, 1000)

local strResult = string.format("%f", result):match("[0-9]*")

local sum = 0
for i = 1, strResult:len() do
	local n = tonumber(strResult:sub(i, i))
	sum = sum + n
end

print("The sum of the digits of the number 2^1000 is "..sum)