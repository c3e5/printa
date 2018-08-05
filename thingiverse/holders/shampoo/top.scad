include <defs.scad>;

difference () {
    translate ([0,0,-up_down_trim])
    rotate ([angle, 0, 0]) {
        linear_extrude (35) {
            polygon ([
                [10, width-slack],
                [-10, width-slack],
                [-10, 0],
                [10, 0]
            ]);
        }
        difference () {
            linear_extrude (20)
                slot_poly (slack);
            translate ([-15, -7+slack, 13])
                rotate ([45,0,0]) cube(30);
        }
    }
    translate ([-15, -15, 30]) cube(30);
    translate ([-15, -15, -30]) cube(30);
}

translate ([0, 0, 30])
linear_extrude (5)
polygon ([
    [-10, -4],
    [10, -4],
    [10, 5.5],
    [20, 15],
    [20, 20],
    [-20, 20],
    [-20, 15],
    [-10, 5.5]
]);

linear_extrude (35)
polygon ([
    [20, 20],
    [20, 15],
    [-20, 15],
    [-20, 20]
]);