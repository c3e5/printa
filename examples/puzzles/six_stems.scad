length = 50;
deduction = 1;

module one_stem (deduct) {
  rotate (45) cube ([
    length / sqrt(8) - deduct,
    length / sqrt(8) - deduct,
    length
  ], center=true);
}

module one_axis_full (deduct) {
  translate ([0, -length/4, 0]) one_stem (deduct);
  translate ([0, length/4, 0]) one_stem (deduct);
}

module one_axis () {
  difference () {
    one_axis_full (deduction);
    rotate ([90, 0, 90]) one_axis_full (0);
  }
}

// uncomment this to see what the full puzzle looks like
//one_axis ();
//rotate ([90, 0, 90]) one_axis ();
//rotate ([90, 90, 0]) one_axis ();

rotate ([90, 135, 0])
intersection () {
  translate ([-100, 0, -100]) cube (200);
  one_axis ();
}
