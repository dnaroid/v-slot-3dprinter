module
caret_asm()
{
    dx = 0;
    dy = -20;
    dz = 22 - 22;
    rz = 180;

    if (!hide_hotend) {
        T(car_x + dx, car_y + dy + railY_yo, 0 + dz)
        {
            R(0, 0, rz) e3d_hot_end_assembly(hotEnd_type, 1.75, true);

            T(-18, 0, -32) Rx(90) Ry(-90) blower_4010();
            T(18, 0, -32) Rx(90) Ry(90) blower_4010();

            T(0, 18, -28) Rx(90) fan_3010();
        }
    }
}

!  Ty(-car_y)caret_asm();





