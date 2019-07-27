module belts_asm() {
  pl = profile_l;
  vl = profileV_l;
  pt = profile_t;
  hpt = pt / 2;
  hpl = pl / 2;

  topPulleys_z = 20;


  //// top

  T(hpl - hpt, hpl - 10, topPulleys_z) {
    pulley_assembly(GT2x20_toothed_idler);
    screw(M5_cap_screw, 50);
  }

  pulley_assembly(GT2x16_plain_idler);

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