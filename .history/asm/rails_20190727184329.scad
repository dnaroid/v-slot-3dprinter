module rails_asm() {

  caretZ_o = -20;

  // left Y
  Rz(90) T(railY_yo, hpl, -hpt) Rx(90)
  rail_assembly(railY_type, railY_l, car_y);
  T(long - railY_car_h, car_y + 2 + railY_yo, -hpt) R(90, 90, -90)
  corn(20);

  // right Y
  Rz(90) T(railY_yo, -hpl, -hpt) Rx(-90)
  rail_assembly(railY_type, railY_l, car_y);

  // X

  T(0, car_y + 2 + railY_yo, -hpt)
  Rx(180)
  rail_assembly(railX_type, railX_l, car_x);

  // left Z
  T(-hpl, bed_yo, -railZ_l / 2 - railZ_zo) Ry(90)
  rail_assembly(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);

  // right Z
  T(hpl, bed_yo, -railZ_l / 2 - railZ_zo) R(0, 90, 180)
  rail_assembly(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);

}

rails_asm();