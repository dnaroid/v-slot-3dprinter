module
electric_asm()
{
    T(-short + 28, short + 15, 7)
    R(0, -90, 0)
    optical_endstop();

    // T(-(short - 16), car_y + 3, 15)
    // R(0, 0, -90)
    // optical_endstop();
}

electric_asm();