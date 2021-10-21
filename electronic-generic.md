# use electronic-generic
The easiest way to use it is to print each corner you need from the directory /stl/electronic-parts/electronic-generic

You have to be sure that the electronic card have enough place on each corner (Corners are 3.6mm)
## Step one : get the size of the component
For example, for the module ESP32-CAM, the size is 39.4mm x 26.8mm

## Define a grid of holes
You need to have a minimum of 1mm on each side of the module. So here is the number of holes for the size :
|# of holes|size|max size for the module|
|2 holes|19.2|17.2|
|3 holes|28.8|26.8|
|4 holes|38.4|36.4|
|5 holes|48.0|46.0|
|6 holes|57.6|55.6|
|7 holes|67.2|65.2|
|8 holes|76.8|74.8|
|9 holes|86.4|84.6|
|10 holes|96.0|94.0|

So the number of holes for the module 39.4mm x 26.8mm is 5x3 

## Define the rest of mm
With 5 holes, you have 48mm - 39.4 mm = 8mm (4mm each side)
With 3 holes, you have 28.8mm - 26.8 mm = 2mm (1mm each side)

