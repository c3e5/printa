$fn=100;
difference () {
    rotate_extrude () {
        polygon (points = [[0,0], [20,0], [0,10]]);
    }
    linear_extrude (5) circle (4.15, $fn=6);
}
