use <parametric_involute_gear_v5.0.scad>

$fn=100;
gear (number_of_teeth=8,
    circular_pitch=268,
    gear_thickness =5,
    rim_thickness = 5,
    rim_width = 5,
    hub_thickness = 5,
    hub_diameter = 22,
    bore_diameter = 2.1,
    //bore_diameter = 4,
    circles=0);
