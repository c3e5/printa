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
//
// These parameters need to be kept more or less in proportion to each other, and to the distance
// apart of points in the point_set. If one or the other parameter is increased or decreased too
// much, you'll get no output.
//
module voronoi(p, points, L = 200, thickness = 1, round = 6) {
    minkowski() {
        intersection_for(p1 = points){
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
        sphere(r = round, $fn = 20);
    }
}

n=10;
points = [
    for (i = [0:n]) [
        for (j = [0:n]) [
            for (k = [0:n]) [i*5,j*5,k*5]
        ]
    ]
];

function _point (points, i, j, k) =
    (i >= 0 && i <= n) ?
        (j >= 0 && j <= n) ?
            (k >= 0 && k <= n) ?
                [points [i][j][k]] : [] : [] : [];

function find_close_points (
    point_array, i, j, k
) =
    concat (
        _point (points, i-1, j, k),
        _point (points, i+1, j, k),
        _point (points, i-1, j-1, k),
        _point (points, i+1, j-1, k),
        _point (points, i-1, j+1, k),
        _point (points, i+1, j+1, k),
        _point (points, i, j-1, k),
        _point (points, i, j+1, k),

        _point (points, i-1, j, k-1),
        _point (points, i+1, j, k-1),
        _point (points, i-1, j-1, k-1),
        _point (points, i+1, j-1, k-1),
        _point (points, i-1, j+1, k-1),
        _point (points, i+1, j+1, k-1),
        _point (points, i, j-1, k-1),
        _point (points, i, j, k-1),
        _point (points, i, j+1, k-1),

        _point (points, i-1, j, k+1),
        _point (points, i+1, j, k+1),
        _point (points, i-1, j-1, k+1),
        _point (points, i+1, j-1, k+1),
        _point (points, i-1, j+1, k+1),
        _point (points, i+1, j+1, k+1),
        _point (points, i, j-1, k+1),
        _point (points, i, j, k+1),
        _point (points, i, j+1, k+1)
    );

//for (i = [0:n]) for (j=[0:n]) for (k=[0:n]) {
//    close_points = find_close_points (
//        points, i, j, k
//    );
//    voronoi (points[i][j][k], close_points);
//}
