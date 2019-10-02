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
titan_extruder()
{
    echo("BOM: titan extruder");
    C(0.3, 0.3, 0.3)
    import_stl("models/titan.stl", convexity = 5);
}

module
blower_5015()
{
    echo("BOM: blower 4010");
    C(0.3, 0.3, 0.3)
    import_stl("models/5015_blower_fan.stl", convexity = 5);
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

module cutXZ(s = 200, y=0, rz=0, rx=0, ry=0) {
    D() {
        children();
        Ty(sign(y+.001)*s/2+y) Rx(rx)Ry(ry)Rz(rz) Cu(s);
    }
}

module cutYZ(s = 200, x=0, rz=0, rx=0, ry=0) {
    D() {
        children();
        Tx(sign(x+.001)*s/2+x) Rx(rx)Ry(ry)Rz(rz) Cu(s);
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

module
hotend_cr10()
{
    echo("BOM: cr10 hotend");
    C(0.5, 0.5, 0.5) R(-90) import_stl("models/cr10hotend.stl", convexity = 5);
}





