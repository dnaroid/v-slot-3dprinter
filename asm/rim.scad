
module rim_asm() {
  pl = profileL;
  pt = profileT;
  hpt = pt / 2;
  hpl = pl / 2;

  //// top

  //left
  Rx(90) T(hpl - hpt, -hpt, -hpl)
    extrusion_profile_20x20_v_slot(pt, pl);

  //right
  Rx(90) T(-hpl + hpt, -hpt, -hpl)
    extrusion_profile_20x20_v_slot(pt, pl);

  // front
  R(90,0,90) T(hpl + hpt, -hpt, -hpl)
    extrusion_profile_20x20_v_slot(pt, pl);

  // back
  R(90,0,90) T(-hpl - hpt, -hpt, -hpl)
   extrusion_profile_20x20_v_slot(pt, pl);


  //// mid

  // back right
  T(-hpl + hpt, -hpl-hpt, -pl-pt)
    extrusion_profile_20x20_v_slot(pt, pl);

  // back left
  T(hpl - hpt, -hpl-hpt, -pl-pt)
    extrusion_profile_20x20_v_slot(pt, pl);

  // front right
  T(-hpl + hpt, hpl+hpt, -pl-pt)
    extrusion_profile_20x20_v_slot(pt, pl);

  // front left
  T(hpl - hpt, hpl+hpt, -pl-pt)
    extrusion_profile_20x20_v_slot(pt, pl);

  //// bottom

  //left
  Rx(90) T(hpl - hpt, -pl-pt-hpt, -hpl)
    extrusion_profile_20x20_v_slot(pt, pl);

  //right
  Rx(90) T(-hpl + hpt, -pl-pt-hpt, -hpl)
    extrusion_profile_20x20_v_slot(pt, pl);

  // front
  R(90,0,90) T(hpl + hpt, -pl-pt-hpt, -hpl)
    extrusion_profile_20x20_v_slot(pt, pl);

  // back
  R(90,0,90) T(-hpl - hpt, -pl-pt-hpt, -hpl)
   extrusion_profile_20x20_v_slot(pt, pl);

}

rim_asm();