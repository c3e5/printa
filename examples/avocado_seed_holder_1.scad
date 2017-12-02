$fn=100;
linear_extrude (5, scale=0.9) polygon ([[-2.5, 25], [2.5, 25], [2.5, 45], [-2.5, 45]]);
linear_extrude (10) polygon ([[-2.5, 40], [2.5, 40], [2.5, 45], [-2.5, 45]]);
rotate (120) {
    linear_extrude (5, scale=0.9) polygon ([[-2.5, 25], [2.5, 25], [2.5, 45], [-2.5, 45]]);
    linear_extrude (10) polygon ([[-2.5, 40], [2.5, 40], [2.5, 45], [-2.5, 45]]);
}
rotate (240) {
    linear_extrude (5, scale=0.9) polygon ([[-2.5, 25], [2.5, 25], [2.5, 45], [-2.5, 45]]);
    linear_extrude (10) polygon ([[-2.5, 40], [2.5, 40], [2.5, 45], [-2.5, 45]]);
}
difference () {
    linear_extrude (20, scale=0.5) {
        difference () {
            circle (29);
            circle (25);
        }
    }
    translate ([0, 0, 10]) {
        linear_extrude (10) polygon ([[-4, -30], [4, -30], [4, 30], [-4, 30]]);
        rotate (60) linear_extrude (10) polygon ([[-4, -30], [4, -30], [4, 30], [-4, 30]]);
        rotate (120) linear_extrude (10) polygon ([[-4, -30], [4, -30], [4, 30], [-4, 30]]);
    }
}
