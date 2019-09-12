module
rails_asm()
{

    caretZ_o = -40;

    railY_xo = long;
    railY_z = 0;
    railY_placement_yo = 0;

    railX_z = railY_z + railY_car_h;

    // left Y
    Rz(90) T(railY_yo + railY_placement_yo, railY_xo, railY_z)
        rail(railY_type, railY_l, car_y - railY_placement_yo);

    // right Y
    Rz(90) T(railY_yo + railY_placement_yo, -railY_xo, railY_z)
        rail(railY_type, railY_l, car_y - railY_placement_yo);

    // X
    T(0, car_y + railY_yo + railX_yo - 0, railX_z)
    Rx(180) rail(railX_type, railX_l, car_x);

    T(0, car_y + railY_yo + railX_yo + 0, railX_z + railX_car_h - 8)
D()
    {
        // Cu(profile_l + profile_t * 2, 45, 4);
        Tz(3) Rx(90) corn(profile_l + profile_t * 2, 1.8, 10, 45);
        Ty(-15) Cu(profile_l - 60, 21, 30);
    }

    // conductor
    T(140, car_y + railY_yo + railX_yo + 0, railX_z + railX_car_h - 8)
*D()
    {
        U()
        {
            T(0, -3.5, 1) Cu(60, 48, 3);
            T(0, -25, -1) Cu(60, 5, 3);
        }
        T(-10, 17) Cy(1, 50);
        T(-10, -17) Cy(1, 50);

        T(12.5, -5) Cy(1, 50);
        T(12.5, 5) Cy(1, 50);
        T(12.5 + 15, -5) Cy(1, 50);
        T(12.5 + 15, 5) Cy(1, 50);

        hull(){
            T(-15, 0) Cy(1, 50);
            T(-27, 0) Cy(1, 50);
        }
    }
    //     T(motorXY_x, car_y + railY_yo + railX_yo + 0, railX_z + railX_car_h -
    //     20)
    // #Cu(13.5, 100, 100);
    // belts clip
    T(car_x, car_y + railY_yo + railX_yo + 3, railX_z + railX_car_h + 1)
     corn(40, 2, 30, 45);

    bed_corn_h = 30;

    //  Z
    for (x = [ -railZ_xo, railZ_xo ])
        T(x, short - hpt, -railZ_l / 2 - railZ_zo)
    R(0, 90, -90)
    rail(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);
}

rails_asm();



