from actions import *

# Do Actions
try:
    action1()
    action2()
    try:
        action3()
    except:
        print("action3 has failed")
    action4()
except:
    print("something went wrong overal.")

print("I am after the error")