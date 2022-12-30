tube_dia_int = 47;
tube_dia_ext = 50;
tube_conn_h = 10;
flange_h = 10;
thickness = 5;
curve_radius = 10;
margins_w = 10;
margins_h = 5;
num_holes = 4;
hole_dia_int = 4;
hole_dia_ext = 6;

$fn=100;


holes_displacement = tube_dia_int/2 + curve_radius + margins_w/2;

// high part: sleeve for the tube
rotate_extrude()
  polygon([
    [tube_dia_ext/2, curve_radius],
    [tube_dia_ext/2 + thickness, curve_radius],
    [tube_dia_ext/2 + thickness, curve_radius + flange_h],
    [tube_dia_ext/2, curve_radius + flange_h]]);

// curvy part
rotate_extrude()
  intersection() {
    translate([tube_dia_int/2 + curve_radius, curve_radius, 0])
      circle(curve_radius);
    polygon([
      [tube_dia_int/2, 0],
      [tube_dia_ext/2 + curve_radius, 0],
      [tube_dia_ext/2 + curve_radius, margins_h],
      [tube_dia_ext/2 + thickness, margins_h],
      [tube_dia_ext/2 + thickness, curve_radius],
      [tube_dia_int/2, curve_radius],
    ]);
    translate([tube_dia_int/2,0,0])
      square(curve_radius);
  }

// low part: margins
difference() {
  rotate_extrude()
    polygon([
      [tube_dia_int/2 + curve_radius, 0],
      [tube_dia_int/2 + curve_radius + margins_w, 0],
      [tube_dia_int/2 + curve_radius + margins_w, margins_h],
      [tube_dia_int/2 + curve_radius, margins_h],
    ]);
  
  for (i = [0 : num_holes]) {
    rotate([0, 0, i*360/num_holes])
    translate([holes_displacement, 0, 0])
      union() {
        linear_extrude(margins_h)
          circle(hole_dia_int/2 + 0.3);
        linear_extrude(1.5)
          circle(hole_dia_ext/2 + 0.3);
      }
  }
}
