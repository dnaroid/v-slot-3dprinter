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
