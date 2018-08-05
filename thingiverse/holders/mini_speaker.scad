$fn=100;

width = 15;

module outer_poly () {
    polygon ([
        [0,0],
        [0,width],
        [3,width],
        [width,3],
        [width,0]
    ]);
};

difference () {
    union () {
        linear_extrude (2) {
            difference () {
                outer_poly ();
                translate ([34,34]) circle (37);
                circle (1, $fn=4);
            }
        }
        linear_extrude (4.5) {
            difference () {
                outer_poly ();
                translate ([34,34]) circle (40);
                circle (1, $fn=4);
            }
        }
    }
    translate ([3.5, 3.5, -0.5]) linear_extrude (6) circle (1.8);
}
