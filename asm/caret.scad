module
caret_asm()
{
    dx = 0;
    dy = -18;
    dz = 35;
    rz = 180;

    railY_xo = long;
    railY_z = 0;
    railX_z = railY_z + railY_car_h;

    T(car_x, car_y + railY_yo + railX_yo + 3, railX_z + railX_car_h + 1+10) corn(30, 2, 30, 45);

    T(car_x - 18-6, car_y + railY_yo - 10, 35)  R(90, 0, -90) optical_endstop();

    if (!hide_hotend) {
        ax=20.5;
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) mirror([1, 0, 0]) hotend_cr10();
            T(0, -24, -14) Rx(-90+ax) fan_3010();
            T(-10, -24, 7) R(90,0,0) blower_5015();

            !T()Rx(90-ax)
            // cutXZ(rx=18, y=-20)
            // cutYZ(x=-20)
            D() {
                U(){ // blower walls
                    wt=1;
                    wo=15+wt*2;
                    wr=6;
                    T(0,-16,8) CuR(17,13,8,r=1);  
                    T(0,-16,3) CuR(44+wt,wo,6+wt,r=wr); 
                    forX(37,2) hull(){
                        T(0,-16,3)CuR(7+wt,wo,6+wt,r=wr); 
                        T(0,0,-40)CuR(7+wt,wo,6+wt,r=wr); 
                    }

                    // T(car_x - 19, car_y + railY_yo - 25, 0) CuR(4,28,8,r=2); //optical_endstop holder
                    // T(car_x - 19, car_y + railY_yo - 12, 0) Ry(90) Cy(4,6); //optical_endstop
                    T(car_x - 18, car_y + railY_yo - 30.5, 0) Ry(90) Cy(3.5,8.5); //optical_endstop

                    t=3;
                    D(){
                        hull(){ // heatsink walls
                            T(0,5,-6) CuR(26,2,20);
                            T(0,-18,-12) Rx(ax)CuR(34,2,31);
                        }
                        hull(){ // - heatsink walls
                            T(0,5+0.1,-2) CuR(22,2+0.1,30+1);
                            T(0,-18,-12) R(ax+90)Cy(12,2+0.1);
                        }
                        T(0,0,-10) hull(){ D(){ Cy(10,30.01);Ty(-26.5)Cu(40);};Ty(20)Cy(10,30.01); } // heatsink 
                        T(0,-25,-15) Rx(90) Sp(15,40); 
                        T(0, -24, -14) Rx(-90+ax) forXY(24,2,24,2) Cy(1,20);
                    }
                }

                T(car_x - 18-4, car_y + railY_yo - 12, 0) Ry(90) Cy(1.5,12.1); //optical_endstop
                T(car_x - 18-4, car_y + railY_yo - 30.5, 0) Ry(90) Cy(1.5,12.1); //optical_endstop
              
                w=15;
                ri=4;

                U(){  // - blower holes
                    T(0,-16,10) CuR(17-3,13-3,20,r=1);  
                    T(0,-16,3) CuR(44,w,6,r=ri); 
                    forX(37,2) hull(){
                        T(0,-16,3)CuR(7,w,6,r=ri); 
                        T(0,0,-40)CuR(7,w,6,r=ri); 
                    }
                    T(0,0,-42) CuR(36,w+2,4,r=2); 
                }

            }
        }
    }
}

caret_asm();















