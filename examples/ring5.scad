$fn=100;
linear_extrude (5) {
    difference () {
        union () {
            polygon (points = [[3.8, 9.3], [0, 15], [-3.8, 9.3], [-10.5, 10.5], [-9.3, 3.8]]);
            circle (10.8);
        }
        circle (8.8);
    }
}
