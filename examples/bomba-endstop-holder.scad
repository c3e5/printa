m3_diameter = 3.6;

difference(){
	union(){
        linear_extrude (11)
            polygon ([
                [0, 0],
                [26, 0],
                [26, 5],
                [7, 5],
                [5, 7],
                [5, 35],
                [0, 35]
            ]);
	}
	translate([11, 6, 4.5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
	translate([21, 6, 4.5]) rotate([90, 0, 0]) cylinder(h =20, r = m3_diameter/2, $fn = 10);
	translate([-0.5, 15, 5.5]) rotate([0, 90, 0]) cylinder(h =7, r1 = 2.3, r2=3, $fn = 100);
	translate([-0.5, 28, 5.5]) rotate([0, 90, 0]) cylinder(h =7, r1 = 2.3, r2=3, $fn = 100);
}
