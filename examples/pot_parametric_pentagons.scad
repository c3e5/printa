outer_radius = 40;
height = outer_radius;
polygon_degree = 5;
thickness = 7;

module polygon_extrusion (height, degree, radius)
{
  hull () {
    linear_extrude (0.1)
      circle (radius, $fn=degree);
    translate ([0,0,height])
      linear_extrude (0.1)
        rotate ([0,0,180/polygon_degree])
          circle (radius, $fn=degree);
  }
}

linear_extrude (3) circle (3);

difference () {
  polygon_extrusion (
    height,
    polygon_degree,
    outer_radius);
  difference () {
    polygon_extrusion (
      height,
      polygon_degree,
      outer_radius - thickness);
    linear_extrude (thickness)
      circle (outer_radius * 2);
  }
}
