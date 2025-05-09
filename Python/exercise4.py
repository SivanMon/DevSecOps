num1=0
num2=1
fibonacci_numbers = []

while(num1 <100):
    print(num1)
    fibonacci_numbers.append(num1)
    num1, num2 = num2, num1+num2

print (fibonacci_numbers)
