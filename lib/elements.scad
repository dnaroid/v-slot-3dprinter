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
    // C(0.3, 0.3, 0.3)
    %import_stl("models/5015_blower_fan.stl", convexity = 5);
}

module
blower_4010()
{
    echo("BOM: blower 4010");
    C(0.3, 0.3, 0.3)
    import_stl("models/4010_blower_fan.stl", convexity = 5);
}

module
blower_4020()
{
    echo("BOM: blower 4010");
    // C(0.3, 0.3, 0.3)
    %import_stl("models/4020_blower_fan.stl", convexity = 5);
}

module
fan_3010()
{
    echo("BOM: fan 3010");
    fan(fan30x10);
}

module
fan_4010()
{
    echo("BOM: fan 4010");
    #fan(fan40x11);
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


module cutXY(s = 200, z=0, dir=1,rz=0, rx=0, ry=0) {
    D() {
        children();
        Tz(dir*s/2+z) Rx(rx)Ry(ry)Rz(rz) Cu(s);
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
        Cy(r, h);
    }
}

module
hotend_cr10()
{
    echo("BOM: cr10 hotend");
    C(0.5, 0.5, 0.5) R(-90) import_stl("models/cr10hotend.stl", convexity = 5);
}


module
bl_touch()
{
    echo("BOM: bl touch");
    C(0.7, 0.7, 0.7) Rx(180) import_stl("models/bl_touch.stl", convexity = 5);
}


module 
hulls()
{
    for(i=[0:$children-2])
        hull() {
        child(i);
        child(i+1);
    }
}

module snake_node(p, t){
  r=p[4]/2;
  T(p[0],p[1],p[2])
  Ry(90)
    hull() {
            Ty(p[3]/2-r/2)Sp(r+t/2);
            Ty(-p[3]/2+r/2)Sp(r+t/2);
        }
}

module 
snake(nodes,t=0,d=0)
{
    for(i=[0:len(nodes)-2])
        hull() {
            snake_node(nodes[i],t);
            snake_node(nodes[i+1],t);
    }
    if(d) C(0,0,0)
        for(i=[0:len(nodes)-1]) {
            p=nodes[i];
            T(p[0]-1,p[1]-p[3],p[2]-1)Rx(90)S(0.2)text(str(i));
            T(p[0],p[1]-p[3]/2,p[2])Rx(90)Cy(0.05,p[3]);
        }
}


module 
with_mirror(x=1,y=0,z=0)
{ 
    union() {
        children();
        mirror([x,y,z]){
            children();
        }
    }
}

module hullX(d,n=2) { 
    hull() forX(d,n) children(); 
}

module hullY(d,n=2) { 
    hull() forY(d,n) children();
}

module hullZ(d,n=2) { 
    hull() forZ(d,n) children();
}

/* v-slot cover

!D() {
    t=0.4;
    t2=t*2;
    t3=t*3;
    r=1;
    U(){
        CuR(10,t3,20,r=1);
        // #CuR(6,4,10);
        T(2+t,1,0)CuR(t3,3,20,r=1);
        T(-2-t,1,0)CuR(t3,3,20,r=1);
        T(2+t,2+t,0)Cy(r,20);
        T(-2-t,2+t,0)Cy(r,20);
    }
    Ty(3)CuR(4-t,4,30);
    // CuR(10-t2,t,20,r=1);
    // T(2+t,1,0)CuR(t,3-t2,20,r=1);
    // T(-2-t,1,0)CuR(t,3-t2,20,r=1);
    // T(2+t,2+t,0)Cy(r-t,20);
    // T(-2-t,2+t,0)Cy(r-t,20);

    Tz(10)Cu(10);
    Tz(-10)Cu(10);
}
*/


/*
// orange pi case
!T() 
{
    // C(.5,.5,.5)T(-25,-23.25,-59)import_stl("models/Orange Pi Zero.STL", convexity = 5);
    // C(.5,.5,.5)T(-19,-8,4)Cu(17.6,15.4,13.2); // 2x USB
    // cutXY(z=-0,rx=90)
    // cutYZ(x=-20) 
    D() {
        U(){    
            CuR(53,50,25,r=2);
        }
        D() {
            CuR(50,47,22,r=1);
            for(x=[-21,21])for(y=[-20,20]) T(x,y,-10) Cy(6/2,95);
        }
        for(x=[-21,21])for(y=[-20,20]) T(x,y,-8.5) Cy(3.4/2,95.01);

        T(25)CuR(10,17,17,r=1); // LAN
        T(25,13.5)CuR(10,6,17,r=1); // USB
        T(-25,-8,3.5)CuR(10,14.5,14.5,r=1); // 2x USB
        T(-25,-5,-8.5)CuR(10,13,4,r=1); // SD

        T(-25,13,-5)CuR(10,10,5,r=1); // micro USB

        T(-5,8)forX(4,6)T(0,0,12)CuR(2,20,10,r=1); // vent

        Tz(-3)Cu(100,100,0.1); // separator

        Tz(-5.5)CuR(50,47,5,r=1); // PCB
    }
}
*/


// camera case
/*
!T() {
    t=0.4*3;
    *Rz(90)C(.2,.2,.2) {
        Cu(30,25,1);
        Tz(20/2+.5)Cy(14/2,20);
    }
    // cutYZ()
    // cutXY(z=4,s=100)
    D() {
        U() {
            Rz(90)Tz(2)CuR(30+4,25+4,12,r=2);
            D() {
                hullX(6)T(16,0,4)Rx(90)Cy(8/2,20);
                Rx(90)Cy(30,10);
            }
            D(){ U(){
                hullX(6)T(16+6,0,4)Rx(90)Cy(8/2,10-.4);
                T(30-2,0,4)Ry(90)Cy(8,5);}
                T(30-2,0,4)Ry(90)Cy(3.8/2,10);
            }
        }
        D() { 
            Rz(90)Tz(2)CuR(30+4-t*2,25+4-t*2,12-t*2,r=2-t);
            Rz(90)for(x=[-12,12])for(y=[-12,12])T(x,y)Cy(5/2,50);
        }
        Rz(90)for(x=[-12,12])for(y=[-12,12])T(x,y,5+.5)Cy(3/2,10);
        Rz(90)for(x=[-12,12])for(y=[-12,12])T(x,y)Cy(2.4/2,50);

        Rz(90)Tz(10)Cy(15/2,20); // cam

        Rz(90)hull() { //pcb
            for(x=[-14,14])for(y=[-12.5,12.5])T(x,y)Cy(2.4/2,1.2);
        }

        Rz(90)Tz(-.5)Cu(40,40,.1); // cut

        T(12,0,-1)Ry(90)Cy(3.4/2,8); // cable

        T(19,0,4)Rx(90)Cy(3/2,30);
        T(19,8,4)Rx(90)Cy(3.8/2,6);
    }
}
*/
