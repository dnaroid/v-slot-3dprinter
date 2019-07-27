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

  pxo = railY_car_w / 2;

  px = hpl - hpt;

  py = hpl + hpt;
  pyi = hpl - hpt / 2;

  pulleys = [
    [motorXY_x, motorXY_y, pz, Ti], // motor L
    [px + pxo, py, pz, Ti], // corn FL
    [px + pxo, -py, pz, Ti], // corn BL
    [-(px - pxo), -py, pz, Ti], // corn BR inner
    [-(px - pxo), car_y - railY_car_l - pd, pz, Ti], // car
    [(px - pxo), car_y - railY_car_l - pd, pz, Ti], // car
    [(px - pxo), -py, pz, Ti], // corn BL inner
    // [(px), -py, pz, Ti], // corn BR
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