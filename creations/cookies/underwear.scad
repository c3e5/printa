intersection () {
    translate ([0,0,18])
        scale ([0.3,0.3,0.2])
            surface(file = "underwear.png", center = true, invert = true);
    translate ([-100,-100,0])
        cube (200);
}
