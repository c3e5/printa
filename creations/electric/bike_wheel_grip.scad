$fn=100;

difference() {
  union() {
    linear_extrude(5) polygon([
      [0,-7],
      [0,7],
      [75,7],
      [75,-7],
    ]);
    translate([75,0,0])
      linear_extrude(5) circle(7);
    linear_extrude(5) circle(7);
  }
  translate([0,0,-1])
    linear_extrude(14) circle(3.3);
  translate([75,0,-1])
    linear_extrude(10) circle(2.8);
  translate([60,0,-1])
    linear_extrude(10) circle(2.8);
}
