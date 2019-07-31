module caret_asm() {
  dx = 0;
  dy = -20;
  dz = 22;
  rz = -90;

  if (!hide_hotend) {
    T(car_x + dx, car_y + dy + railY_yo, 0 + dz) R(0, 0, rz)
    e3d_hot_end_assembly(hotEnd_type, 1.75, false);
  }

}

caret_asm();