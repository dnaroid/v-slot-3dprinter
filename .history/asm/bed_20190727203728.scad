module bed_asm() {

  // glass
  %
  T(0, bed_yo, bed_z + bed_zo)
  cube([bed_s, bed_s, 3], true);

  // bed
  T(0, bed_yo, bed_z + bed_zo - 3) color([0.7, 0.7, 0.7])
  cube([bed_s, bed_s, 3], true);

  // R(90, 0, 0) T(bed_s / 2, bed_z + bed_zo - 15, -vl / 2 - bed_yo)
  // extrusion_profile_20x20_v_slot(pt, vl);

  // R(90, 0, 0) T(-bed_s / 2, bed_z + bed_zo - 15, -vl / 2 - bed_yo)
  // extrusion_profile_20x20_v_slot(pt, vl);
  T(screw_xo, bed_yo, profileV_l - screw_l / 2)
  t8(screw_l, bed_z);

}

if (!hide_bed) bed_asm();