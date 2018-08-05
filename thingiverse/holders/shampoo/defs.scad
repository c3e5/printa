width = 10;
height = 80;
angle = atan (width / height);
diag = height / cos(angle) + width * tan(angle);
slack = 0.75;

up_down_trim = width*sin(angle);

module slot_poly (slot_slack) {
    polygon ([
        [7-slot_slack, -7+slot_slack],
        [-7+slot_slack, -7+slot_slack],
        [-7+slot_slack, -3-slot_slack],
        [-5, -3-slot_slack],
        [-2+slot_slack, 0],
        [2-slot_slack, 0],
        [5, -3-slot_slack],
        [7-slot_slack, -3-slot_slack]
    ]);
}
