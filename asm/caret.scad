module
caret_asm()
{
    dx = 0;
    dy = -18;
    dz = 35;
    rz = 0;

    T(car_x - 15, car_y + railY_yo - 10, 33)
    R(0, 90, 90) optical_endstop();

    if (!hide_hotend) {
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) hotend_cr10();
            T(0, -15, -10) Rx(-90) fan_3010();
        }
    }
}

caret_asm();















