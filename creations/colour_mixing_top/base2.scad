use <threads.scad>

$fn=100;
difference () {
    rotate_extrude () {
        polygon (points = [[0,0], [20,0], [0,10]]);
    }
    metric_thread(diameter=9.6, pitch=3, length=6, internal=true, n_starts=2, angle=45);
}
