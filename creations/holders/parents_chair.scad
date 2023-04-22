$fn=400;
linear_extrude(20)
difference() {
  union() {
    polygon([[-15, -15], [15, -15], [9, 13], [-9, 13]]);
    circle(14);
    translate([0,10,0]) circle(10);
  }
  circle(9);
  translate([0,-200,0])
    circle(186);
}