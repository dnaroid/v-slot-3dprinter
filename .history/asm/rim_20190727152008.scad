module rim_asm() {
  pl = profile_l;
  vl = profileV_l;
  pt = profile_t;
  hpt = pt / 2;
  hpl = pl / 2;

  long = hpl - hpt;
  short = hpl - hpt;

  //// top

  //left
  Rx(90) T(long, -hpt, long)
  extrusion_profile_20x20_v_slot(pt, pl);

  //right
  Rx(90) T(-hpl + hpt, -hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // front
  R(90, 0, 90) T(hpl + hpt, -hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // back
  R(90, 0, 90) T(-hpl - hpt, -hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);


  //// mid

  // back right
  T(-hpl + hpt, -hpl - hpt, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // back left
  T(hpl - hpt, -hpl - hpt, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // center right
  T(-hpl + hpt, bed_yo, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // center left
  T(hpl - hpt, bed_yo, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // front right
  T(-hpl + hpt, hpl + hpt, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // front left
  T(hpl - hpt, hpl + hpt, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  //// bottom

  //left
  Rx(90) T(hpl - hpt, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  //right
  Rx(90) T(-hpl + hpt, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // front
  R(90, 0, 90) T(hpl + hpt, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // back
  R(90, 0, 90) T(-hpl - hpt, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

}

rim_asm();