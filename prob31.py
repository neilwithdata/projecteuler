coins = [200, 100, 50, 20, 10, 5, 2, 1]

def nways(val, ic):
    if ic >= len(coins):
        return 0

    total_ways = 0

    max_n = val / coins[ic]
    for i in range(max_n + 1):
        rem = val - (i * coins[ic])
        
        if rem == 0:
            total_ways += 1
        else:
            total_ways += nways(rem, ic + 1)
    
    return total_ways

print nways(200, 0)