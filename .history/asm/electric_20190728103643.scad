module rim_asm() {

  //// top

  //left
  Rx(90) T(long, -hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  //right
  Rx(90) T(-long, -hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // front
  R(90, 0, 90) T(short, -hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // back
  R(90, 0, 90) T(-short, -hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);


  //// mid

  // back right
  T(-long, -short, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // back left
  T(long, -short, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // center right
  T(-long, bed_yo, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // center left
  T(long, bed_yo, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // front right
  T(-long, short, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  // front left
  T(long, short, -vl - pt)
  extrusion_profile_20x20_v_slot(pt, vl);

  //// bottom

  //left
  Rx(90) T(long, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  //right
  Rx(90) T(-long, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // front
  R(90, 0, 90) T(short, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // back
  R(90, 0, 90) T(-short, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

  // center
  R(90, 0, 90) T(bed_yo, -vl - pt - hpt, -hpl)
  extrusion_profile_20x20_v_slot(pt, pl);

}

rim_asm();