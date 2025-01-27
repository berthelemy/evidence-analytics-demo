# Python3 code to demonstrate working of
# Random K dates in Range
# Using choices() + timedelta() + loop
from datetime import date, timedelta
from random import choices
 
# initializing dates ranges 
test_date1, test_date2 = date(2023, 6, 3), date(2025, 1, 24)
 
# printing dates 
#print("The original range : " + str(test_date1) + " " + str(test_date2))
 
# initializing K
K = 10000
 
res_dates = [test_date1]
 
# loop to get each date till end date
while test_date1 != test_date2:
    test_date1 += timedelta(days=1)
    res_dates.append(test_date1)
 
# random K dates from pack
res = choices(res_dates, k=K)
for date in res:
    print(date)
# printing 
#print("K random dates in range : " + str(res))