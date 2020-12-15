$fn=100;

module chup()
{
  translate([19.5,0,-1])
    linear_extrude(8) circle(2.8);
}

difference() {
  union() {
    linear_extrude(3) circle(25);
    linear_extrude(8) circle(13);
  }
  linear_extrude(10) circle(4.2);
  translate ([0,0,-1])
    linear_extrude(3) circle(8, $fn=6);
  chup();
  rotate([0,0,120]) chup();
  rotate([0,0,240]) chup();
}
