use <threads.scad>

$fn=100;
rotate_extrude () {
    polygon (points = [[0,0], [4,0], [4,15], [12,28],[0,28]]);
}
translate ([0,0,28])
metric_thread(diameter=8, pitch=3, length=5, internal=false, n_starts=2, angle=45);
