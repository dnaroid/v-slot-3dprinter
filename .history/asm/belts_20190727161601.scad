pr = GT2x20_toothed_idler[3] / 2;

function angle(a, b) = atan2(norm(cross(a, b)), a * b);

module belt(from, to) {
  a = angle(from, to) + 90;
  color("black")
  T(pr * cos(a), pr * sin(a), -3)
  hull() {
    T(from) cube(2, 2, 6);
    T(to) cube(2, 2, 6);
  }
}

module belts_asm() {
  pz = 6;
  pzu = pz + 10;
  screwR = 1.5;
  pd = Ti[3];

  Ti = GT2x20_toothed_idler;
  Pi = GT2x20_plain_idler;

  px = hpl - hpt;
  pxo = px + 6;
  pxi = px - 16;

  py = hpl + hpt;
  pyi = hpl - hpt / 2;

  pulleys = [
    [long, motorXY_y, pz, GT2x20um_pulley, true], // motor L

    // [pxo, py, pz, Ti], // corn FL
    [long, -short, pz, Ti], // corn BL
    [-pxi, -py, pz, Ti], // corn BR inner
    [-pxi, car_y - railY_car_l + railY_yo, pz, Ti], // car
    [pxi, car_y - railY_car_l + railY_yo, pz, Ti], // car
    [pxi, -py, pz, Ti], // corn BL inner
    [-pxo, -py, pz, Ti], // corn BR
    [-pxo, py, pz, Ti], // corn FR

    // [-motorXY_x, motorXY_y, pz, Ti], // motor R
    [-pxi, py - 30, pz, Ti], // corn BL inner

    [-pxi, car_y + railY_car_l + railY_yo, pz, Ti], // car
    [pxi, car_y + railY_car_l + railY_yo, pz, Ti], // car
  ];

  for (i = [0: len(pulleys) - 1]) {
    p = pulleys[i];
    n = i > 1 ? pulleys[i - 1] : p;
    T(p[0], p[1], p[2]) Ry(p[4] ? 180 : 0)
    pulley_assembly(p[3]);
    belt([p[0], p[1], p[2]], [n[0], n[1], n[2]]);
  }

  path = [
    for (p = pulleys)[
      p[0],
      p[1],
      pulley_pr(p[3])
    ]
  ];

  belt = GT2x6;

  Tz(pz)
  belt(belt, path, 0, [0, belt_pitch_height(belt) - belt_thickness(belt) / 2]);

}

if (!hide_belts) belts_asm();