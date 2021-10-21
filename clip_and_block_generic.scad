size =9.6;
cornerSize = 3.6;
model="F";

holes = 5;

xShift=4 ; // values for xShift, xShiftEnd : 1, 2, 3, 4, 5, 6
yShift=1 ; // values for yShift : 0, 1, 2, 3, 4, 5
xShiftEnd=4 ;


finalRotate=[0,0,270];
finalMirror=[0,0,0];


rotate([finalRotate[0], finalRotate[1], finalRotate[2]]) {
mirror([finalMirror[0], finalMirror[1], finalMirror[2]]) {
    
    
    
    for (x = [0:holes-1]) {
        echo (x);
        translate([0,x*size,0]) holeCube();
        // Cube y
        translate([-yShift,x*size,0]) cube(size=[yShift,size,size/2]);
        
        
        // First corner
        if (x == 0) {
          // Cube x
          translate([-yShift-cornerSize,x*size,0]) cube(size=[cornerSize,xShift,size/2]);
          // Corner
          translate([-yShift,xShift+(x*size),0]) corner();
        }
        if (x > 0 && x == holes-1) {
          // Cube x
          translate([-yShift-cornerSize,(x+1)*size-xShiftEnd,0]) 
            cube(size=[cornerSize,xShiftEnd,size/2]);
          // Corner
          translate([-yShift,(x+1)*size-xShiftEnd,0]) mirror([0,1,0]) corner();
        }
        
    }

}//finalMirror
}//finalRotate

module corner() {
        // Corner
    // Corner bottom
    linear_extrude(height = 1.6)
    polygon(points=[[0,0], [0,cornerSize], [-cornerSize,0]]);
    // Corner height
    translate([0,0,3.2])
    linear_extrude(height = 1.6)
        polygon(points=[[0,0], [0,cornerSize], [-cornerSize,0]]);
}


module holeCube() {
    import("imports/hole-cube.stl");
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