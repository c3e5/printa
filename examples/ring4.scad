$fn=100;
linear_extrude (5) {
    difference () {
        union () {
            polygon (points = [[-10, -12], [11, -13], [9, -5], [-9, -5]]);
            circle (10.8);
        }
        circle (8.8);
    }
}
translate ([3, -12, 2.5]) sphere (2);