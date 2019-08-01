module belts_asm() {
  pl = profile_l;
  vl = profileV_l;
  pt = profile_t;
  hpt = pt / 2;
  hpl = pl / 2;

  topPulleys_z = 18;
  screwR = 1.5;

  Ti = GT2x20_toothed_idler;
  Pi = GT2x20_plain_idler;
  px = hpl - hpt;

  pulleys = [
    [motorXY_x, motorXY_y, topPulleys_z, Ti], // motor L
    [px, hpl + hpt, topPulleys_z, Ti], //
    [px, car_y + 5, topPulleys_z, Ti], // car
    [-px, car_y + 5, topPulleys_z, Ti], // car
    [-px, hpl + hpt, topPulleys_z, Ti], //
    [-motorXY_x, motorXY_y, topPulleys_z, Ti], // motor r
  ];

  //// top

  for (p = pulleys) {
    T(p[0], p[1], p[2])
    pulley_assembly(p[3]);
  }

  // pulley_assembly(GT2x16_plain_idler);

  // path = [
  //   [p1.x, p1.y, pulley_pr(GT2x20ob_pulley)],
  //   [p5.x, p5.y, -pulley_pr(GT2x16_plain_idler)],
  //   [p6.x, p6.y, -pulley_pr(GT2x16_plain_idler)],
  //   [p2.x, p2.y, pulley_pr(GT2x20ob_pulley)],
  //   [p3.x, p3.y, pulley_pr(GT2x20ob_pulley)],
  //   [p4.x, p4.y, pulley_pr(GT2x20ob_pulley)]
  // ];
  belt = GT2x6;
  // belt(belt, path, 80, [0, belt_pitch_height(belt) - belt_thickness(belt) / 2]);


}

belts_asm();