$fn=100;

thickness = 5;
pole_radius = 12;
screw_hole_radius = 2.2;

difference () {
  linear_extrude (30) {
    hull () {
      circle (thickness/2);
      translate ([30,0,0]) circle (thickness/2);
    }
    translate ([0,pole_radius + thickness/2,0])
    difference () {
      circle (pole_radius + thickness);
      circle (pole_radius);
      translate ([0,-50,0]) square (100);
    }
  }
  
  translate ([15, 0, 15]) rotate ([270,0,0]) {
    translate ([0,0,-15]) linear_extrude (30)
      circle (screw_hole_radius);
    translate ([0,0,thickness/2 - 1.5])
    linear_extrude (1.6, scale=1.5)
      circle (screw_hole_radius);
  }
}