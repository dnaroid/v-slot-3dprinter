module corn(l = 10, t = 2, s1 = 20, s2)
{
    so = (s2 == undef) ? s1 : s2;
    echo("BOM: auluminum corn ", s1, "x", so, "length=", l);
    ALUMINUM()
    {
        translate([ -l / 2, 0, 0 ]) difference()
        {
            cube([ l, s1, so ]);
            translate([ -0.05, t, t ]) cube(l + 0.1, s1 + 0.1, so + 1);
        }
    }
}

module t8(l, pos, rot=0)
{
    echo("BOM: T8 screw", l);
    STEEL() Tz(-l / 2) Cy(4, l);

    Tz(pos) Rx(rot) t8_nut();
}

module draw_belt(from, to, a, pr = 6)
{
    echo("BOM: GT2 belt part",
         sqrt(pow(from[0] - to[0], 2) + pow(from[1] - to[1], 2)));
    color("black")
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







