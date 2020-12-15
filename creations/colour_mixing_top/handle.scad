$fn=100;
rotate_extrude () {
    polygon (points = [[0,0], [4,0], [4,20], [12,31],[6,31],[6,31.6],[0,31.6]]);
}
translate ([0,0,31.6]) cylinder (h=5, r1=4, r2=3.5, $fn=6);
