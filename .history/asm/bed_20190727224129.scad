module bed_asm() {

  // glass
  %
  T(0, bed_yo, bed_z + bed_zo)
  cube([bed_s, bed_s, 3], true);

  // bed
  T(0, bed_yo, bed_z + bed_zo - 3) color([0.7, 0.7, 0.7])
  cube([bed_s, bed_s, 3], true);

  T(screw_xo, bed_yo, screw_z)
  t8(screw_l, bed_z + 7);
  T(screw_xo, bed_yo, screw_z - screw_l + 24)
  pulley_assembly(GT2x20_toothed_idler);
  T(screw_xo, bed_yo, screw_z - screw_l + 8)
  kfl08();

  T(-screw_xo, bed_yo, screw_z)
  t8(screw_l, bed_z + 7);
  T(-screw_xo, bed_yo, screw_z - screw_l + 24)
  pulley_assembly(GT2x20_toothed_idler);
  T(-screw_xo, bed_yo, screw_z - screw_l + 8)
  kfl08();

  pulleys = [
    [-screw_xo, bed_yo, screw_z - screw_l + 24, GT2x20_toothed_idler, [180, 0]], // motor L
    [screw_xo, bed_yo, screw_z - screw_l + 24, GT2x20_toothed_idler, [180, 0]], // motor L
  ];

  draw_belts(pulleys);

}

if (!hide_bed) bed_asm();