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
  T(screw_xo, bed_yo, screw_z - screw_l + 8)
  kfl08();

  T(-screw_xo, bed_yo, screw_z)
  t8(screw_l, bed_z + 7);
  T(-screw_xo, bed_yo, screw_z - screw_l + 8)
  kfl08();

  pz = screw_z - screw_l + 24;
  idler_o = 10;
  idler_y = bed_yo + 18;

  pulleys = [
    [screw_xo, bed_yo, pz, GT2x20_toothed_idler, [0, -90]],
    [-screw_xo, bed_yo, pz, GT2x20_toothed_idler, [-90, 90]],
    [-idler_o, idler_y, pz, GT2x20_plain_idler, [-90, -0]],
    [motorZ_x, motorZ_y, pz, GT2x20um_pulley, [180, 0]],
    [idler_o, idler_y, pz, GT2x20_plain_idler, [180, -90]],
    [screw_xo, bed_yo, pz, undef, [90, -90]]
  ];

  draw_belts(pulleys);

  T(0, bed_yo + 10, pz - 5) Rx(-90)
  corn(idler_o * 2 + 20, 2, 30);

}

if (!hide_bed) bed_asm();