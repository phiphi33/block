use <LEGO.scad>;

size =9.6;
model="LE";

// // 1x5-1x6
// width=1;
// length=6;
// height=1;
// holeArray=[[-1,0,0],[-1,1,0],[-1,2,0],[-1,3,0],[-1,4,0]];

// // 1x5-2x6
// width=2;
// length=6;
// height=1;
// holeArray=[[-1,0,0],[-1,1,0],[-1,2,0],[-1,3,0],[-1,4,0]];

// // 1x2-1x3
// width=1;
// length=3;
// height=1;
// holeArray=[[-1,0,0],[-1,1,0]];

// // 1x2-2x3
// width=2;
// length=3;
// height=1;
// holeArray=[[-1,0,0],[-1,1,0]];

// L1x2-L3x4
width=1;
length=3;
height=1/3;
holeArray=[[-1,0,0],[-1,1,0],[-2,0,0]];
width2=1;
length2=4;

// // 1x2-L3x3
width=1;
length=3;
height=1/3;
holeArray=[[-1,0,0],[-1,1,0]];
width2=1;
length2=3;



// // L1x2-L2x3
// width=1;
// length=2;
// height=1;
// holeArray=[[-1,0,0],[-1,1,0],[-2,0,0]];
// width2=1;
// length2=3;


finalRotate=[0,0,0];
finalMirror=[0,0,0];

rotate([finalRotate[0], finalRotate[1], finalRotate[2]]) {
mirror([finalMirror[0], finalMirror[1], finalMirror[2]]) {    
    // Model LE => Lego
    if (model == "LE") {
        block(
            type="brick",
            width=width,
            length=length,
            height=height
        );        
        
        if (width2 > 0) {
            translate([-7.8,7.8,0]) {
                rotate([0,0,270]) {
                    block(
                        type="brick",
                        width=width2,
                        length=length2,
                        height=height
                    );                   
                }            
            }

        }
            
        for(i= [0 : len(holeArray) - 1]) // rows
        {
            echo(str("row:",i));

            echo(str(holeArray[i][0], ",",holeArray[i][1], ",", holeArray[i][2] ));
            translate([holeArray[i][1]*size,holeArray[i][0]*size,holeArray[i][2]*size/2]) holeCube();

        }
        
    }

    // Model F => File
    if (model == "F") {
        import(str("imports/",filename));
        
        for(i= [0 : len(holeArray) - 1]) // rows
        {
            echo(str("row:",i));

            echo(str(holeArray[i][0], ",",holeArray[i][1], ",", holeArray[i][2] ));
            translate([holeArray[i][1]*size,holeArray[i][0]*size,holeArray[i][2]*size/2]) holeCube();

        }
    }

    // Model FH => File Half (Half height
    if (model == "FH") {
        import(str("imports/",filename));
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

}//finalMirror
}//finalRotate

module holeCube() {
    import("../../imports/hole-cube.stl");
    /*difference() {
        cube([size,size,size/2]);
        translate([size/2, size/2, 0]) cylinder (h = size/4, r1=8/2, r2=6.4/2, center=false, $fn=100 );
       translate([size/2, size/2, size/4])  cylinder (h = 4.8, r1=6.4/2, r2=8/2, center=false, $fn=100 );
    }*/
}

module holeCubeHalf() {
   import("imports/hole-cube-half.stl");
    /*difference() {
        cube([size,size,size/2]);
        translate([size/2, size/2, 0]) cylinder (h = size/4, r1=8/2, r2=6.4/2, center=false, $fn=100 );
       translate([size/2, size/2, size/4])  cylinder (h = 4.8, r1=6.4/2, r2=8/2, center=false, $fn=100 );
    }*/
}   