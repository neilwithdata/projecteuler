days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

matches = 0
first = 1

def isleap(year):
    if year % 4 == 0:
        if year % 100 == 0:
            return year % 400 == 0

        return True
    else:
        return False

for year in range(1900, 2001):
    days_in_months[1] = 29 if isleap(year) else 28
    
    for days in days_in_months:
        first += days
        
        if first % 7 == 0 and year >= 1901:
            matches += 1

print matches            
