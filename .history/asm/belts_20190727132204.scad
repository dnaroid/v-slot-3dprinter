module belts_asm() {
  pl = profile_l;
  vl = profileV_l;
  pt = profile_t;
  hpt = pt / 2;
  hpl = pl / 2;

  pz = 5;
  screwR = 1.5;

  Ti = GT2x20_toothed_idler;
  Pi = GT2x20_plain_idler;
  pd = Ti[3];

  px = hpl - hpt / 2;
  pxi = px - pd;

  py = hpl + hpt;

  pulleys = [
    [motorXY_x, motorXY_y, pz, Ti], // motor L
    [px, py, pz, Ti], // corn FL
    [px, -py, pz, Ti], // corn BL
    [pxi, py, pz, Ti], // corn BR inner
    // [px, car_y + 5, z, Ti], // car
    // [-px, car_y + 5, z, Ti], // car
    // [-px, hpl + hpt, z, Ti], //
    // [-motorXY_x, motorXY_y, z, Ti], // motor r
  ];

  for (p = pulleys) {
    T(p[0], p[1], p[2])
    pulley_assembly(p[3]);
  }

  path = [
    for (p = pulleys)[
      p[0],
      p[1],
      pulley_pr(p[3])
    ]
  ];

  belt = GT2x6;

  Tz(pz)
  belt(belt, path, 0, [0, belt_pitch_height(belt) - belt_thickness(belt) / 2]);


}

belts_asm();