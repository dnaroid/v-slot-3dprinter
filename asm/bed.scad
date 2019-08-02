module
bed_asm()
{
    z = bed_z + bed_zo;

    glass_t = 3;
    heater_t = 1.2;
    iso_t = 10;

    glass_z = z;
    heater_z = glass_z - glass_t / 2 - heater_t / 2;
    iso_z = heater_z - heater_t / 2-iso_t / 2;

    // glass
    % T(0, bed_yo, glass_z) % C(0.5, 0.5, 0.5) Cu(bed_s, bed_s, glass_t);

    // heater
    T(0, bed_yo, heater_z) C("red") Cu(200, 200, heater_t);

    // isolator
    T(0, bed_yo, iso_z) C("white") Cu(210, 210, iso_t);

    T(screw_xo, bed_yo, screw_z)
    t8(screw_l, bed_z + 7);
    T(screw_xo, bed_yo, screw_z - screw_l + 8)
    kfl08();

    T(-screw_xo, bed_yo, screw_z)
    t8(screw_l, bed_z + 7);
    T(-screw_xo, bed_yo, screw_z - screw_l + 8)
    kfl08();

    pz = -profileV_l - 26;
    idler_o = 10;
    idler_y = bed_yo;

    pulleys = [[screw_xo, bed_yo, pz, GT2x20_toothed_idler, [0, -90]],
               [-screw_xo, bed_yo, pz, GT2x20_toothed_idler, [-90, 90]],
               [-idler_o, idler_y, pz, GT2x20_plain_idler, [-90, -0]],
               [motorZ_x, motorZ_y, pz, GT2x20um_pulley, [180, 0]],
               [idler_o, idler_y, pz, GT2x20_plain_idler, [180, -90]],
               [screw_xo, bed_yo, pz, undef, [90, -90]]];

    draw_belts(pulleys);

    // T(0, bed_yo + 10, pz - 5) Rx(-90)
    // corn(idler_o * 2 + 20, 2, 30);
}

if (!hide_bed)
    bed_asm();



