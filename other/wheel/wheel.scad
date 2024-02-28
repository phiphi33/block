diameter=5;
height=3;

center_diameter=3;
barre=0.6;


difference() {
	cylinder(h = height, r = diameter, center = false, $fn=100);
    cylinder(h = height, r = center_diameter/2, center = false, $fn=30);    
}
translate([-center_diameter/2,center_diameter/2-barre,0]) {
    cube(size=[center_diameter, center_diameter,height], center=false);
}


