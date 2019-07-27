module bed_asm() {
  dx = 0;
  dy = 0;
  dz = -60;

  // glass
  %
  T(0, bed_yo, bed_z + dz)
  cube([bed_s, bed_s, 3], true);

  // bed
  T(0, bed_yo, bed_z + dz - 3) color([0.7, 0.7, 0.7])
  cube([bed_s, bed_s, 3], true);

  R(90, 0, 0) T(bed_s / 2, bed_z + dz - 15, -vl / 2 - bed_yo)
  extrusion_profile_20x20_v_slot(pt, vl);

  R(90, 0, 0) T(-bed_s / 2, bed_z + dz - 15, -vl / 2 - bed_yo)
  extrusion_profile_20x20_v_slot(pt, vl);

}

if (!hide_bed) bed_asm();