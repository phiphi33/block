import os
import csv
import sys

from PIL import Image, ImageFont, ImageDraw 

# generate list-elec.txt if list-elec.csv exist
with open('list-elec.csv', newline='') as csvfile:
    dialect = csv.Sniffer().sniff(csvfile.read(1024))   
    csvfile.seek(0)
    reader = csv.DictReader(csvfile, dialect=dialect)
    # Initialize list-elec.txt
    file = open("list-elec.txt","w")
    quote = "\\\""
    context = ""
    for row in reader:
        if "#Electronic" in context:
            # Generate STL
            stl = "openscad -o ./stl/electronic/" + row['Filename'] + " clip_and_block.scad" 
            stl += " -D model=" + quote + row['Model'] + quote
            stl += " -D filename=" + quote + row['STL_source'] + quote
            stl += " -D holeArray=[" + row['holeArray'] + "]"
            stl += " -D finalRotate=" + row['finalRotate']                        
            stl += " -D finalMirror=" + row['finalMirror']        
            file.write(stl + "\n")

            #Generate preview
            preview = stl.replace(".stl", ".png", 1)
            preview = preview.replace("electronic", "electronic/preview", 1)
            file.write(preview + "\n")

            

        # Change typeOfElement            
        if "#" in row['Filename']:
            context = row['Filename']

    file.close()
    
#sys.exit()       
for line in open('list-elec.txt'):
    line = line.rstrip('\n')
    command = line
    os.system(command)
    print(command)
