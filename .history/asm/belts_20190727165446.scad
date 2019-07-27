pr = GT2x20_toothed_idler[3] / 2;

function angle(a, b) = atan2(norm(cross(a, b)), a * b);

module draw_belt(from, to, a) {
  // a = angle(from, to) - 90;
  // echo("-----angle");
  // echo(a);
  color("black")
  hull() {
    T(from)
    T(pr * cos(a[0]), pr * sin(a[0]), -3)
    cube([2, 2, 6]);
    T(to)
    T(pr * cos(a[1]), pr * sin(a[1]), -3)
    cube([2, 2, 6]);
  }
}

module belts_asm() {
  pz = 6;
  pzu = pz + 10;
  screwR = 1.5;

  Ti = GT2x20_toothed_idler;
  Pi = GT2x20_plain_idler;

  pd = Ti[3];

  px = hpl - hpt;
  pxo = px + 6;
  pxi = px - 16;

  py = hpl + hpt;
  pyi = hpl - hpt / 2;

  pulleys = [
    [motorXY_x, motorXY_y, pz, GT2x20um_pulley, [0, 0], true], // motor L

    // [pxo, py, pz, Ti], // corn FL
    [long, -short, pz, Ti, [0, 90]], // corn BL


    [-pxi, -py, pz, Ti, [0, 180]], // corn BR inner
    // [-pxi, car_y - railY_car_l + railY_yo, pz, Ti], // car
    // [pxi, car_y - railY_car_l + railY_yo, pz, Ti], // car
    // [pxi, -py, pz, Ti], // corn BL inner
    // [-pxo, -py, pz, Ti], // corn BR
    // [-pxo, py, pz, Ti], // corn FR

    // // [-motorXY_x, motorXY_y, pz, Ti], // motor R
    // [-pxi, py - 30, pz, Ti], // corn BL inner

    // [-pxi, car_y + railY_car_l + railY_yo, pz, Ti], // car
    // [pxi, car_y + railY_car_l + railY_yo, pz, Ti], // car
  ];

  for (i = [0: len(pulleys) - 1]) {
    p = pulleys[i];
    prev = i > 0 ? pulleys[i - 1] : undef;
    T(p[0], p[1], p[2]) Ry(p[5] ? 180 : 0)
    pulley_assembly(p[3]);
    if (prev != undef)
      draw_belt(
        [p[0], p[1], p[2]],
        [prev[0], prev[1], prev[2]],
        [p[4][0], prev[4][1]]
      );
  }

  // path = [
  //   for (p = pulleys)[
  //     p[0],
  //     p[1],
  //     pulley_pr(p[3])
  //   ]
  // ];

  // belt = GT2x6;

  // Tz(pz)
  // draw_belt(belt, path, 0, [0, belt_pitch_height(belt) - belt_thickness(belt) / 2]);

}

if (!hide_belts) belts_asm();