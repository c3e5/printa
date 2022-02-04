$fn=100;

module screw_hole()
{
  translate([0,0,-1]) linear_extrude(8) circle(2);
  translate([0,0,7]) linear_extrude(3, scale=2.5) circle(2);
  translate([0,0,10]) linear_extrude(30) circle(5);
}

difference() {
  linear_extrude(17, scale=0.77) circle(30);
  translate([0,0,12.5]) rotate([0,10,0]) linear_extrude(100) circle(100);
  translate([10.5,17,0]) screw_hole();
  translate([10.5,-17,0]) screw_hole();
  translate([-17,0,-1]) screw_hole();
  translate([0,0,-1]) linear_extrude(9) circle(7.8, $fn=6);
  translate([0,0,-1]) linear_extrude(3) circle(8.8);
  translate([0,0,-1]) linear_extrude(20) circle(4.6);
}