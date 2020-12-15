$fn=100;

linear_extrude(23) {
  difference() {
    circle(22 / 2 + 0.5 + 2.5);
    circle(22 / 2 + 0.5);
    polygon([
      [-14*cos(-10),14*sin(-10)],
      [0,0],
      [14*cos(-10),14*sin(-10)],
      [20,20],
      [-20,20]]);
  }
  polygon([
    [14*cos(-10),14*sin(-10)],
    [16,14],
    [13.5,14],
    [11.5*cos(-10),11.5*sin(-10)]
  ]);
  polygon([
    [16,14],
    [4,14],
    [4,11.5],
    [12.5,5]
  ]);
  polygon([
    [-14*cos(-10),14*sin(-10)],
    [-16,14],
    [-13.5,14],
    [-11.5*cos(-10),11.5*sin(-10)]
  ]);
  polygon([
    [-16,14],
    [-4,14],
    [-4,11.5],
    [-12.5,5]
  ]);
}

linear_extrude(20) {
  polygon([
    [4,14],
    [4,20],
    [10,20],
    [10,17],
    [7,17],
    [7,14]
  ]);
  polygon([
    [-4,14],
    [-4,20],
    [-10,20],
    [-10,17],
    [-7,17],
    [-7,14]
  ]);
}
