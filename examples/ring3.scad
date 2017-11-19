$fn=100;
linear_extrude (5) {
    difference () {
        polygon (points = [[-12, -12], [12, -13], [10.5, 11], [-10.5, 11]]);
        circle (8.8);
    }
}
translate ([3, -12, 2.5]) sphere (2);