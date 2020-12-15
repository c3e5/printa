$fn=100;

thickness = 5;
pole_radius = 18;
screw_hole_radius = 2.2;
curve_angle = 25;
total_width = 16;

difference () {
  linear_extrude (total_width) {
    hull () {
      circle (thickness/2);
      translate ([40,0,0]) circle (thickness/2);
    }
    translate ([0,pole_radius + thickness/2,0])
    difference () {
      circle (pole_radius + thickness);
      circle (pole_radius);
      translate ([0,-50,0])
        square (100);
      rotate(curve_angle)
        square(100);
    }
    translate([0,pole_radius+thickness/2,0])
    rotate(curve_angle)
      hull () {
        translate ([0, pole_radius + thickness/2, 0]) circle(thickness/2);
        translate ([40, pole_radius + thickness/2, 0]) circle(thickness/2);
      }
  }
  
  translate ([30, 0, total_width/2])
  rotate ([270,0,0]) {
    translate ([0,0,-15]) linear_extrude (total_width)
      circle (screw_hole_radius);
    translate ([0,0,thickness/2 - 1.5])
    linear_extrude (1.6, scale=1.5)
      circle (screw_hole_radius);
  }
}