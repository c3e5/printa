use <parametric_involute_gear_v5.0.scad>

$fn=100;
gear (number_of_teeth=32,
    circular_pitch=268,
    gear_thickness =10,
    rim_thickness = 10,
    rim_width = 10,
    hub_thickness = 7,
    hub_diameter = 22,
    bore_diameter = 4,
    circles=0
);
linear_extrude (3.5)
    difference () {
//        union () {
//            polygon ([
//                [-55, 2.5],
//                [-2.5, 2.5],
//                [-2.5, 55],
//                [2.5, 55],
//                [2.5, 2.5],
//                [55, 2.5],
//                [55, -2.5],
//                [2.5, -2.5],
//                [2.5, -55],
//                [-2.5, -55],
//                [-2.5, -2.5],
//                [-55, -2.5]
//            ]);
//            circle (40);
//        }
        polygon ([
            [10, 2.5],
            [50, 2.5],
            [50, 5],
            [60, 5],
            [60, -5],
            [50, -5],
            [50, -2.5],
            [10, -2.5]
        ]);
        circle (2);
        translate ([55, 0, 0]) circle (2.5);
    }
translate ([0,0,10])
    linear_extrude (3.5)
        difference () {circle (7); circle (2);}