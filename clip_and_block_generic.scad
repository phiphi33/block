// If width <> 0 and height <> 0, holes, xShift and 
// yShift are computed. size of the module in mm.
// holes are on the width size
width = 40.4; 
height = 42.7; 

margin= 0.5; // how many millimeter more on two side ?


size =9.6;
cornerSize = 3.6;
model="F";

holes = 3;

xShift=6 ; // values for xShift, xShiftEnd : 1, 2, 3, 4, 5, 6
xShiftEnd = xShift;
yShift=5; // values for yShift : 0, 1, 2, 3, 4, 5rc522

// compute holes, xShift and yShift if width and height are specified
holes = (width > 0 && height > 0) ? ceil((width + margin + 2) / size) : holes;  // 2 is here because we need at least 1 mm on each side
xShift = (width > 0 && height > 0) ? round((holes * size - (width + margin)) / 2) : xShift;
yShift = (width > 0 && height > 0) ? round(((ceil((height + margin) / size) * size) - (height + margin)) / 2) : yShift ;

echo("holes:", holes);
echo("xShift:", xShift);
echo("yShift:", yShift);
echo("debug:", (ceil((height + margin) / size) * size));

finalRotate=[0,0,0];
finalMirror=[0,0,0];



rotate([finalRotate[0], finalRotate[1], finalRotate[2]]) {
mirror([finalMirror[0], finalMirror[1], finalMirror[2]]) {
    

    //yShift = yShift - 1;

    for (x = [0:holes-1]) {
        difference() {
            translate([0,x*size,0]) holeCube();
            markers();
        }
        
        // Cube y
        difference() {        
            translate([-yShift,x*size,0]) cube(size=[yShift,size,size/2]);
            markers();
        }
        
        
        
        // First corner
        if (x == 0) {
          difference() {
              // Cube x
              translate([-yShift-cornerSize,x*size,0]) 
              
                cube(size=[cornerSize,xShift,size/2]);
              markers();
          }

    
          // Corner
          difference() {
              translate([-yShift,xShift+(x*size),0]) corner();
              markers();
          }
          
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

module markers() {
  markerSizeH = 0.8;
  markerSizeL = 2.8;    
   markerSpace = 1.6;
  // Markers
  for (i = [0:xShift-1]) {
      translate([size - 0.8,0.5 + (markerSpace * i),size / 4 - markerSizeL /2])
        color([0,1,0])
            cube([1.5,markerSizeH,markerSizeL]);
  }

  if (yShift > 0) {
      for (i = [0:yShift-1]) {
          translate([- yShift - 1.5 + (markerSpace * i),-1, size / 4 - markerSizeL /2])
            color([0,1,0])
                cube([markerSizeH,1.5,markerSizeL]);
      }       
  }

          
}

module corner() {
        // Corner
    // Corner bottom
    linear_extrude(height = 1.4)
    polygon(points=[[0,0], [0,cornerSize], [-cornerSize,0]]);
    // Corner height
    translate([0,0,3.4])
    linear_extrude(height = 1.4)
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