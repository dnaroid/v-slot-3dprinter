module
motors_asm()
{
    // XY left
    T(motorXY_x, motorXY_y, motorXY_z)
    {
        NEMA(motorXY_type);
        nema17_L_bracket();
    }

    // XY right
    T(-motorXY_x, motorXY_y, motorXY_z)
    {
        NEMA(motorXY_type);
        nema17_L_bracket();
    }

    // Z
    T(motorZ_x, motorZ_y, motorZ_z) Rz(180)
    {
        NEMA(motorZ_type);
    }
}

if (!hide_motors) {
    motors_asm();
}


