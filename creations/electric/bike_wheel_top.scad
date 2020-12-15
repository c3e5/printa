$fn=100;

module chup()
{
  translate([19.5,0,-1])
    linear_extrude(20) circle(2.8);
}

difference() {
  union() {
    linear_extrude(12) rotate([0,0,180]) circle(35, $fn=3);
    linear_extrude(4) polygon([
      [8,-7],
      [8,7],
      [55,7],
      [55,-7],
    ]);
    translate([55,0,0])
      linear_extrude(4) circle(7);
  }
  translate([0,0,9.5])
    linear_extrude(8) circle(13.3);
  translate([0,0,-1])
    linear_extrude(14) circle(4.3);
  translate([55,0,-1])
    linear_extrude(10) circle(2.8);
  translate([40,0,-1])
    linear_extrude(10) circle(2.8);
  rotate([0,0,60]) chup();
  rotate([0,0,180]) chup();
  rotate([0,0,300]) chup();
}
