
module belts_asm() {
  pl = profile_l;
  vl = profileV_l;
  pt = profile_t;
  hpt = pt / 2;
  hpl = pl / 2;

  topPulleys_z = 20;


  //// top

  T(hpl-hpt, hpl-10, topPulleys_z) {
    pulley_assembly(GT2x20_toothed_idler);
    screw(M5_cap_screw,50);
  }

  // pulley_assembly(GT2x16_plain_idler);

}

belts_asm();