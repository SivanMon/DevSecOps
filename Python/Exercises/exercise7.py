# write a function to describe a person: 
# #Height, Age, Some other description parameters (name, phone, address ...)
# Parameter that decides if you like the person:
#  if yes, then ... "Nice Person, beautiful..."
#  if no, then... "ugly, short...."

def describe_person(Height, age, *other, like):
    print("Height is: ", Height)
    print("age is: " ,age)
    print("other description: ", other)
    if like == "yes":
        print("He is a Nice Person")
    if like== "no":
        print("He is Ugly")
    return(Height, age, other, like)

describe_person(1.7,45,"phone=03539263","address=Tel-Aviv",like="no")
