$fn=100;

module chup() {
  translate([0,0,-1])
  linear_extrude(20)
  circle(2.8);
}

difference() {
  linear_extrude(15) polygon ([
    [-16,-16],
    [13,-16],
    [13,-26],
    [16,-26],
    [16,26],
    [13,26],
    [13,16],
    [-16,16]
  ]);
  translate ([0,0,4])
    linear_extrude(13) circle(11.3);
  translate ([0,0,-1])
    linear_extrude(13) circle(9);
  translate([11.5,11.5,0]) chup();
  translate([-11.5,11.5,0]) chup();
  translate([-11.5,-11.5,0]) chup();
  translate([11.5,-11.5,0]) chup();
  translate([0, -21, 6]) rotate([0,90,0]) chup();
  translate([0, 21, 6]) rotate([0,90,0]) chup();
}
