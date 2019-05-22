//
// a parametric pot
//
// inspired by:
// https://www.thingiverse.com/thing:2918926
//

// user parameters
N = 11; // number of pyramid holes in a floor
radius = 45; // external radius
inner_radius = 37; // internal radius
num_floors = 7; // number of pyramid floors
bottom_width = 3; // width of the bottom layer

// do not edit below this line
angle_step = 360 / N;
floor_step = 30 * sin(angle_step/2);

echo ("total height:", floor_step * num_floors);

module pyramid(rad, ang) {
    hull () {
        rotate (ang/2) translate ([rad, 0, 0])
            sphere (0.1);
        rotate (-ang/2) translate ([rad, 0, 0])
            sphere (0.1);
        translate ([rad, 0, -rad * sin(ang/2)])
            sphere (0.1);
        translate ([rad, 0, rad * sin(ang/2)])
            sphere (0.1);
        translate ([rad * (1-sin(ang/2)/3),0, 0]) sphere(0.1);
    }
}

module pyramid_cut_floor (
  radius,
  angle_step,
  floor_step
) {
  for (ang = [angle_step:angle_step:360]) {
    rotate ([0,0,ang])
      hull () {
        pyramid (radius, angle_step);
        scale (2)
          pyramid (radius, angle_step);
      }
    translate ([0, 0, floor_step])
      rotate ([0, 0, ang + angle_step / 2])
        hull () {
          pyramid (radius, angle_step);
          scale (2)
            pyramid (radius, angle_step);
        }
  }
}

module pyramid_cuts (
  radius,
  angle_step,
  floor_step,
  num_floors
) {
  total_height = num_floors * floor_step;
  for (h = [0: floor_step*2: total_height])
    translate ([0, 0, h])
      pyramid_cut_floor (
        radius,
        angle_step,
        floor_step);
}

difference () {
  linear_extrude (num_floors * floor_step)
    circle (radius);
  pyramid_cuts (
    radius,
    angle_step,
    floor_step,
    num_floors);
  translate ([0,0,bottom_width])
  linear_extrude (num_floors * floor_step)
    circle (inner_radius, $fn=100);
}
