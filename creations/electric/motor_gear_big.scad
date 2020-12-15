use <parametric_involute_gear_v5.0.scad>

gear_thk = 5;
circle_thk = 3;

$fn=100;
translate([0,0,circle_thk])
gear (number_of_teeth=32,
    circular_pitch=268,
    gear_thickness = gear_thk,
    rim_thickness = gear_thk,
    rim_width = 10,
    hub_thickness = 0,
    hub_diameter = 22,
    bore_diameter = 4,
    twist=0,
    circles=0
);
linear_extrude (circle_thk)
    difference () {
        union () {
            polygon ([
                [10, 2.5],
                [55, 2.5],
                [55, 5],
                [65, 5],
                [65, -5],
                [55, -5],
                [55, -2.5],
                [10, -2.5]
            ]);
            circle (26);
        }
        circle (2);
        translate ([60, 0, 0]) circle (2.5);
    }
translate ([0,0,gear_thk+circle_thk])
    linear_extrude (1)
        difference () {circle (15); circle (2);}
linear_extrude (12)
    difference () {circle (3); circle (2);}
