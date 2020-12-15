$fn=100;

difference() {
  intersection() {
    translate([0,0,45])
      scale([1,1,4]) sphere(15);
    translate([0,0,22.5]) cube(45, center=true);
  }
  translate([0,0,-1])
    linear_extrude(100)
      circle(3.5);
}

difference() {
  translate([0,0,45])
    intersection() {
      scale([1,1,2.5]) sphere(15);
      cube(60, center=true);
  }
  linear_extrude(100) circle(7);
}
