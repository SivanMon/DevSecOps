status = action1()
if (status == OK):
    status = action2()
    if (action2 == OK):
        status = action3()
        if (status == OK):
            action4()
            if (status == OK):
                print("Done !!!")
            else:
                print("action4 has failed")
        else:
            print("action3 has failed")
    else:
        print("action2 has failed")
else:
    print("action1 failed")
