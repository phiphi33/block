import os
import csv
import sys
# generate list-elec.txt if list-elec.csv exist
with open('list-elec.csv', newline='') as csvfile:
    dialect = csv.Sniffer().sniff(csvfile.read(1024))   
    csvfile.seek(0)
    reader = csv.DictReader(csvfile, dialect=dialect)
    # Initialize list-elec.txt
    file = open("list-elec.txt","w")
    quote = "\\\""
    for row in reader:
        line = "openscad -o ./stl/electronic/" + row['Filename'] + " clip_and_block.scad" 
        line += " -D model=" + quote + row['Model'] + quote
        line += " -D filename=" + quote + row['STL_source'] + quote
        line += " -D holeArray=[" + row['holeArray'] + "]"
        line += " -D finalRotate=" + row['finalRotate']                        
        line += " -D finalMirror=" + row['finalMirror']        
        file.write(line + "\n")
                
    file.close()
    
#sys.exit()       
for line in open('list-elec.txt'):
    line = line.rstrip('\n')
    command = line
    os.system(command)
    print(command)
