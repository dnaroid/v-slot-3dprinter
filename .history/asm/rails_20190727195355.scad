module rails_asm() {

  caretZ_o = -40;

  corn_x = long - hpt - railY_car_h;

  // left Y
  Rz(90) T(railY_yo, hpl, -hpt) Rx(90)
  rail_assembly(railY_type, railY_l, car_y);
  T(corn_x, car_y + railY_yo, 0) R(90, 180, -90)
  corn(45, 2, 20);

  // right Y
  Rz(90) T(railY_yo, -hpl, -hpt) Rx(-90)
  rail_assembly(railY_type, railY_l, car_y);
  T(-corn_x, car_y + railY_yo, 0) R(90, 180, 90)
  corn(45, 2, 20);

  // X
  T(0, car_y + railY_yo, 0)
  Rx(180)
  rail_assembly(railX_type, railX_l, car_x);
  T(0, car_y + railY_yo, 1) {
    D() {
      Cu(long * 2, 45, 2);
      Ty(-33) Cu(railX_l - 10, 48, 5);
    }
  }
  T(car_x, car_y + railY_yo - 12, -12)
  corn(30, 2, 25);

  // left Z
  T(-hpl, bed_yo, -railZ_l / 2 - railZ_zo) Ry(90)
  rail_assembly(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);
  T(-hpl + railY_car_h, bed_yo, bed_z + bed_zo - 25) Rz(-90)
  corn(bed_s + 10, 2, 20);

  // right Z
  T(hpl, bed_yo, -railZ_l / 2 - railZ_zo) R(0, 90, 180)
  rail_assembly(railZ_type, railZ_l, -railZ_l / 2 - caretZ_o - bed_z);
  T(hpl - railY_car_h, bed_yo, bed_z + bed_zo - 25) Rz(90)
  corn(bed_s + 10, 2, 20);

  T(0, bed_yo, bed_z + bed_zo - 25) Rz(90)
  Cu(hpl - railY_car_h, hpl - railY_car_h, 2);
}

rails_asm();