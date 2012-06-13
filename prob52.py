import sys

lower_bound = 10
upper_bound = 100

while True:
    max = upper_bound / 6
    for x in range(lower_bound, max):
        for n in range(2, 7):
            nx = n * x
            if sorted(str(x)) != sorted(str(nx)):
                break
            
        else:
            print x
            sys.exit()
        
    lower_bound *= 10
    upper_bound *= 10