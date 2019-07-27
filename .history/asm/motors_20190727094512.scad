
module motors_asm() {
  pl = profile_l;
  vl = profileV_l;
  pt = profile_t;
  hpt = pt / 2;
  hpl = pl / 2;

  top_z = 0;

  // XY left
  T(hpl-pt*2, hpl-pt, top_z)
    NEMA(motorXY_type);

  // XY right
  T(-(hpl-pt*2), hpl-pt, top_z)
    NEMA(motorXY_type);

  // Z
  T(-(hpl-pt), hpl-pt, -profileV_l) R(-90,0,90)
    NEMA(motorXY_type);

}

motors_asm();