import os
import csv
import sys

if len(sys.argv) > 1:
    PartType = sys.argv[1]
else:
    PartType = ""

quote = "\\\""

# Read list-categories.csv
with open('list-categories.csv', newline='') as csvFileCategories:
    dialect = csv.Sniffer().sniff(csvFileCategories.read(2048), delimiters=";")   
    csvFileCategories.seek(0)
    ReaderCategories = csv.DictReader(csvFileCategories, dialect=dialect)

    file = open("openscad-commands.txt","w")    
    for rowCategories in ReaderCategories:
        #For all categories
        #Create path
        if not os.path.exists(rowCategories['stl_directory']):
            os.makedirs(rowCategories['stl_directory'])

        if "Electronic-parts" in rowCategories['Name'] and (PartType == "" or PartType == "Electronic-parts"):
            with open(rowCategories['csv_file'], newline='') as csvfile:
                #Read csv file
                dialect = csv.Sniffer().sniff(csvfile.read(2048), delimiters=";")   
                csvfile.seek(0)
                reader = csv.DictReader(csvfile, dialect=dialect)
                
                for row in reader:
                    # Generate STL
                    stl = "openscad -o " + rowCategories['stl_directory'] + '/' + row['Filename'] + " " + rowCategories['scad_file']
                    stl += " -D model=" + quote + row['Model'] + quote
                    stl += " -D filename=" + quote + row['STL_source'] + quote
                    stl += " -D holeArray=[" + row['holeArray'] + "]"
                    stl += " -D finalRotate=" + row['finalRotate']                        
                    stl += " -D finalMirror=" + row['finalMirror']    
                    print (stl)
                    file.write(stl + "\n")

                    #Generate preview
                    preview = stl.replace(".stl", ".png", 1)
                    #Preview in another directory
                    #preview = preview.replace("electronic", "electronic/preview", 1) 
                    file.write(preview + "\n")
                    #TODO : 1 image ? https://stackoverflow.com/questions/30227466/combine-several-images-horizontally-with-python

        if 'Basic-parts' in rowCategories['Name'] and (PartType == "" or PartType == "Basic-parts"):
            print (csv.list_dialects())
            with open(rowCategories['csv_file'], newline='') as csvfile:
                #Read csv file
                reader = csv.DictReader(csvfile, dialect='excel')
                
                for row in reader:
                    params = row['Name'].split("-")
                    model = params[0]
                    length1 = params[1] if len(params) > 1 else 1
                    length2 = params[2] if len(params) > 2 else 1
                    length3 = params[3] if len(params) > 3 else 1
                    filename = row['Name'] + ".stl"
                    stl = "openscad -o " + rowCategories['stl_directory'] + '/' +  row['Name'] + ".stl" + " " + rowCategories['scad_file']
                    stl += " -D model=" + quote + model + quote
                    stl += " -D length1=" + str(length1)
                    stl += " -D length2=" + str(length2)
                    stl += " -D length3=" + str(length3)
                    #stl = "openscad -o ./stl/basic/{4} clip_and_block.scad -D model=\\\"{0}\\\" -D length1={1} -D length2={2} -D length3={3}".format(model, length1, length2, length3, filename)
                    file.write(stl + "\n")    
                    print(stl)

                    #Generate preview
                    preview = stl.replace(".stl", ".png", 1)
                    #Preview in another directory
                    #preview = preview.replace("electronic", "electronic/preview", 1) 
                    file.write(preview + "\n")  


        if 'Lego' in rowCategories['Name'] and (PartType == "" or PartType == "Lego"):
            print (csv.list_dialects())
            with open(rowCategories['csv_file'], newline='') as csvfile:
                #Read csv file
                dialect = csv.Sniffer().sniff(csvfile.read(2048), delimiters=";")   
                csvfile.seek(0)
                reader = csv.DictReader(csvfile, dialect=dialect)
                
                for row in reader:
                    # Generate STL
                    stl = "openscad -o " + rowCategories['stl_directory'] + '/' + row['Filename'] + " " + rowCategories['scad_file']
                    stl += " -D model=" + quote + row['Model'] + quote
                    stl += " -D width=" + row['width']
                    stl += " -D length=" + row['length']
                    stl += " -D height=" + row['height']
                    stl += " -D width2=" + row['width2']
                    stl += " -D length2=" + row['length2']
                    stl += " -D holeArray=" + row['holeArray'] 
                    print (stl)
                    file.write(stl + "\n")

                    #Generate preview
                    preview = stl.replace(".stl", ".png", 1)
                    #Preview in another directory
                    #preview = preview.replace("electronic", "electronic/preview", 1) 
                    file.write(preview + "\n")                    

        if 'Spiralwheel' in rowCategories['Name'] and (PartType == "" or PartType == "Spiralwheel"):
            print (csv.list_dialects())
            with open(rowCategories['csv_file'], newline='') as csvfile:
                #Read csv file
                dialect = csv.Sniffer().sniff(csvfile.read(2048), delimiters=";")   
                csvfile.seek(0)
                reader = csv.DictReader(csvfile, dialect=dialect)
                
                for row in reader:
                    # Generate STL
                    stl = "openscad --render -o " + rowCategories['stl_directory'] + '/' + row['Filename'] + " " + rowCategories['scad_file']
                    stl += " -D type=" + quote + row['type'] + quote
                    stl += " -D dia_out=" + row['dia_out']
                    stl += " -D height=" + row['height']
                    stl += " -D spoke_count=" + row['spoke_count']
                    stl += " -D spoke_thickness=" + row['spoke_thickness']
                    stl += " -D tread_tickness=" + row['tread_tickness']
                    stl += " -D r1=" + row['r1'] 
                    stl += " -D r2=" + row['r2'] 
                    print (stl)
                    file.write(stl + "\n")

                    #Generate preview
                    preview = stl.replace(".stl", ".png", 1)
                    #Preview in another directory
                    #preview = preview.replace("electronic", "electronic/preview", 1) 
                    file.write(preview + "\n")                    



        if 'Clips' in rowCategories['Name'] and (PartType == "" or PartType == "Clips"):
            #Only for preview
            StlFiles = os.listdir("./stl/clips")
            for StlFile in StlFiles:
                if ".stl" in StlFile:
                    PngFile = StlFile.replace(".stl", ".png", 1)
                    preview = "openscad -o " + rowCategories['stl_directory'] + '/' +  PngFile + " " + rowCategories['scad_file']
                    preview += " -D filename=" + quote + rowCategories['stl_directory'] + '/' + StlFile + quote
                    file.write(preview + "\n")            


    file.close()

#sys.exit()       

for command in open('openscad-commands.txt'):
    print(command)
    os.system(command)