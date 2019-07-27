module motors_asm() {
  // XY left
  T(motorXY_x, motorXY_y, motorXY_z)
  NEMA(motorXY_type);

  // XY right
  T(-motorXY_x, motorXY_y, motorXY_z)
  NEMA(motorXY_type);

  // Z
  T(motorZ_x, motorZ_y, motorZ_z) R(-90, 0, -90)
  NEMA(motorZ_type);

}
if (!hide_motors) motors_asm();