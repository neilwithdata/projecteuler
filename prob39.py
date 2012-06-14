# pre-calculate the square numbers
squares = []
for i in range(1000):
    squares.append(i*i)

max_num_solutions = 0
for p in range(3, 1001):
    num_solutions = 0

    for a in range(1, p):
        for b in range(a, p):
            c = p - (a + b)
            if c < 0: break
            cmp = squares[c] - (squares[a] + squares[b])
            
            if cmp == 0: # found a solution
                num_solutions += 1
            elif cmp < 0: # a,b passed solution point
                break
    
    if num_solutions > max_num_solutions:
        max_num_solutions = num_solutions
        maxp = p

print maxp