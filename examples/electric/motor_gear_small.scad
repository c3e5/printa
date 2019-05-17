use <parametric_involute_gear_v5.0.scad>

thk = 8;
bore = 0;

$fn=100;

intersection () {
    gear (number_of_teeth=8,
        circular_pitch=268,
        gear_thickness = thk,
        rim_thickness = thk,
        rim_width = 5,
        hub_thickness = 0,
        hub_diameter = 22,
        bore_diameter = bore,
        twist = 0,
        circles=0);
}

translate ([0,0,thk])
    linear_extrude (12) circle (2.8);
