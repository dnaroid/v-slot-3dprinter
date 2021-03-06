module
rim_asm()
{

    bz = -vl - pt - hpt;
    cz = -vl - pt + hpt;

    //// top

    for (x = [ -long, long ]) {
        T(x, railY_yo, 10 / 2)
        ALUMINUM() D()
        {
            Cu(20, railY_l, 10);
            Cu(20 - 1.5 * 2, railY_l + 1, 10 - 1.5 * 2);
        }
    }

    // left
    Rx(90) T(long, -hpt, -hpl) extrusion_profile_20x20_v_slot(pt, pl);

    // right
    Rx(90) T(-long, -hpt, -hpl) extrusion_profile_20x20_v_slot(pt, pl);

    // front
    R(90, 0, 90) T(short, -hpt, -hpl) extrusion_profile_20x20_v_slot(pt, pl);

    // back
    R(90, 0, 90) T(-short, -hpt, -hpl) extrusion_profile_20x20_v_slot(pt, pl);
    R(90, 0, 90)
    T(-short + profile_t, -hpt, -hpl) extrusion_profile_20x20_v_slot(pt, pl);

    //// mid

    // back right
    T(-long, -short, -vl - pt)
    extrusion_profile_20x20_v_slot(pt, vl);

    // back left
    T(long, -short, -vl - pt)
    extrusion_profile_20x20_v_slot(pt, vl);

    // center right
    T(-long, bed_yo, -vl - pt)
    extrusion_profile_20x20_v_slot(pt, vl);

    // center left
    T(long, bed_yo, -vl - pt)
    extrusion_profile_20x20_v_slot(pt, vl);

    // front right
    T(-long, short, -vl - pt)
    extrusion_profile_20x20_v_slot(pt, vl);

    // front left
    T(long, short, -vl - pt)
    extrusion_profile_20x20_v_slot(pt, vl);

    //// bottom

    // left
    Rx(90) T(long, bz, -hpl) extrusion_profile_20x20_v_slot(pt, pl);

    // right
    Rx(90) T(-long, bz, -hpl) extrusion_profile_20x20_v_slot(pt, pl);

    // front
    R(90, 0, 90)
    T(short, bz, -hpl) extrusion_profile_20x20_v_slot(pt, pl);

    // back
    R(90, 0, 90)
    T(-short, bz, -hpl) extrusion_profile_20x20_v_slot(pt, pl);

    // center
    R(90, 0, 90)
    T(bed_yo + 20, bz, -hpl) extrusion_profile_20x20_v_slot(pt, pl);
    R(90, 0, 90)
    T(bed_yo - 20, bz, -hpl) extrusion_profile_20x20_v_slot(pt, pl);
}

rim_asm();






