module rails_asm() {

  rzo = -30;

  // left Y
  Rz(90) T(railY_yo, profile_l / 2 - profile_t / 2)
  rail_assembly(railY_type, railY_l, car_y);

  // right Y
  Rz(90) T(railY_yo, -profile_l / 2 + profile_t / 2)
  rail_assembly(railY_type, railY_l, car_y);

  // X
  D() {
    T(-profile_l / 2, car_y - railY_car_l / 2 + railY_yo, railY_car_h) {
      cube([profile_l, railY_car_l, railX_support_t]);

      #
      T(0, 0, 0)
      cube([railX_l, railX_l, railX_support_t + 5]);
    }
  }
  T(0, car_y + 2 + railY_yo, railY_car_h)
  Rx(180)
  rail_assembly(railX_type, railX_l, car_x);

  // left Z
  T(-profile_l / 2 + profile_t, bed_yo, -railZ_l / 2 - railZ_zo) Ry(90)
  rail_assembly(railZ_type, railZ_l, -railZ_l / 2 - rzo - bed_z);

  // right Z
  T(profile_l / 2 - profile_t, bed_yo, -railZ_l / 2 - railZ_zo) R(0, 90, 180)
  rail_assembly(railZ_type, railZ_l, -railZ_l / 2 - rzo - bed_z);

}

rails_asm();