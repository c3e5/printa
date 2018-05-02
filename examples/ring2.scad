$fn=100;

ring_inner_diameter = 15.6;
ring_inner_radius = ring_inner_diameter / 2;

rotate_extrude () {
    polygon (points = [
        [ring_inner_radius, 0],
        [ring_inner_radius + 1.5, 0],
        [ring_inner_radius + 2, 0.5],
        [ring_inner_radius + 2.3, 1],
        [ring_inner_radius + 2.45, 1.5],
        [ring_inner_radius + 2.5, 2],
        [ring_inner_radius + 2.53, 2.5],
        [ring_inner_radius + 2.5, 3],
        [ring_inner_radius + 2.45, 3.5],
        [ring_inner_radius + 2.3, 4],
        [ring_inner_radius + 2, 4.5],
        [ring_inner_radius + 1.5, 5],
        [ring_inner_radius, 5]
    ]);
}