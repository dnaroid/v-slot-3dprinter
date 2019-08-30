module
caret_asm()
{
    dx = 0;
    dy = -18;
    dz = 22 - 22;
    rz = 180;

    T(car_x, car_y + railY_yo - 10, -2)
    ALUMINUM() D()
    {
        Cu(40, 40, 3);
        hull()
        {
            Ty(-8) Cy(6, 10);
            Ty(-20) Cy(6, 10);
        }
    }

    if (!hide_hotend) {
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) e3d_hot_end_assembly(hotEnd_type, 1.75, true);

            // T(-18, 0, -32) Rx(90) Ry(-90) blower_4010();
            // T(18, 0, -32) Rx(90) Ry(90) blower_4010();
            // T(0, 16, -26) Rx(90) fan_3010();

            for (x = [ -14, 14 ])
                T(x, 5, 10) bolt(M3_cap_screw, 20, nuts = [ 10, 19 ]);

            // duct
            cr = 5;
            // cutZ(dir = -1, rz = 0)
            *Tz(-31) D()
            {
                CuR(60, 48, 54, r = cr);
                T(0, 8, 26) hull()
                {
                    Ty(-8) Cy(6.1, 2.1);
                    Ty(-20) Cy(6.1, 2.1);
                }
                Tz(5) Cy(12, 28);
                T(0, 20, 5) Rx(90) Cy(14, 30);
                T(30, 5, -1) Rz(90) Rx(90) Cy(14, 10);
                T(-30, -5, -1) Rz(90) Rx(90) Cy(14, 10);
                T(0, 0, -18) Cy(22, 14);
                Sy(0.7) T(0, 0, -18) To(22, 7);
                T(0, 0, -25) Cy(10, 10);
            }
        }
    }
}

module
duct()
{
    D()
    {
        hull()
        {
            Cy(12, 40);
            Rx(15) Tz(16) Ty(-10) Sy(0.5) Cy(15, 50);
        }
        Cy(11, 100);
        Ty(25) Cu(40, 40, 100);
        T(0, 10, 20) Cu(40, 40, 40);
        T(0, 4, 25) Rx(15) Cu(40, 40, 40);
    }
}

*T()
{
    *Tz(20) D()
    {
        e3d_hot_end_assembly(hotEnd_type, 1.75, true);
        Cy(15, 40);
    }

    s = 0.9;

    // cutZ(s = 200, rz = -90) 
    D()
    {
        duct();
        T(0, -3.2, 2) S(0.95, 0.80, 0.92) Rx(2)duct();
    }

    *T(0, -11, 25) Rx(90 + 15) fan(fan30x10);
}
caret_asm();











