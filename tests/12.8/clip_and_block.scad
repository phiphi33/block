
size =12.8;
model = "CH";

size1=4;
size2=1;
size3=1 ;

rounded = false;

finalRotate=[0,0,0];
finalMirror=[0,0,0];



rotate([finalRotate[0], finalRotate[1], finalRotate[2]]) {
mirror([finalMirror[0], finalMirror[1], finalMirror[2]]) {    
    // Model C (Cube)    
    if (model =="C") {
        for (z = [0:size3-1]) {
           for (x = [0:size2-1]) {
               for (y = [0:size1-1]) {           
                   translate([y*size,x*size,z*size/2]) hole();                          
               }
           }        
        }        
    }
    // Model C (Cube) Half   
    if (model =="CH") {
        for (z = [0:size3-1]) {
           for (x = [0:size2-1]) {
               for (y = [0:size1-1]) {
                    rotate([180,0,0])
                   translate([y*size,x*size,z*size/2]) halfHole();                          
               }
           }        
        }        
    }
    
                       
}
}


module hole(corners=[true,true,true,true]) {
    halfHole(corners);
     translate([0,0,size/2]) mirror([0,0,1])  halfHole(corners);
}

module halfHole(corners=[true,true,true,true]) {
    $fn=100;

    
    // return to origin
    translate([size/2, size/2, 0]) {
        difference() {
            cylinder(h=size/4,r1=size/2, r2=size/2, center=false);
            cylinder(h=size/4,r1=size/2 - size/16, r2=size/2- size/8, center=false);
            //translate([size/2, size/2, 0]) cylinder (h = size/4, r1=8/2, r2=6.4/2, center=false, $fn=100 );
           //translate([size/2, size/2, size/4])  cylinder (h = 4.8, r1=6.4/2, r2=8/2, center=false, $fn=100 );
        }
        if (corners[0]) {
            rotate([0,0,0]) corner();
        }
        if (corners[1]) {
            rotate([0,0,90]) corner();
        }
        if (corners[2]) {
            rotate([0,0,180]) corner();
        }
        if (corners[3]) {
            rotate([0,0,270]) corner();
        }            
    }
}

module corner() {
    $fn=100;
    difference() {
        cube([size/2, size/2, size/4], center=false);
        cylinder(h=size/4,r1=size/2, r2=size/2, center=false);
    }
}