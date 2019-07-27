module caret_asm() {
  dx = 0;
  dy = -16;
  dz = 16;

  T(car_x + dx, car_y + dy + railY_yo, 0 + dz) Rz(-0)
  e3d_hot_end_assembly(hotEnd_type, 1.75, false);

}

caret_asm();