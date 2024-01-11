size =9.6;
model="F";

length1=4;
length2=7;
length3=1;

filename="sg90-4x1.stl";
holeArray=[[-1,0,0],[-1,1,0],[4,0,0],[4,1,0]];

finalRotate=[0,0,0];
finalMirror=[0,0,0];

rounded = true;

rotate([finalRotate[0], finalRotate[1], finalRotate[2]]) {
mirror([finalMirror[0], finalMirror[1], finalMirror[2]]) {    
    // Model I
    if (model == "I") {
        for (x = [0:length1-1]) {
            echo (x);
            translate([0,x*size,0]) holeCube();
        }
    }

    // Model IR (Rounded)
    if (model == "IR") {
        if (length1 == 1) {
            import("imports/hole-cube-turn-1.stl");
        } 
        else 
        {
            
            for (x = [0:length1-1]) {
                if (x==0) {
                    rotate([180,0,0]) {
                        translate([0,x*size-size,-size/2]) import("imports/hole-cube-turn.stl");
                    }
                }  else if(x==length1-1) {
                    translate([0,x*size,0]) import("imports/hole-cube-turn.stl");
                } else {
                    echo (x);
                    translate([0,x*size,0]) holeCube();
                }
            }
        }
    }

    // Model IH (I Half)
    if (model == "IH") {
        for (x = [0:length1-1]) {
            echo (x);
            translate([0,x*size,0]) holeCubeHalf();
        }
    }

    // Model IHR (Rounded)
    if (model == "IHR") {
        for (x = [0:length1-1]) {
            if (x==0) {
                rotate([0,0,180]) {
                    translate([-size,-size,0]) import("imports/hole-cube-half-turn.stl");
                }
            }  else if(x==length1-1) {
                translate([0,x*size,0]) import("imports/hole-cube-half-turn.stl");
            } else {
                echo (x);
                translate([0,x*size,0]) holeCubeHalf();
            }
        }
    }

    // Model C (Cube)
    if (model == "C") {
        for (z = [0:length1-1]) {
           for (x = [0:length2-1]) {
               for (y = [0:length3-1]) {           
                   echo (x);
                   translate([y*size,x*size,z*size/2]) holeCube();                          
               }
           }        
        }
    }


    //Model UF (U Flat)
    if (model == "UF") {

        for (x = [0:length1-1]) {
            echo (x);
            translate([0,x*size,0]) holeCube();
        }
       for (x = [0:length2-1]) {
            translate([x*size,(length1-1)*size,0]) holeCube();
        }  

       for (x = [0:length3-1]) {
            translate([x*size,(length2-1)*size,0]) holeCube();
        }          
    }

    //Model LF (L Flat)
    if (model == "LF") {
        for (x = [0:length1-1]) {
            echo (x);
            translate([0,x*size,0]) holeCube();
        }
       for (x = [0:length2-1]) {
            translate([x*size,(length1-1)*size,0]) holeCube();
        }    
    }

    //Model L
    if (model == "L") {
        for (z = [0:length3-1]) {
            for (x = [0:length1-1]) {
                translate([z*size,x*size,0]) holeCube();
            }
            // Bloc
            translate([z*size,(length1-1+1)*size,0]) {
                cube([size,size/2,size/2],false);
            }
           for (x = [0:length2-1]) {
               translate([z*size,(length1-1+1)*size+size/2,x*size+size/2]) {
                    rotate([90,0,0]) {
                        holeCube();
                    }           
               }
             }            
        }
    }

    //Model P (Plate)
    if (model == "P") {
        for (x = [0:length1-1]) {
           for (y = [0:length2-1]) {
                translate([y*size,x*size,0]) holeCube();
           }
        }
    }

    //Model UF (U flat)
    if (model == "UF") {
        for (x = [0:length1-1]) {
            echo (x);
            translate([0,x*size,0]) holeCube();
        }
       for (x = [0:length2-1]) {
            translate([x*size,(length1-1)*size,0]) holeCube();
        }    
       for (x = [0:length3-1]) {
            translate([(length2-1)*size,(length1-1)*size - x*size,0]) holeCube();
        }        
    }

    //Model SF (S flat)
    if (model == "SF") {
        for (x = [0:length1-1]) {
            echo (x);
            translate([0,x*size,0]) holeCube();
        }
       for (x = [0:length2-1]) {
            translate([x*size,(length1-1)*size,0]) holeCube();
        }    
       for (x = [0:length3-1]) {
            translate([(length2-1)*size,(length1-1)*size + x*size,0]) holeCube();
        }        
    }

    //Model U
    if (model == "U") {
        for (x = [0:length1-1]) {
            translate([0,x*size,0]) holeCube();
        }
        // Bloc
        translate([0,(length1-1+1)*size,0]) {
            cube([size,size/2,size/2],false);
        }
       for (x = [0:length2-1]) {
           translate([0,(length1-1+1)*size+size/2,x*size+size/2]) {
                rotate([90,0,0]) {
                    holeCube();
                }           
           }
         }       
        // Bloc
        translate([0,(length1-1+1)*size,(length2-1+1)*size + size/2]) {
            cube([size,size/2,size/2],false);
        }     
       for (x = [0:length3-1]) {
           translate([0,(length1-1)*size - x*size ,(length2-1)*size+size+size/2]) {
                holeCube();
           }
         }        
    }

    //Model U
    if (model == "S") {
        for (x = [0:length1-1]) {
            translate([0,x*size,0]) holeCube();
        }
        // Bloc
        translate([0,(length1-1+1)*size,0]) {
            cube([size,size/2,size/2],false);
        }
       for (x = [0:length2-1]) {
           translate([0,(length1-1+1)*size+size/2,x*size+size/2]) {
                rotate([90,0,0]) {
                    holeCube();
                }           
           }
         }       
        // Bloc
        translate([0,(length1-1+1)*size,(length2-1+1)*size + size/2]) {
            cube([size,size/2,size/2],false);
        }     
       for (x = [0:length3-1]) {
           translate([0,(length1-1)*size + size + size/2 + x*size ,(length2-1)*size+size+size/2]) {
                holeCube();
           }
         }        
    }

    // Model F => File
    if (model == "F") {
        import(str("imports/",filename));
        if (len(holeArray) > 0) {
        for(i= [0 : len(holeArray) - 1]) // rows
        {
            echo(str("row:",i));

            echo(str(holeArray[i][0], ",",holeArray[i][1], ",", holeArray[i][2] ));
            translate([holeArray[i][1]*size,holeArray[i][0]*size,holeArray[i][2]*size/2]) holeCube();

        }
        }   
    }

    // Model FH => File Half (Half height
    if (model == "FH") {
        import(str("imports/",filename));
        if (len(holeArray) > 0) {
        for(i= [0 : len(holeArray) - 1]) // rows
        {
            echo(str("row:",i));

            echo(str(holeArray[i][0], ",",holeArray[i][1], ",", holeArray[i][2] ));
            translate([holeArray[i][1]*size,holeArray[i][0]*size+size,holeArray[i][2]*size/2+size/4]) {
                rotate([180,0,0]) {
                    holeCubeHalf();
                }
            }
                

        }
    }
    }

}//finalMirror
}//finalRotate

module holeCube() {
    if (rounded)
        import("imports/hole-cube-rounded.stl");
    else
        import("imports/hole-cube.stl");
    /*difference() {
        cube([size,size,size/2]);
        translate([size/2, size/2, 0]) cylinder (h = size/4, r1=8/2, r2=6.4/2, center=false, $fn=100 );
        translate([size/2, size/2, size/4])  cylinder (h = 4.8, r1=6.4/2, r2=8/2, center=false, $fn=100 );
    }*/
}

module holeCubeHalf() {
   import("imports/hole-cube-half.stl");
    //difference() {
    //    cube([size,size,size/2]);
    //    translate([size/2, size/2, 0]) cylinder (h = size/4, r1=8/2, r2=6.4/2, center=false, $fn=100 );
    //    translate([size/2, size/2, size/4])  cylinder (h = 4.8, r1=6.4/2, r2=8/2, center=false, $fn=100 );
    //}
}   