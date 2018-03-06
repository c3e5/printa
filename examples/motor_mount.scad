// PRUSA iteration3
// Z axis bottom holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module z_bottom_base(){
 translate([0,-16.5,0]) cube([20,15,24]); // plate touching the base
 translate([0,41.5,0]) cube([20,15,24]); // plate touching the base
 translate([-20,-16.5,0]) cube([67,73,5]); // plate touching the base
}

module z_bottom_fancy(){
    translate([47-6,-1+2.5+67,0]) rotate([0,0,-45-90]) translate([-15,0,-1]) cube([30,30,51]);
    translate([47-6,-9+2.5,0]) rotate([0,0,-45-90]) translate([-15,0,-1]) cube([30,30,51]);
 
    translate([-36,-1+2.5+67,0]) rotate([0,0,-45-90]) translate([-15,0,-1]) cube([30,30,51]);
    translate([-36,-9+2.5,0]) rotate([0,0,-45-90]) translate([-15,0,-1]) cube([30,30,51]);
 
    // Stiffner cut out
    translate([23,0,5.5]) rotate([0,-45,0]) translate([0,-17.1,0]) cube([30,80,30]);
}

module z_bottom_holes(){
    // Frame mounting screw holes
    translate([-1,-9,15]) rotate([0,90,0]) cylinder(h = 50, r=2.8, $fn=30);
    translate([-1,49,15]) rotate([0,90,0]) cylinder(h = 50, r=2.8, $fn=30);

    // Frame mounting screw head holes
    translate([3,-9,15]) rotate([0,90,0]) cylinder(h = 20, r=4.2, $fn=30);
    translate([3,49,15]) rotate([0,90,0]) cylinder(h = 20, r=4.2, $fn=30);

    // Frame mounting screw holes
    translate([-10,4.5,-1]) cylinder(h = 50, r=2.8, $fn=30);
    translate([-10,35.5,-1]) cylinder(h = 50, r=2.8, $fn=30);

    // motor mounting
    translate([23,20,-1]){

    translate([15.5,15.5,-1]) cylinder(h = 30, r=1.8, $fn=30);
    translate([15.5,-15.5,-1]) cylinder(h = 30, r=1.8, $fn=30);
    translate([-15.5,15.5,-1]) cylinder(h = 30, r=1.8, $fn=30);
    translate([-15.5,-15.5,-1]) cylinder(h = 30, r=1.8, $fn=30);

    translate([15.5,15.5,4]) cylinder(h = 30, r=3.2, $fn=30);
    translate([15.5,-15.5,4]) cylinder(h = 30, r=3.2, $fn=30);
    translate([-15.5,15.5,4]) cylinder(h = 30, r=3.2, $fn=30);
    translate([-15.5,-15.5,4]) cylinder(h = 30, r=3.2, $fn=30);

    translate([0,0,-1]) cylinder(h = 20, r=12, $fn=30);
 }

}

difference(){
    z_bottom_base();
    z_bottom_fancy();
    z_bottom_holes();
}
