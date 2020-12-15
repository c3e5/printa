difference () {
    translate ([0, 0, 11]) cube (22, center=true);
    translate ([-3, -12, 0]) {
        translate ([4, 24, 9])
            rotate (a=[90, 0, 0])
                cylinder (24, 4, 4);
        cube ([8, 24, 9]);
    }
}

difference () {
    translate ([0, 0, 22])
        rotate(45)
            cylinder (14, sqrt(242), 0, $fn=4);
    translate ([-20, 0, 27])
        rotate (a=[0, 90, 0]) cylinder (40, 2.5, 2.5);
}
