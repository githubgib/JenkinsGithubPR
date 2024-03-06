def some_function(): 
 import os;os.system('ls') # Bad practice: semicolon, import inside function
def anotherFunction(): # Non-PEP8 naming convention
  x = 1
  if x == 1: # Unnecessary comparison codes
    print("X is 1")
  list = [1,2,3] # Shadowing built-in name 'list'
  for i in range(len(list)): # Non-idiomatic loop
    print(list[i])
