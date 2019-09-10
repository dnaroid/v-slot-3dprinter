module
caret_asm()
{
    dx = 0;
    dy = -23;
    dz = 45;
    rz = 180;

    T(car_x - 15, car_y + railY_yo - 10, 33)
    R(0, 90, 90) optical_endstop();

    if (!hide_hotend) {
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) e3d_hot_end_assembly(hotEnd_type, 1.75, true);
        }
    }
}

caret_asm();















