import os
for line in open('list-plates.txt'):
    line = line.rstrip('\n')
    #print(line)
    params = line.split("-")
    #print(params)
    #print(len(params))
    model = params[0]
    length1 = params[1] if len(params) > 1 else 1
    length2 = params[2] if len(params) > 2 else 1
    length3 = params[3] if len(params) > 3 else 1
    filename = line + ".stl"
    print(filename)
    command = "openscad -o ./stl/basic/{4} clip_and_block.scad -D model=\\\"{0}\\\" -D length1={1} -D length2={2} -D length3={3}".format(model, length1, length2, length3, filename)
    os.system(command)
    print(command)
