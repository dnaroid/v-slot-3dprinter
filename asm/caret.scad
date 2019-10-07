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

    explode = 0*150;

    if (!hide_hotend) {
        ax=14.7;
        topZO=3;
        T(car_x + dx, car_y + dy + railY_yo, dz)
        {
            Rz(rz) mirror([1, 0, 0]) hotend_cr10();
            T(0, -24-explode, -14) Rx(-90+ax) fan_3010();
            T(-10, -24, 7+topZO+explode) R(90,0,0) blower_5015();

            !T()
            // Rx(90-ax) // for print
            // cutXZ(rx=ax, y=-20)
            // cutYZ(x=-20)
            D() {
                legs_o=5;
                U(){ // blower walls
                    wt=1.2;
                    wo=15+wt*2;
                    wr=6;

                    T(0,-16,8+topZO) CuR(18,14,8,r=1);  
                    T(0,-16,3+topZO) CuR(44+wt,wo,6+wt,r=wr); 
                     for(dx=[37/2,-37/2]) hull(){
                        T(dx,-16,3+topZO)CuR(7+wt,wo,6+wt,r=wr); 
                        T(dx,-sign(dx+0.01)*legs_o,-40)CuR(7+wt,wo,6+wt,r=wr); 
                    }

                    T(0,-8.5+-1,-2) CuR(35,7,14,r=2);// self holder
                    T(0,-10,-3) hull() { CuR(4,2,12,r=1); T(0,-11,6)CuR(4,2,2,r=1);}

                    T(car_x - 20, car_y + railY_yo - 28, 0) Ry(90) Cy(4,6); //optical_endstop

                     // fan holders
                    D() {
                        U(){
                            T(-12, -24, -14+12) Rx(90+ax) Tz(-3.5)Cy(4,6);
                            T(12, -24, -14+12) Rx(90+ax) Tz(-3.5)Cy(4,6);
                            T(12, -24, -14-12) Rx(90+ax) Tz(-10)Cy(4,6);
                        }
                        T(-12, -24, -14+12) Rx(90+ax) Tz(-4)Cy(3.2/2,20);
                        T(12, -24, -14+12) Rx(90+ax) Tz(-4)Cy(3.2/2,20);
                        T(12, -24, -14-12) Rx(90+ax) Tz(-10)Cy(3.2/2,20);
                    
                    }
 
                }

                T(car_x - 20, car_y + railY_yo - 28, 0) Ry(90) Cy(3.4/2,7); 
    
            
                w=15;
                ri=4;

                U(){  // - blower holes
                    T(0,-16,10+topZO) CuR(17-3,13-3,20,r=1);  
                    T(0,-16,3+topZO) CuR(44,w,6,r=ri); 
                    for(dx=[37/2,-37/2])hull(){
                        T(dx,-16,3+topZO)CuR(7,w,6,r=ri); 
                        T(dx,-sign(dx+0.01)*legs_o,-40)CuR(7,w,6,r=ri); 
                    }
                
                    for(dy=[legs_o,-legs_o]) T(-sign(dy)*10,dy*1,-40) CuR(15,w,4,r=2); 

                    T(0, -7.4, -3) Rx(90) forX(14,2) hull()forY(2,2) Cy(6.5/2,3); //holders
                    T(0, -10, -3) Rx(90) forX(14,2) hull()forY(2,2)Cy(3/2,10); //holders
                }

            }
        }
    }
}

caret_asm();















