module
belts_asm()
{
    pz = 6;
    pzu = pz; // pz + 11;

    screwR = 1.5;

    Ti = GT2x20_toothed_idler;
    Pi = GT2x20_plain_idler;
    Tm = GT2x20um_pulley;

    pd = Tm[3];

    px = hpl - hpt;
    pxo = px + 6;
    pxi = px - 16;

    py = hpl + hpt;
    pyi = hpl - hpt / 2;

    car_yo = car_y + railY_yo;

    ix = motorXY_x - pd + 1;
    ox = motorXY_x;

    iy = short - 15;
    oy = short;

    front_car_p_y = car_yo + railX_car_w / 2 + 7;
    back_car_p_y = car_yo - railX_car_w / 2 - 7;

    T(ix, -iy, pzu - 16) Rx(-90) Rz(0) corn(20, 2, 20);
    T(-ix, -iy, pzu - 16) Rx(-90) Rz(0) corn(20, 2, 20);

    pulleys = [[motorXY_x, motorXY_y, pzu, Tm, [180, 0]],  // motor L
               [ox, -oy, pzu, Ti, [0, -90]],               // corn BL
               [-ix, -iy, pz, Ti, [-90, 180]],             // corn BR inner
               [-ix, back_car_p_y, pz, Ti, [180, 90]],     // car
               [ix, back_car_p_y, pz, Ti, [90, 0]],        // car
               [ix, -iy, pz, Ti, [0, -90]],                // corn BL inner
               [-ox, -oy, pzu, Ti, [-90, 180]],            // corn BR
               [-motorXY_x, motorXY_y, pzu, Ti, [180, 0]], // motor R
               [-ix, front_car_p_y, pzu, Pi, [180, -90]],  // car
               [ix, front_car_p_y, pzu, Pi, [-90, 0]],     // car
               [motorXY_x, motorXY_y, pzu, undef, [180, 0]],
    ];

    draw_belts(pulleys);
}
if (!hide_belts)
    belts_asm();