include <defs.scad>

$fn=100;

h = 30;

difference () {
    translate ([0, 32, 0])
    difference () {
        linear_extrude (h) {
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

linear_extrude (h) {
    difference () {
        union () {
            circle (33.5);
            polygon ([
                [10, 32],
                [-10, 32],
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
