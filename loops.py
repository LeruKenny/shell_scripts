my_list = [1, 2, 3, 4, 5, 6, 7, 100, 110, 21, 33, 32, 2, 4]
even = []
not_even = []
outlier = []
for i in my_list:
    if i > 90:
        outlier.append(i)    
    elif i%2 == 0:
        even.append(i)
    else:
        not_even.append(i)
print('Even numbers', even)
print('Odd numbers', not_even)
print('outliers', outlier)
Out:
Even numbers [2, 4, 6, 32, 2, 4]
Odd numbers [1, 3, 5, 7, 21, 33]
outliers [100, 110]

num_sum = 0
for i in my_list:
    num_sum += i
print('Sum of the elements in the list', num_sum)
Out:
Sum of the elements in the list 330

# step 1: find the even numbers
even = []
for i in my_list:
    if i%2 == 0:
        even.append(i)
# step 2: add all items in even list
sum_num = 0
for i in even:
    sum_num +=i
print('The sum of even numbers', sum_num)
Out:
The sum of even numbers 260

count = 0
for i in range(len(my_list)):
    if my_list[i]%2==0:
        count +=1
print('The count of even numbers in the list', count)
Out:
The count of even numbers in the list 8

initial_val = 0
cumsum = []
for i in my_list:
    initial_val += i
    cumsum.append(initial_val)
print('The cummulative sums of the list', cumsum)
Out:
The cummulative sum of the list [1, 3, 6, 10, 15, 21, 28, 128, 238, 259, 292, 324, 326, 330]

