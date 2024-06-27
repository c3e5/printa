tube_dia_int = 36.5;
tube_dia_ext = 40.5;
flange_h = 3;
thickness = 2;
curve_radius = 5.5;
margins_w = 1;
margins_h = 3;

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
rotate_extrude()
polygon([
  [tube_dia_int/2 + curve_radius, 0],
  [tube_dia_int/2 + curve_radius + margins_w, 0],
  [tube_dia_int/2 + curve_radius + margins_w, margins_h],
  [tube_dia_int/2 + curve_radius, margins_h],
]);
