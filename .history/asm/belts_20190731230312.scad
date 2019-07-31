module belts_asm() {
  pz = 17;
  pzu = pz + 10;
  screwR = 1.5;

  Ti = GT2x20_toothed_idler;
  Pi = GT2x20_plain_idler;
  Tm = GT2x20um_pulley;

  pd = Tm[3];

  px = hpl - hpt;
  pxo = px + 6;
  pxi = px - 16;

  py = hpl + hpt;
  pyi = hpl - hpt / 2;

  car_yo = 12;
  ix = motorXY_x - pd + 1;

  pulleys = [
    [motorXY_x, motorXY_y, pz, Tm, [180, 0]], // motor L
    [long, -short, pzu, Ti, [0, -90]], // corn BL
    [-ix, -short, pz, Ti, [-90, 180]], // corn BR inner
    [-ix, car_y - car_yo + railY_yo, pz, Ti, [180, 90]], // car
    [ix, car_y - car_yo + railY_yo, pz, Ti, [90, 0]], // car
    [ix, -short, pz, Ti, [0, -90]], // corn BL inner
    [-long, -short, pzu, Ti, [-90, 180]], // corn BR
    [-motorXY_x, motorXY_y, pz, Ti, [180, 0]], // motor R
    [-ix, car_y + car_yo + railY_yo, pz, Pi, [180, -90]], // car
    [ix, car_y + car_yo + railY_yo, pz, Pi, [-90, 0]], // car
    [motorXY_x, motorXY_y, pz, undef, [180, 0]],
  ];

  draw_belts(pulleys);

}

if (!hide_belts) belts_asm();