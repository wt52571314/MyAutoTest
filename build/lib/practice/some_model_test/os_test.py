import os
# print os.getcwd()
# print os.listdir(".")
for dirName, dirs, files in os.walk('.'):
    print dirName
    print dirs
    print files
    print '#'*50
