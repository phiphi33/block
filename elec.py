import os
for line in open('list-elec.txt'):
    line = line.rstrip('\n')
    command = line
    os.system(command)
    print(command)
