module belts_asm() {
  pl = profile_l;
  vl = profileV_l;
  pt = profile_t;
  hpt = pt / 2;
  hpl = pl / 2;

  pz = 5;
  pzu = pz + 10;
  screwR = 1.5;

  Ti = GT2x20_toothed_idler;
  Pi = GT2x20_plain_idler;
  pd = Ti[3];


  px = hpl - hpt;
  pxo = px + 6;
  pxi = px - 8;

  py = hpl + hpt;
  pyi = hpl - hpt / 2;

  pulleys = [
    // [motorXY_x, motorXY_y, pz, Ti], // motor L

    [pxo, py, pz, Ti], // corn FL
    [pxo, -py, pz, Ti], // corn BL
    [-pxi, -py, pz, Ti], // corn BR inner
    [-pxi, car_y - railY_car_l + railY_yo, pz, Ti], // car
    [pxi, car_y - railY_car_l + railY_yo, pz, Ti], // car
    // [px, -py, pz, Ti], // corn BL inner
    // [-px, -py, pz, Ti], // corn BR
    // [-px, py, pz, Ti], // corn FR

    // [-motorXY_x, motorXY_y, pz, Ti], // motor R

    // [-px, car_y + railY_car_l + railY_yo, pz, Ti], // car
    // [px, car_y + railY_car_l + railY_yo, pz, Ti], // car
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