$fn=100;

linear_extrude(1.6)
    circle(15);
linear_extrude(2)
    difference() {
        circle(15);
        circle(13);
    }
linear_extrude(2.2)
    text("100", size=9, halign="center", valign="center");