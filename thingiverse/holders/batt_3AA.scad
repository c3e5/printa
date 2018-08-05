$fn=100;

width = 48;
height = 17;
board_width = 29;
board_length = 15;
thickness = 2;

difference () {
    linear_extrude (board_length) {
        polygon ([
            [-width/2-10, 0],
            [-width/2-10, thickness],
            [-width/2-thickness, thickness],
            [-width/2-thickness, thickness+height],
            [-board_width/2-thickness, thickness+height],
            [-board_width/2-thickness, thickness*3+height],
            [-board_width/2, thickness*3+height],
            [-board_width/2, thickness*2+height],
            [board_width/2, thickness*2+height],
            [board_width/2, thickness*3+height],
            [board_width/2+thickness, thickness*3+height],
            [board_width/2+thickness, thickness+height],
            [width/2+thickness, thickness+height],
            [width/2+thickness, thickness],
            [width/2+10, thickness],
            [width/2+10, 0],
            [width/2, 0],
            [width/2, height],
            [width/6+thickness/2, height],
            [width/6+thickness/2, height-thickness],
            [width/6-thickness/2, height-thickness],
            [width/6-thickness/2, height],
            [-width/6+thickness/2, height],
            [-width/6+thickness/2, height-thickness],
            [-width/6-thickness/2, height-thickness],
            [-width/6-thickness/2, height],
            [-width/2, height],
            [-width/2, 0],
        ]);
    }
    translate ([width/2+5 + thickness/2, 20, board_length/2])
    rotate([90, 0, 0])
    linear_extrude(40) circle(1.8);
    translate ([-width/2-5 - thickness/2, 20, board_length/2])
    rotate([90, 0, 0])
    linear_extrude(40) circle(1.8);
}
