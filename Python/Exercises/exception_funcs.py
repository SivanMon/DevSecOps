import time
from random import randint

def top_func():
    while(1):
        time.sleep(1)
        try:
            middle_func()
        except:
            print('something bad happend at dangerous function')    

def middle_func():
    num = randint(-1,1)
    #print(dangerous_divide_nums(4, num))        
    print(safe_divide_nums(5,num))
    print(add_nums(3, 7))

def dangerous_divide_nums(a, b):
    return a / b

def safe_divide_nums(a, b):
    try:
        result = a / b
    except:
        print("safe fixed locally")
        raise
    return result

def add_nums(a, b):
    return a+b

top_func()