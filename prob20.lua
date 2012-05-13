--[[
	ProjectEuler.net
	Solution to Problem 20
	by Neil Sainsbury
	3 January, 2011
	
	Solution approach:
		Using lbc, a arbitrary precision library for Lua based on GNU bc
--]]

require "bc"

local result = bc.number(1)
for n = 2, 100 do
	result = result * n
end

local strResult = tostring(result)

local sum = 0
for i = 1, strResult:len() do
	local n = tonumber(strResult:sub(i, i))
	sum = sum + n
end

print("The sum of the digits of 100! is "..sum)
