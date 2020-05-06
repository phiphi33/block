import os
import csv
import sys

# generate list-all.txt if list-all.csv exist
with open('list-all.csv', newline='') as csvfile:
    dialect = csv.Sniffer().sniff(csvfile.read(2048), delimiters=";")   
    csvfile.seek(0)
    reader = csv.DictReader(csvfile, dialect=dialect)

    #create directories
    if not os.path.exists("stl"):
        os.makedirs("stl")
    if not os.path.exists("stl/electronic"):
        os.makedirs("stl/electronic")
    if not os.path.exists("stl/basic"):
        os.makedirs("stl/basic")


    # Initialize list-elec.txt
    file = open("openscad-commands.txt","w")
    quote = "\\\""
    context = ""
    for row in reader:
        # Change typeOfElement            
        if "#" in row['Filename']:
            context = row['Filename']
            print(context)
        else:
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
                #Preview in another directory
                #preview = preview.replace("electronic", "electronic/preview", 1) 
                file.write(preview + "\n")
                #TODO : 1 image ? https://stackoverflow.com/questions/30227466/combine-several-images-horizontally-with-python

            if "#Plates" in context:
                params = row['Filename'].split("-")
                model = params[0]
                length1 = params[1] if len(params) > 1 else 1
                length2 = params[2] if len(params) > 2 else 1
                length3 = params[3] if len(params) > 3 else 1
                filename = row['Filename'] + ".stl"
                stl = "openscad -o ./stl/basic/" + row['Filename'] + ".stl" + " clip_and_block.scad"
                stl += " -D model=" + quote + model + quote
                stl += " -D length1=" + str(length1)
                stl += " -D length2=" + str(length2)
                stl += " -D length3=" + str(length3)
                #stl = "openscad -o ./stl/basic/{4} clip_and_block.scad -D model=\\\"{0}\\\" -D length1={1} -D length2={2} -D length3={3}".format(model, length1, length2, length3, filename)
                file.write(stl + "\n")    

                #Generate preview
                preview = stl.replace(".stl", ".png", 1)
                #Preview in another directory
                #preview = preview.replace("electronic", "electronic/preview", 1) 
                file.write(preview + "\n")           


                    

    #Add clips preview for the folder stl/clips
    StlFiles = os.listdir("./stl/clips")
    for StlFile in StlFiles:
        if ".stl" in StlFile:
            PngFile = StlFile.replace(".stl", ".png", 1)
            preview = "openscad -o ./stl/clips/" + PngFile + " stl_preview.scad"
            preview += " -D filename=" + quote + "./stl/clips/" + StlFile + quote
            file.write(preview + "\n")
    
    file.close()
    
#sys.exit()       

for command in open('openscad-commands.txt'):
    print(command)
    os.system(command)

