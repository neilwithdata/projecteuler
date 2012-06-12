longest_cycle = 0

for d in range(2, 1000):
    num_digits = 0
    numerators = []
    numerator = 1
    
    while True:
        numerator *= 10
    
        while numerator < d:
            num_digits += 1
            numerator *= 10
        
        if numerator in numerators:
            cycle_length = num_digits - numerators.index(numerator)
            if cycle_length > longest_cycle:
                longest_cycle = cycle_length
                d_longest = d
            break # found recurring cycle length
        else:
            numerators.append(numerator)
        
        digit = numerator / d        
        r = numerator % d
        if r == 0:
            num_digits += 1
            break # non-recurring
        
        num_digits += 1
        numerator = r
        
print longest_cycle, d_longest