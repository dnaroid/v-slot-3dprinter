pr = GT2x20_toothed_idler[3] / 2;

module draw_belt(from, to, a) {
  color("black") {
    hull() {
      T(from)
      T(pr * cos(a[0]), pr * sin(a[0]), -3)
      cube([2, 2, 6]);
      T(to)
      T(pr * cos(a[1]), pr * sin(a[1]), -3)
      cube([2, 2, 6]);
    }
  }
}

module belts_asm() {
  pz = 6;
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
    [-ix, car_y + car_yo + railY_yo, pz, Ti, [180, -90]], // car
    [ix, car_y + car_yo + railY_yo, pz, Ti, [-90, 0]], // car
    [motorXY_x, motorXY_y, pz, undef, [180, 0]],
  ];

  for (i = [0: len(pulleys) - 1]) {
    p = pulleys[i];
    prev = i > 0 ? pulleys[i - 1] : undef;
    if (p[3]) {
      T(p[0], p[1], p[2])
      pulley_assembly(p[3]);
    }
    if (prev != undef) {
      draw_belt(
        [p[0], p[1], p[2]],
        [prev[0], prev[1], prev[2]],
        [p[4][0], prev[4][1]]
      );
    }
  }

}

if (!hide_belts) belts_asm();