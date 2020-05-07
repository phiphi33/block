Cette page existe en [Français](https://gitlab.com/tedour/clip-and-block/README.fr.md).

Clip & block is an open source construction kit (CC By‑SA 4.0). It can create solid structure for electronic projects with a 3D printer. Pieces can be assembly and removed easily for adding and remove components. It is still under development but i present my own projects at the end of this page.
You can follow me on [Mastodon](https://mastodon.social/web/accounts/918095).

# Quickstart in one hour
## Print your first Clip & block
Clip & block is easy to print (no support, it's possible to print it in any direction, not to much précision needed, shapes are simple). 

To start, clone the project locally [GitLab](https://gitlab.com/tedour/clip-and-block/).


First step, you will print first pieces :

![first print](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/first-plate.png)

### For the pieces :
- go to directory [`stl/basic`](https://gitlab.com/tedour/clip-and-block/-/tree/master/stl/basic) ;
- get the file [`I-3.stl`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/basic/I-3.stl) ;
- get the file [`I-4.stl`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/basic/I-4.stl).
    
_`I-3.stl` → letter I is for the shape, number 3 is for number of holes._

### Pour le clip et le bloqueur :
- go to directory [`stl/clips`](https://gitlab.com/tedour/clip-and-block/-/tree/master/stl/clips) ;
- get the file [`blocker-2.stl`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/clips/blocker-2.stl) (lay it flat, there is a function for that in Cura) ;
- get the file [`clip-2.stl`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/clips/clip-2.stl).
    
_number 2 is for the height of the clip (for two pieces deux pièces). `blocker-2.stl` will work only with `clip-2.stl`._

You don't need two much materials for these pieces (2 g and 0,83 m with my settings). 
    
Now, you can assembly pieces ! To unmount, you need to push the blocker from the other side with a small tool. You can print other clips and blockers to play with it and see that it's strong !


# Pieces list
## Existing pieces 
In `stl/basic` directory, there is a big number of pieces (around 75). They are classified by shapes and number of holes (in three dimensions). Here is some samples :
    
|     Nom |         Image          | Description                                                  |
| ------ | -------------------- | ----------------------------------------------------------- |
|     I-3 |   ![I](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/I-3.png)   | I : in length, 3 holes length                       |
|  LF-3-2 | ![LF](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/LF-3-2.png) | LF : in L flat, 3 holes length, 2 on the other side     |
| L-2-1-1 | ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/L-2-1-1.png) | L : in L, 2 holes length, 1 height, 1 width     |
| L-2-2-3 | ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/L-2-2-3.png) | L : in L, 2 holes length, 2 height, 3 width     |
| U-2-2-2 | ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/U-2-2-2.png) | U : in  U                                               |
|   P-2-2 |  ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/P-2-2.png)  | P : Flat                                      |
| C-2-2-1 | ![L](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/C-2-2-1.png) | C : cube, 2 holes length, 2 height, 1 width     |
|    IR-3 |  ![I](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/IR-3.png)   | IR : in length, rounded (for pieces in rotation) |
|    IH-3 |  ![I](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/IH-3.png)   | IH : in length, half height                                  |
|   IHR-3 |  ![I](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/IHR-3.png)  | IHR : in length, half height, rounded                  |

_Perhaps i will remove some shape (C and P can do the same for example)…_

## Create your own pieces
If you can't find the piece you need, you can create your own with [OpenSCAD](https://www.openscad.org/), it's not so hard. For example, i describe here how to create piece P‑2‑3 (flat piece in 2 × 3) :
    
- open file [clip_and_block.scad](https://gitlab.com/tedour/clip-and-block/-/blob/master/clip_and_block.scad)
- modify `model` for the type to **P** ;
- modify `length1` for the length to **2** ;
- modify `length2` for the width to **3** ;
- you can preview with key `F6` ;
- and you can export to STL from OpenSCAD.
    
![OpenSCAD](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/openscad-plate.png)

# Pieces for electronic components
It's the interessant part of the project : you can integrate electronic components in clip&block.


## Existing components
I have create pieces for specific components. They are in the directory [`stl/electronic`](https://gitlab.com/tedour/clip-and-block/-/blob/master/stl/electronic).
    
For example, here are the two pieces that can include [NodeMCU](https://fr.wikipedia.org/wiki/NodeMCU) (I love this card :) ) :
![NodeMCU](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/nodemcu.png)
    
There is a lot of types of this pieces, with more or less holes, only on one side, etc. Here is the list of components that you can find in Clip & block. This list is growing and is not up to date :
    
|  Nom | Image | Description |
| ---: | :----: | :-----------|
|18650x2 Batterie holder | ![18650](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/18650x2.jpg) | Power supply 7,4 V |
|18650 Batterie shield V3 | ![18650](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/shield_v3.jpg) |  Power supply USB + 3,3 V + 5 V + recharge |
| BME 280 | ![BME280](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/bme280.jpg) | Temperature |
| Breadboard 25 holes | ![breadboard25](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/breadboard-25.jpg) | Breadboard |
| Button 14 × 20 | ![button](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/button14_20.jpg) | Button |
| D1 Mini | ![D1-mini](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/D1-mini.jpg) | Developpement card |
| DC Motor with gearbox | ![DC-motor](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/dc-geared.jpg) | DC Motor |
| L9110s Driver motor | ![l9110S](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/l9110s.jpg) | DC motor driver
| NodeMCU | ![nodemcu](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/esp8266.jpg) | Developpement card |
| OLED 128 × 64 | ![Afficheur OLED](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/oled128x64.jpg) | OLED screen |
| SG90 (une seule variante, à améliorer) | ![oled](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/sg90.jpg) | Servo motor |
| Simple switch | ![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/interrupteur.jpg) | Switch
| Display TM1637 | ![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/electronics/tm1637.jpg) | Display 4 × 7 segments |
    
I let you explore screenshots in the directory [`stl/electronic`].

## Create pieces for your own components
To create pieces for your own components you need to use your favorite CAD software to create the piece without holes. Your piece must be a multiple of 9,6mm length and with and a multiple of 4.8mm for the height.
    
After, you can had holes around your piece with OpenSCAD.



### Create the STL file of your component
Here is how i've worked with the TM1637 4-digit 7-segment :
    
- i've create a piece for the top and one for the bottom to "trap" the TM1637;
- next, i've create edges around to get a multiple of 9,6 mm (here, 48 mm : 5 holes × 28,8 mm et 3 holes × 4,8 mm heigth).
    
Top :
![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/tm1637-bottom.png)
    
Bottom :
![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/tm1637-top.png)

### Adding holes with OpenScad
    
- open file [`clip_and_block.scad`](https://gitlab.com/tedour/clip-and-block/-/blob/master/clip_and_block.scad) ;
- put your STL file in the directory [`import`](https://gitlab.com/tedour/clip-and-block/-/blob/master/import) ;
- modify the parameter `model` for the type of piece at **F** (_Filename_) — for half height, choose **FH** ;
- in the array **holeArray**, enter coordinates of the holes (test to find the good ones) ;
- in the array **finalRotate**, you can turn your final piece;
- in the array **finalMirror**, you can mirror your final piece.
    
![TM1637](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/tm1637-openscad.png)


# My projects with Clip&Block
Here are the projects i've create with Clip & blocks — feel free to ask me if you want more details about them :
    
- [Virtual Wall Roomba](https://www.thingiverse.com/thing:3413412) (mur virtuel pour aspirateur automatique) :
![Virtual Wall](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/virtual_wall1.jpg)
![Virtual Wall](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/virtual_wall2.jpg)
    
- [electronic hourglass](https://www.thingiverse.com/thing:3413412) (To use in the morning with my childrens :)) :
![Sablier](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/sablier1.jpg)
![Sablier](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/sablier2.jpg)
![Sablier](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/sablier3.jpg)
    
- RC-CAR (based on my project [FF RC-Car](https://www.thingiverse.com/thing:3133996)) :
![Tracteur](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/tracteur1.jpg)
![Tracteur](https://gitlab.com/tedour/clip-and-block/-/raw/master/docs/projects/tracteur2.jpg)


## Testing needed
Please test Clip&Block and tell me what you think about it on mastodon with the hashtag #clip_block !

## Create a community around Clip&Block
For now, i only have my Gitlab [GitLab](https://gitlab.com/tedour/clip-and-block). But you can follow my [Mastodon account](https://mastodon.social/web/accounts/918095) to discuss, if we could be two or three it could make things better. :)
