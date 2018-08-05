include <defs.scad>

difference () {
    translate ([0,0,-up_down_trim])
    rotate ([angle, 0, 0]) {
        difference () {
            linear_extrude (diag) {
                polygon ([
                    [10, width-slack],
                    [-10, width-slack],
                    [-10, 0],
                    [10, 0]
                ]);
            }
            difference () {
                linear_extrude (diag-3)
                    translate ([0, width, 0])
                        slot_poly (0);
                translate ([-15, 0, diag-20])
                    rotate ([45, 0, 0]) cube (30);
            }
        }
        difference () {
            linear_extrude (20)
                slot_poly (slack);
            translate ([-15, -7+slack, 13])
                rotate ([45,0,0]) cube(30);
        }
    }
    translate ([-15, -15, height]) cube(30);
    translate ([-15, -15, -30]) cube(30);
}