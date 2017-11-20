intersection () {
    translate ([0,0,25])
        scale ([0.3,0.3,0.3])
            surface(file = "underwear.png", center = true, invert = true);
    translate ([-100,-100,0])
        cube (200);
}
