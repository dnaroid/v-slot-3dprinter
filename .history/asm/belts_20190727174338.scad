pr = GT2x20_toothed_idler[3] / 2;

module sector(h, d, a1, a2) {
  if (a2 - a1 > 180) {
    difference() {
      cylinder(h = h, d = d);
      translate([0, 0, -0.5]) sector(h + 1, d + 1, a2 - 360, a1);
    }
  } else {
    difference() {
      cylinder(h = h, d = d);
      rotate([0, 0, a1]) translate([-d / 2, -d / 2, -0.5])
      cube([d, d / 2, h + 1]);
      rotate([0, 0, a2]) translate([-d / 2, 0, -0.5])
      cube([d, d / 2, h + 1]);
    }
  }
}

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

  // color("red") T(from) T(pr * cos(a[0]), pr * sin(a[0]), -3) cube([4, 4, 8]);
  // color("blue") T(to) T(pr * cos(a[1]), pr * sin(a[1]), -3) cube([4, 4, 8]);
}

module belts_asm() {
  pz = 6;
  pzu = pz + 10;
  screwR = 1.5;

  Ti = GT2x20_toothed_idler;
  Pi = GT2x20_plain_idler;
  Tm = GT2x20um_pulley;

  pd = Ti[3];

  px = hpl - hpt;
  pxo = px + 6;
  pxi = px - 16;

  py = hpl + hpt;
  pyi = hpl - hpt / 2;

  pulleys = [
    [motorXY_x, motorXY_y, pz, Tm, [180, 0], true], // motor L
    [long, -short, pzu, Ti, [0, -90]], // corn BL
    [-short, -short, pz, Ti, [-90, 180]], // corn BR inner
    [-short, car_y - railY_car_l + railY_yo, pz, Ti, [180, 90]], // car
    [short, car_y - railY_car_l + railY_yo, pz, Ti, [90, 0]], // car
    [short, -short, pz, Ti, [0, -90]], // corn BL inner
    [-long, -short, pzu, Ti, [-90, 180]], // corn BR
    [-motorXY_x, motorXY_y, pz, Ti, [180, 0]], // motor R
    [-short, car_y + railY_car_l + railY_yo, pz, Ti, [180, -90]], // car
    [short, car_y + railY_car_l + railY_yo, pz, Ti, [-90, 0]], // car
    [motorXY_x, motorXY_y, pz, Tm, [180, 0], true],
  ];

  for (i = [0: len(pulleys) - 1]) {
    p = pulleys[i];
    prev = i > 0 ? pulleys[i - 1] : undef;
    T(p[0], p[1], p[2]) Ry(p[5] ? 180 : 0)
    pulley_assembly(p[3]);
    if (prev != undef) {
      draw_belt(
        [p[0], p[1], p[2]],
        [prev[0], prev[1], prev[2]],
        [p[4][0], prev[4][1]]
      );
      sector(6, pd, p[4][0], prev[4][1]);
    }
  }

}

if (!hide_belts) belts_asm();