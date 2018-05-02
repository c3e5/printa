
difference(){
    base();
    holderhols();
    diagonalCut();
}

module base(){
    difference(){
        cylinder(20, 55.3, 47, $fn=500);
        translate([0,0,-2])cylinder(25, 45, 38.5, $fn=500);
    }
}

module holderhols(){
    color("blue"){
        translate([17.7,-60,4]) rotate([0,-30,0]) cube([8,120,20]);
        translate([-24.5,-60,6]) rotate([0,15,0]) cube([8,120,20]);
    }
}

module diagonalCut(){
    translate([-60,-50,0]) rotate([0,-20,0]) cube([100,100,20]);
    translate([60,50,0]) rotate([0,-20,180]) cube([100,100,20]);
    
}