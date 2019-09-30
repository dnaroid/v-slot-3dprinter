module
caret_asm()
{
    dx = 0;
    dy = -18;
    dz = 35;
    rz = 180;

        railY_xo = long;
        railY_z = 0;
        railY_placement_yo = 0;

        railX_z = railY_z + railY_car_h;

    T(car_x, car_y + railY_yo + railX_yo + 3, railX_z + railX_car_h + 1+10)
    corn(30, 2, 30, 45);


    T(car_x - 18-6, car_y + railY_yo - 10, 35)
    R(90, 0, -90) optical_endstop();

    if (!hide_hotend) {
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) hotend_cr10();
            T(0, -20, -10) Rx(-90) fan_3010();
            for(x=[-12,12]) {
                T(x,-10,2) Rx(90)#Cy(1.5,40);
            }

            // cutZ(s=200,rz=90)
            D() {
                T(0,2,-12-8) CuR(30+8+8,34,50,r=1);

                T(0,-39,-32) Rx(18) Cu(50,50,50);
                T(0,0,-42) Cu(28,50,30);
                T(8,31,-10) Cu(50,50,90);
                T(0,31,-30) Cu(50,50,40);
                T(0,0,15) hull() {Cy(6,30); Ty(10)Cy(6,30); }
            }
        }
    }
}

!caret_asm();















