size =9.6;
model = "I";

length1 = 10;
length2 =2;
length3 = 2 ;

cube_turn = 0; //(0 => No turn, 1=> 1 turn, 2 => 2 turns)

// Model I
if (model == "I") {
    for (x = [0:length1-1]) {
        if (cube_turn >= 1 && x==0) {
            rotate([180,0,0]) {
                translate([0,x*size-size,-size/2]) import("imports/hole-cube-turn.stl");
            }
        }  else if(cube_turn == 2 && x==length1-1) {
            translate([0,x*size,0]) import("imports/hole-cube-turn.stl");
        } else {
            echo (x);
            translate([0,x*size,0]) holeCube();
        }
    }
}

// Model IH (I Half)
if (model == "IH") {
    for (x = [0:length1-1]) {
        if (cube_turn >= 1 && x==0) {
            rotate([0,0,180]) {
                translate([-size,-size,0]) import("imports/hole-cube-half-turn.stl");
            }
        }  else if(cube_turn == 2 && x==length1-1) {
            translate([0,x*size,0]) import("imports/hole-cube-half-turn.stl");
        } else {
            echo (x);
            translate([0,x*size,0]) import("imports/hole-cube-half.stl");
        }
    }
}

//Model LF (L Flat)
if (model == "LF") {
    for (x = [0:length1-1]) {
        if (cube_turn >= 1 && x==0) {
            rotate([180,0,0]) {
                translate([0,x*size-size,-size/2]) import("imports/hole-cube-turn.stl");
            }
        }   else {
            echo (x);
            translate([0,x*size,0]) holeCube();
        }
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

module holeCube() {
    //import("imports/hole-cube.stl");
    difference() {
        cube([size,size,size/2]);
        translate([size/2, size/2, 0]) cylinder (h = size/4, r1=8/2, r2=6.4/2, center=false, $fn=100 );
       translate([size/2, size/2, size/4])  cylinder (h = 4.8, r1=6.4/2, r2=8/2, center=false, $fn=100 );
    }
    }
