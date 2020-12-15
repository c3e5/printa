module finger () {
    translate ([0,10,20]) rotate([0,90,0]) {
        intersection() {
            rotate_extrude()
            translate([20,0,0]) circle(3.6);

            translate([50,50,0])
            cube(100, center=true);

            rotate([0,0,-20])
            translate([50,0,0])
            cube(100, center=true);
        }

        rotate([0,0,-20])
        translate([-10, 20, 0])
        rotate([0,90])
        cylinder (h=10, r1=2, r2=3.6);

        translate([20, 0, 0])
        rotate([90,0])
        cylinder (h=10, r1=3.6, r2=4);
    }
}

module cropped_finger (ang) {
    rotate ([0,ang,0]) finger();
}

module mesareket () {
    cropped_finger ();
    translate([14,0,0])
        cropped_finger (3);
    translate([-14,0,0])
        cropped_finger (-3);
    translate([28,0,0])
        cropped_finger (5);
    translate([-28,0,0])
        cropped_finger (-5);
    translate([42,0,0])
        cropped_finger (8);
    translate([-42,0,0])
        cropped_finger (-8);
    translate([56,0,0])
        cropped_finger (11);
    translate([-56,0,0])
        cropped_finger (-11);

    hull () {
        translate([-56, 0]) sphere(4);
        translate([56, 0]) sphere(4);
    }

    difference () {
        hull () {
            sphere (5.5);
            translate ([0, -100, 5])
                sphere(9);
        }
        hull () {
            translate ([0, -25, 3])
                sphere (4);
            translate ([0, -100, 5])
                sphere(6);
        }
        translate ([0, -90, 0])
            linear_extrude (15)
                circle (3);
    }
}

intersection () {
    translate ([0,0,3]) mesareket ();
    translate ([0,0,100])
        cube (200, center = true);
}

linear_extrude(2.5) polygon ([
    [-30,0],
    [0,-30],
    [30,0]
]);
