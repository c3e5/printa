linear_extrude(2.5) circle(30, $fn=7);

translate([0, 0, 2.5])
    linear_extrude(60, twist = 50, scale=1.6, $fn=3000)
    difference() {
        circle(30, $fn=7);
        circle(27.5, $fn=7);
    }