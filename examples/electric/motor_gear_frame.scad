$fn=100;

difference () {
    linear_extrude (3) {
        polygon ([
            [0, -7],
            [0, 7],
            [31, 7],
            [31, -7]
        ]);
        circle (14);
        translate ([31, 0, 0]) circle (7);
    }

    translate ([0, 0, -1])
        linear_extrude (5) circle (3.5);
    translate ([8.5, 0, -1])
        linear_extrude (5) circle (1.5);
    translate ([-8.5, 0, -1])
        linear_extrude (5) circle (1.5);
    translate ([31, 0, -1])
        linear_extrude (5) circle (3.2);
}
