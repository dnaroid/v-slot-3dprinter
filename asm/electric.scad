module
electric_asm()
{
    T(-short - 15, -short + 15)
    R(180, 0, 180)
    optical_endstop();

    T(-(short - 16), car_y + 3, 15)
    R(0, 0, -90)
    optical_endstop();
}

electric_asm();