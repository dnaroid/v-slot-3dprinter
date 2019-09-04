module
bed_asm()
{
    z = bed_z + bed_zo;

    glass_s = 220;
    plate_xs = 220;
    plate_ys = 220;

    bolt_o = 105;

    glass_t = 3;
    heater_t = 1.2;
    plate_t = 2;
    iso_t = 10;
    t8_pos = bed_z - 17;

    glass_z = z;
    plate_z = glass_z - glass_t / 2 - plate_t / 2;
    heater_z = plate_z - glass_t / 2 - heater_t / 2;
    iso_z = heater_z - heater_t / 2 - iso_t / 2;

    // glass
    // % T(0, bed_yo, glass_z) #Cu(glass_s, glass_s, glass_t);

    // plate
    T(0, bed_yo, plate_z)
    {
        ALUMINUM() Cu(plate_xs, plate_ys, plate_t);
        for (x = [ bolt_o, -bolt_o ])
            for (y = [ bolt_o, -bolt_o ])
                T(x, y, 1.1) bolt(M3_cs_cap_screw, 30);
    }

    // heater
    T(0, bed_yo, heater_z) C("red") Cu(200, 200, heater_t);

    // isolator
    T(0, bed_yo, iso_z) C("white") Cu(210, 210, iso_t);

    T(0, motorZ_y, screw_z)
    t8(screw_l, t8_pos, 180);
 
    // pz = -profileV_l - 26;
    // idler_o = 10;
    // idler_y = bed_yo;

    // pulleys = [[screw_xo, bed_yo, pz, GT2x20_toothed_idler, [0, -90]],
    //            [-screw_xo, bed_yo, pz, GT2x20_toothed_idler, [-90, 90]],
    //            [-idler_o, idler_y, pz, GT2x20_plain_idler, [-90, -0]],
    //            [motorZ_x, motorZ_y, pz, GT2x20um_pulley, [180, 0]],
    //            [idler_o, idler_y, pz, GT2x20_plain_idler, [180, -90]],
    //            [screw_xo, bed_yo, pz, undef, [90, -90]]];

    // draw_belts(pulleys);
}

if (!hide_bed)
    bed_asm();

