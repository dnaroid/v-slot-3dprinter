module rails_asm() {

  rzo = -30;

  // left Y
  Rz(90) T(railY_yo, profile_l / 2 - profile_t / 2)
  rail_assembly(railY_type, railY_l, car_y);

  // right Y
  Rz(90) T(railY_yo, -profile_l / 2 + profile_t / 2)
  rail_assembly(railY_type, railY_l, car_y);

  // X
  T(0, car_y + 2 + railY_yo, railY_type[9][0]) //Rx(90)
  rail_assembly(railX_type, railX_l, car_x);
  T(-profile_l / 2, car_y - 6 + railY_yo, 10)
  cube([profile_l, 30, 3]);

  // left Z
  T(-profile_l / 2 + profile_t, bed_yo, -railZ_l / 2 - railZ_zo) Ry(90)
  rail_assembly(railZ_type, railZ_l, -railZ_l / 2 - rzo - bed_z);

  // right Z
  T(profile_l / 2 - profile_t, bed_yo, -railZ_l / 2 - railZ_zo) R(0, 90, 180)
  rail_assembly(railZ_type, railZ_l, -railZ_l / 2 - rzo - bed_z);

}

rails_asm();