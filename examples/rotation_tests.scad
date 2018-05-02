CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left

L=10;

dir_vect = [0,0,1];
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

echo ("CubePoints:", CubePoints);
polyhedron (
  points = CubePoints,
  faces = CubeFaces
);
hull () {
    sphere (1);
    translate (dir_vect*L) sphere (1);
}
