$fn=100;
linear_extrude(2) circle(11.85);

intersection() {
    scale([0.5,0.5,0.5]) surface("ribbon1.png", center=true);
    linear_extrude(2.6) circle(12);
}