module
rails_asm()
{
    Tz(10)
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
            Cu(profile_l + profile_t * 2, 50, 3);
            Ty(-20) Cu(profile_l - 60, 21, 30);
        }

        // conductor
        // *T(140, car_y + railY_yo + railX_yo + 0, railX_z + railX_car_h - 8)
        // D()
        // {
        //     U()
        //     {
        //         T(8, -2.5, 2.5) plate(45, 45, 2, r = 2);
        //         // T(0, -25, -1) Cu(60, 5, 3);
        //     }
        //     T(-10, 17) Cy(1, 50);
        //     T(-10, -17) Cy(1, 50);

        //     T(12.5, -8) Cy(1, 50);
        //     T(12.5, 8) Cy(1, 50);
        //     T(12.5 + 15, -8) Cy(1, 50);
        //     T(12.5 + 15, 8) Cy(1, 50);

        //     T(-10, 0) Cy(1, 50);
        // }

        T(car_x, car_y + railY_yo + railX_yo + 3, railX_z + railX_car_h + 1)
        corn(30, 2, 30, 45);

        bed_corn_h = 45;

        // left Z
        T(-hpl, bed_yo, -railZ_l / 2 - railZ_zo)
        Ry(90) rail(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);
        T(-hpl + bed_corn_h / 2 + railZ_car_h,
          bed_yo,
          bed_z + bed_zo - bed_corn_h)
        R(180, 0, 90) corn(bed_s + 10, 2, bed_corn_h);
        // right Z
        T(hpl, bed_yo, -railZ_l / 2 - railZ_zo)
        R(0, 90, 180)
        rail(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);
        T(hpl - bed_corn_h / 2 - railZ_car_h,
          bed_yo,
          bed_z + bed_zo - bed_corn_h)
        R(180, 0, -90) corn(bed_s + 10, 2, bed_corn_h);

        T(0, bed_yo, bed_z + bed_zo - bed_corn_h - 2)
        {
            Ty(bed_s / 2 - 35) Rx(-90) corn(hpl * 2 - 22, 2, bed_corn_h);
            Ty(-bed_s / 2 + 35) Rx(180) corn(hpl * 2 - 22, 2, bed_corn_h);
        }
    }
}
rails_asm();
