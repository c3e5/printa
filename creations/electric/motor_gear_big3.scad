use <parametric_involute_gear_v5.0.scad>

$fn=100;

difference () {
    gear (number_of_teeth=40,
        circular_pitch=268,
        gear_thickness = 9,
        rim_thickness = 9,
        rim_width = 10,
        hub_thickness = 7,
        hub_diameter = 22,
        bore_diameter = 4,
        circles=0
    );

    linear_extrude (11)
        translate ([21, 0, -1]) circle (2.5);
}

linear_extrude (2) circle (33);
translate ([0,0,9])
    linear_extrude (3.5)
        difference () {circle (7); circle (2);}
linear_extrude (16)
    difference () {circle (3); circle (2);}
