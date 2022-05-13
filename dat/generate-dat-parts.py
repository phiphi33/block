# Help :
# python ./generate-all-parts.py help

import os
import csv
import sys


def parseStlToDat(pathToParse):
    # parse ./stl directory
    for path, subdirs, files in os.walk(pathToParse):
        files = [ file for file in files if file.endswith( ('.stl') ) ]
        for name in files:
            print(name)
            print(path)
            # check if path exist
            # datPath = path.replace("./stl", "./dat/parts")
            datPath = "./parts"
            datName = name.replace(".stl", ".dat")
            if not os.path.exists(datPath):
                os.makedirs(datPath)
            command = "python ./bin/stlToDat.py " + path + "/" + name + " " + datPath + "/" + datName
            print(command)
            result = os.system(command)
            if (result == 256): #Error with UTF8
                if not os.path.isfile('./bin/BinaryToASCII.py'):
                    print ("please install BinaryToASCII.py")
                if not os.path.exists('./tmp'):
                    os.makedirs('./tmp')                
          
                # copy file to binary.stl
                os.system("cp " + path + "/" + name + " ./bin/binary.stl")
                # generate ASCII.stl
                os.system("stl2ascii " + path + "/" + name + " ./bin/ASCII.stl")
                # generate Dat file
                command = "python ./bin/stlToDat.py ./bin/ASCII.stl " + datPath + "/" + datName
            print(result)

    # create zip
    # Finish script



if len(sys.argv) > 1:
    PartType = sys.argv[1]
else:
    PartType = ""

print("start...")

quote = "\\\""

if "help" in PartType:
    print ("Usage : generate-dat-parts.py <category name>")

    print ("You can also use : generate-dat-parts.py DAT")
    print ("To generate DAT directory")
    print ("Please install pip install numpy-stl")
    print ("Then install leocad and launch leocad -l ./dat")
    sys.exit() 


if "DAT" in PartType:
    # Create dat directory
    if not os.path.exists('./parts'):
        os.makedirs('./parts')

    # Check if stlToDat.py is here
    if not os.path.isfile('./bin/stlToDat.py'):
        print ("please install stlToDat.py")

    # List directory
    parseStlToDat('./other')
    parseStlToDat('../stl/electronic-parts')
    parseStlToDat('./clips')
    parseStlToDat('../stl/basic-parts')
    parseStlToDat('../tests/spiralwheel/stl')
    parseStlToDat('../tests/lego/stl')
    

