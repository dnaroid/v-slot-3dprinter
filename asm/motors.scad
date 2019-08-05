module
motors_asm()
{
    // XY left
    T(motorXY_x, motorXY_y, motorXY_z)
    {
        NEMA(motorXY_type);
        nema17_damper();
        Tz(6) nema17_L_bracket();
    }

    // XY right
    T(-motorXY_x, motorXY_y, motorXY_z)
    {
        nema17_damper();
        NEMA(motorXY_type);
        Tz(6) nema17_L_bracket();
    }

    // Z
    T(motorZ_x, motorZ_y, motorZ_z) R(180, 0, 0)
    {
        NEMA(motorZ_type);
        nema17_damper();
        Tz(6) Rz(180) nema17_L_bracket();
    }
}

if (!hide_motors) {
    motors_asm();
}


