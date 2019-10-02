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


    T(car_x - 18-6, car_y + railY_yo - 10, 35)  R(90, 0, -90) optical_endstop();

    if (!hide_hotend) {
        ax=18;
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) hotend_cr10();
            T(0, -24 - 10, -14) Rx(-90+ax) fan_3010();
            T(-10, -22, 5+10) R(90,0,0) blower_5015();

            !T()
            // cutXZ(rx=18, y=-20)
            // cutYZ(x=20)
            D() {
                U() {
                    T(0,-2,-12-6.5) CuR(30+8+8,44,52,r=3);
                    T(0,-16,3) CuR(20-3,15-3,20,r=1);  // blower insert
                }
                T(0, -24, -14) Rx(-90+ax) forX(24,2)forY(24,2) Cy(1,20);
                for(x=[-12,12]) { T(x,2,2) Rx(90) Cy(1.3,10); }
                T(0,-39,-32) Rx(ax) Cu(50,50,90);
                T(0,0,-42) Cu(28,50,30);
                T(8,31,-10) Cu(50,50,90);
                T(0,31,-30) Cu(50,50,40);
                T(0,0,15) hull() {Cy(6,30); Ty(10)Cy(6,30); }

                T(0,-10,-13) Rx(90) Cy(11,40); // heatsink hole
                T(0,-25,-15) Rx(90) Sp(15,40); 
                T(0,0,-12) hull(){D(){Cy(10,30.01);Ty(-26.5)Cu(40);};Ty(20)Cy(10,30.01);} // heatsink 
                T(0,31.01,-12) D(){Cy(30,23); Cu(100,50,30);}// exit

                T(car_x - 18-4, car_y + railY_yo - 12, 0) Ry(90) Cy(1,10); //optical_endstop();
                T(car_x - 18-4, car_y + railY_yo - 30.5, 0) Ry(90) Cy(1,10); //optical_endstop();

                // blower hiles
                T(0,-16,10) CuR(20-3-4,9,20,r=1);  
                T(0,-16,3) CuR(44,9,6,r=2); 
                forX(37,2) hull(){
                    T(0,-16,3)CuR(7,9,6,r=2); 
                    T(0,0,-40)CuR(7,9,6,r=2); 
                }
                T(0,0,-44) Cu(33,8,6); 
            }
        }
    }
}

caret_asm();















