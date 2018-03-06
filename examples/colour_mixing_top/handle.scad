$fn=100;
rotate_extrude () {
    polygon (points = [[0,0], [4,0], [4,20], [15,31],[6,31],[6,31.6],[0,31.6]]);
}
linear_extrude (36.6) circle (4, $fn=6);
