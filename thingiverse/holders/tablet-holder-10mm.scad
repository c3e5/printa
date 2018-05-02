
difference(){
    base();
    holderhols();
    diagonalCut();
}

module base(){
    scale ([1.2,1,1])
    difference(){
        cylinder(20, 55.3, 47, $fn=500);
        translate([0,0,-2])cylinder(25, 45, 38.5, $fn=500);
    }
}

module holderhols(){
    color("blue"){
        translate([17.7,-60,5]) rotate([0,-30,0]) cube([10,120,20]);
        translate([-24.5,-60,8]) rotate([0,15,0]) cube([10,120,20]);
    }
}

module diagonalCut(){
    translate([-70,-50,2.5]) rotate([0,-15,0]) cube([120,100,20]);
    translate([70,50,4.5]) rotate([0,-13,180]) cube([120,100,20]);
}
