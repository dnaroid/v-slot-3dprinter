module motors_asm() {
  // XY left
  T(motorXY_x, motorXY_y, motorXY_z)
  NEMA(motorXY_type);

  // XY right
  T(-(motorXY_x), motorXY_y, motorXY_z)
  NEMA(motorXY_type);

  // Z
  T(motorXY_x, motorXY_y, motorXY_z) R(-90, 0, 90)
  NEMA(motorXY_type);

}

motors_asm();