module finger () {
    translate ([0,10,20]) rotate([0,90,0]) {
        intersection() {
            rotate_extrude()
            translate([20,0,0]) circle(5);

            translate([50,50,0])
            cube(100, center=true);

            rotate([0,0,-20])
            translate([50,0,0])
            cube(100, center=true);
        }

        rotate([0,0,-20])
        translate([-10, 20, 0])
        rotate([0,90])
        cylinder (h=10, r1=3, r2=5);

        translate([20, 0, 0])
        rotate([90,0])
        cylinder (h=10, r1=5, r2=5.5);
    }
}

module cropped_finger (ang) {
    rotate ([0,ang,0]) finger();
}

module mesareket () {
    cropped_finger ();
    translate([20,0,0])
        cropped_finger (3);
    translate([-20,0,0])
        cropped_finger (-3);
    translate([40,0,0])
        cropped_finger (5);
    translate([-40,0,0])
        cropped_finger (-5);

    hull () {
        translate([-40, 0]) sphere(5.5);
        translate([40, 0]) sphere(5.5);
    }

    difference () {
        hull () {
            sphere (5.5);
            translate ([0, -60, 5])
                sphere(9);
        }
        hull () {
            translate ([0, -25, 3])
                sphere (4);
            translate ([0, -60, 5])
                sphere(6);
        }
        translate ([0, -50, 0])
            linear_extrude (15)
                circle (3);
    }
}

intersection () {
    translate ([0,0,4]) mesareket ();
    translate ([0,0,60])
        cube (120, center = true);
}
