// (c)2013 Felipe Sanches <juca@members.fsf.org>
// (c)2018 Jon Ronen-Drori <jonr@yahoo.com>
// licensed under the terms of the GNU GPL version 3 (or later)

function normalize(v) = v / (sqrt(v[0] * v[0] + v[1] * v[1] + v[2] * v[2]));

CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left

//
// The voronoi() function generates 3D objects, which can be provided to
// a) difference() to create holes
// b) intersection() to restrict it to a a specified shape -- see voronoi_polygon.scad
//
// Parameters:
//   points (required) ... nuclei coordinates (array of [x, y] pairs)
//   L                 ... the radius of the "world" (the pattern is built within this circle)
//   thickness         ... the thickness of the lines between cells
//   round             ... the radius applied to corners (fillet in CAD terms)
//   nuclei (bool)     ... show nuclei sites
//
// These parameters need to be kept more or less in proportion to each other, and to the distance
// apart of points in the point_set. If one or the other parameter is increased or decreased too
// much, you'll get no output.
//
module voronoi(points, L = 200, thickness = 1, round = 6, nuclei = true) {
	for (p = points) {
        minkowski() {
            intersection_for(p1 = points){
                if (p != p1) {
                    dir_vect = normalize(p1-p);
                    perpX = [dir_vect[2], 0, -dir_vect[0]];
                    perpY = [
                      -dir_vect[0]*dir_vect[1],
                      pow(dir_vect[0],2)+pow(dir_vect[2],2),
                      -dir_vect[1]*dir_vect[2]
                    ];
                    CubePoints = [
                      -L*perpX - L*perpY,
                      L*perpX - L*perpY, 
                      L*perpX + L*perpY,
                      -L*perpX + L*perpY,
                      -L*perpX - L*perpY - 1.5*L*dir_vect,
                      L*perpX - L*perpY - 1.5*L*dir_vect, 
                      L*perpX + L*perpY - 1.5*L*dir_vect,
                      -L*perpX + L*perpY - 1.5*L*dir_vect
                    ];
                    translate((p + p1) / 2 - dir_vect * (thickness + round))
                    polyhedron (
                      points = CubePoints,
                      faces = CubeFaces
                    );
                }
            }
            sphere(r = round, $fn = 20);
        }
	}
}

//
// The random_voronoi() function is the helper wrapper over the voronoi() core.
// It generates random nuclei site coordinates into the square area,
// passing other arguments to voronoi() unchanged.
//
// Parameters:
//   n                 ... number of nuclei sites to be generated
//   nuclei (bool)     ... show nuclei sites
//   L                 ... the radius of the "world" (the pattern is built within this circle)
//   thickness         ... the thickness of the lines between cells
//   round             ... the radius applied to corners (fillet in CAD terms)
//   min               ... minimum x and y coordinate for nuclei generation
//   max               ... maximum x and y coordinate for nuclei generation
//   seed              ... seed for the random generator (random if undefined)
//   center (bool)     ... move resulting pattern to [0, 0] if true
//
module random_voronoi(n = 20, nuclei = true, thickness = 1, round = 6, min = 0, max = 100, seed = undef, center = false) {
	seed = seed == undef ? rands(0, 100, 1)[0] : seed;
	echo("Seed", seed);

	// Generate points.
	x = rands(min, max, n, seed);
	y = rands(min, max, n, seed + 1);
	z = rands(min, max, n, seed + 2);
	points = [ for (i = [0 : n - 1]) [x[i], y[i], z[i]] ];

	// Center Voronoi.
	offset_x = center ? -(max(x) - min(x)) / 2 : 0;
	offset_y = center ? -(max(y) - min(y)) / 2 : 0;
	offset_z = center ? -(max(z) - min(z)) / 2 : 0;
	translate([offset_x, offset_y, offset_z])

    voronoi(points, L = max * 2.5, thickness = thickness, round = round, nuclei = nuclei);
}

// example with randomly generated set of points
max = 100;
thickness = 2;
difference () {
    translate ([max/2, max/2, max/2])
        sphere (max/2);
    translate ([max/2, max/2, max/2])
        sphere (max/2-2);
    random_voronoi(n = 15, round = 6, thickness = thickness, min = 0, max = max, seed = 91.5202, nuclei=false);
}
