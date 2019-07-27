// hide_motors = 1;
// hide_belts = 1;
// hide_hotend = 1;
hide_bed = 1;

car_y = 100;
car_x = -100;
bed_z = -0; // 0..-150

profile_l = 300; // x8
profileV_l = 200; // x6
profile_t = 20;

railX_type = MGN9; // x1
railX_l = 250;
railX_support_t = 3;
railY_type = MGN9; // x2
railY_l = 250;
railY_yo = 5;
railY_car_h = railY_type[9][3];
railY_car_l = railY_type[9][0];
railY_car_w = railY_type[9][2];
railY_w = railY_type[1];
railZ_type = MGN9; // x2
railZ_l = 200;
railZ_zo = 35;

hotEnd_type = E3D_clone; // JHeadMk5, JHeadMk4, E3Dv5, E3Dv6, E3D_clone

bed_s = 214;
bed_yo = 5;

motorXY_type = NEMA17;
motorXY_x = (profile_l / 2);
motorXY_y = (profile_l / 2) + profile_t;
motorXY_z = -10;
motorZ_type = NEMA17;
motorZ_x = (profile_l / 2) - profile_t;
motorZ_y = (profile_l / 2) - profile_t;
motorZ_z = -profileV_l;

///////////// profile const

pl = profile_l;
vl = profileV_l;
pt = profile_t;
hpt = pt / 2;
hpl = pl / 2;
long = hpl + hpt;
short = hpl - hpt;
///////////////////////