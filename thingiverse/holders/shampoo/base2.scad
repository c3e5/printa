include <defs.scad>

$fn=100;

h = 35;

difference () {
    translate ([0, 36.5, -2])
    rotate ([angle, 0, 0]) {
        difference () {
            linear_extrude (h+5) {
                polygon ([
                    [10, width-slack],
                    [-10, width-slack],
                    [-10, 0],
                    [10, 0]
                ]);
            }
            difference () {
                linear_extrude (h-3)
                translate ([0, width, 0])
                        slot_poly (0);
                translate ([-15, 0, h-20])
                rotate ([45, 0, 0]) cube (30);
            }
        }
    }
    translate ([0, 0, h+50])
        cube (100, center=true);
    translate ([0, 0, -50])
        cube (100, center=true);
}

linear_extrude (h) {
    difference () {
        union () {
            circle (33.5);
            polygon ([
                [10, 36.5],
                [-10, 36.5],
                [-10, 15],
                [10, 15]
            ]);
        }
        circle (32);
    }
}
linear_extrude (1.5)
    difference () {
        circle (33.5);
        circle (24);
    }
