difference() {
  linear_extrude(7)
    polygon([[0,0],[55,0],[55,62],[0,62]]);
  translate([0,0,1.5])
    linear_extrude(4)
      import("/projects/printa/creations/sheikh_logo1.svg");
  translate([0,0,3])
    linear_extrude(5)
      polygon([[2,2],[53,2],[53,60],[2,60]]);
}