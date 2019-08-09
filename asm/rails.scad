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
    T(0, car_y + railY_yo, railX_z)
    Rx(180) rail(railX_type, railX_l, car_x);
    T(0, car_y + railY_yo, railX_z + 1) ALUMINUM() D()
    {
        Cu(pl + pt * 2, 60, 2);
        Ty(-33) Cu(railX_l - 10, 48, 5);
    }

    // left Z
    T(-hpl, bed_yo, -railZ_l / 2 - railZ_zo)
    Ry(90) rail(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);
    T(-hpl + railY_car_h, bed_yo, bed_z + bed_zo - 30)
    Rz(-90) corn(bed_s + 10, 2, 30);

    // right Z
    T(hpl, bed_yo, -railZ_l / 2 - railZ_zo)
    R(0, 90, 180)
    rail(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);
    T(hpl - railY_car_h, bed_yo, bed_z + bed_zo - 25)
    Rz(90) corn(bed_s + 10, 2, 20);

    T(0, bed_yo, bed_z + bed_zo - 26)
    Cu((hpl - railY_car_h) * 2 - 4, bed_s + 10, 2);
}

rails_asm();



