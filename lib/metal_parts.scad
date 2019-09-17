module corn(l = 10, t = 2, s1 = 20, s2)
{
    so = (s2 == undef) ? s1 : s2;
    echo("BOM: auluminum corn ", s1, "x", so, "length=", l);
    ALUMINUM()
    {
        D()
        {
            Cu(l, s1, so);
            T(0, t, t) Cu(l + 1, s1 + 1, so + 1);
        }
    }
}

module t8(l, pos, rot = 0)
{
    echo("BOM: T8 screw", l);
    STEEL() Tz(-l / 2) Cy(4, l);

    Tz(pos) Rx(rot) t8_nut();
}

module draw_belt(from, to, a, pr = 7)
{
    echo("BOM: GT2 belt part",
         sqrt(pow(from[0] - to[0], 2) + pow(from[1] - to[1], 2)));
    C(0.3, 0.3, 0.3)
    {
        hull()
        {
            T(from)
            T(pr * cos(a[0]), pr * sin(a[0]), -3)
            cube([ 2, 2, 6 ]);
            T(to)
            T(pr * cos(a[1]), pr * sin(a[1]), -3)
            cube([ 2, 2, 6 ]);
        }
    }
}

module draw_belts(pulleys)
{
    echo("BOM: new belt");
    for (i = [0:len(pulleys) - 1]) {
        p = pulleys[i];
        prev = i > 0 ? pulleys[i - 1] : undef;
        if (p[3]) {
            T(p[0], p[1], p[2])
            pulley_assembly(p[3]);
        }
        if (prev != undef) {
            draw_belt([ p[0], p[1], p[2] ],
                      [ prev[0], prev[1], prev[2] ],
                      [ p[4][0], prev[4][1] ]);
        }
    }
}

module
kfl08()
{
    echo("BOM: KLF08");
    ALUMINUM() T(31, 63.5, 0) import_stl("models/KFL08.stl", convexity = 5);
}

module
t8_nut()
{
    echo("BOM: T8 nut");
    BRASS() import_stl("models/T8NUT.stl", convexity = 5);
}

module
nema17_damper()
{
    echo("BOM: nema17 damper");
    R(90, 0, 45)
    BRASS() import_stl("models/nema17_damper.stl", convexity = 5);
    R(90, 0, -45)
    Ty(-4) BRASS() import_stl("models/nema17_damper.stl", convexity = 5);
    color("black") Tz(3) Ri(12, 10, 6);
}

module
nema17_L_bracket()
{
    echo("BOM: nema17 damper");
    color("black") Ry(90) T(-2, -30, -25)
        import_stl("models/nema17_L_bracket.stl", convexity = 5);
}

module
titan_extruder()
{
    echo("BOM: titan extruder");
    C(0.3, 0.3, 0.3)
    import_stl("models/titan.stl", convexity = 5);
}

module
blower_4010()
{
    echo("BOM: blower 4010");
    C(0.3, 0.3, 0.3)
    import_stl("models/4010_blower_fan.stl", convexity = 5);
}

module
fan_3010()
{
    echo("BOM: fan 3010");
    fan(fan30x10);
}

module rail(type, l, pos)
{
    echo("BOM: rail", type[0], l, "mm");
    rail_assembly(type, l, pos);
}

module bolt(type, l = 10, nut, nuts)
{
    echo("BOM: screw", type[0], l, "mm");
    screw(type, l);
    if (nut != undef || nuts != undef) {
        d = type[3];
        head_h = type[5];
        D = d == 2.5 ? 1 : d;
        nutByD = [
            undef,
            M2p5_nut,
            M2_nut,
            M3_nut,
            M4_nut,
            M5_nut,
            M6_nut,
            undef,
            M8_nut
        ];
        nut_type = nutByD[D];
        nut_h = nut_type[3];
        nut_zero_z = head_h / 2 - nut_h / 2;
        if (nuts == undef) {
            nuts = [nut];
        }

        for (h = nuts) {
            echo("BOM: nut", nut_type[0]);
            Tz(nut_zero_z - h) nut(nut_type);
        }
    }
}

module cutZ(s = 500, dir = 1, rz = 0)
{
    D()
    {
        children();
        Rz(rz) Ty(dir * s / 2) Cu(s);
    }
}

module
optical_endstop()
{
    echo("BOM: optical endstop");
    C(0.2, 0.2, 0.2) import_stl("models/optical_endstop.stl", convexity = 5);
}

module plate(sx, sy, h, r = 1)
{
    minkowski()
    {
        Cu(sx - r * 2, sy - r * 2, h - r / 2);
        Cy(r);
    }
}
