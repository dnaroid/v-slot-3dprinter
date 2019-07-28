// hide_motors = 1;
// hide_belts = 1;
// hide_hotend = 1;
// hide_bed = 1;

car_y = -00;
car_x = -00;
bed_z = -00; // 0..-200

profile_l = 300; // x9
profileV_l = 300; // x6  = x15
profile_t = 20;

railX_type = MGN9; // x5
railX_l = 250;
railX_support_t = 3;
railY_type = MGN9;
railY_l = 250;
railY_yo = 5;
railY_car_h = railY_type[9][3];
railY_car_l = railY_type[9][0];
railY_car_w = railY_type[9][2];
railY_w = railY_type[1];
railZ_type = MGN9;
railZ_l = 250;
railZ_zo = 35;

hotEnd_type = E3D_clone; // JHeadMk5, JHeadMk4, E3Dv5, E3Dv6, E3D_clone

bed_s = 214;
bed_yo = -10;
bed_zo = -60;

motorXY_type = NEMA17;
motorXY_x = (profile_l / 2);
motorXY_y = (profile_l / 2) + profile_t;
motorXY_z = -10;
motorZ_type = NEMA17;
motorZ_x = 0;
motorZ_y = (profile_l / 2) + profile_t;
motorZ_z = -profileV_l + 10;

screw_l = 250;
screw_xo = profile_l / 2 - 30;
screw_z = -(profileV_l - screw_l) - 25;

///////////// profile const

pl = profile_l;
vl = profileV_l;
pt = profile_t;
hpt = pt / 2;
hpl = pl / 2;
long = hpl + hpt;
short = hpl - hpt;

////////// BOM /////////////

// closed belt GT2 800mm (900mm)

// MGN9 250mm x5

// T8 screw & nut 250mm x2
// https://www.aliexpress.com/item/32817328238.html?spm=a2g0o.productlist.0.0.c8cc1d7b4bBISq&algo_pvid=3699666b-a52b-4a7b-8625-62410e9db073&algo_expid=3699666b-a52b-4a7b-8625-62410e9db073-3&btsid=1a9867b4-cc5b-4214-97be-22fd9e8d797a&ws_ab_test=searchweb0_0%2Csearchweb201602_4%2Csearchweb201603_52


// 20 tooth pulley GT2 bore 5mm (motor) x3
// https://www.aliexpress.com/item/32817328238.html?spm=a2g0o.productlist.0.0.c8cc1d7b4bBISq&algo_pvid=3699666b-a52b-4a7b-8625-62410e9db073&algo_expid=3699666b-a52b-4a7b-8625-62410e9db073-3&btsid=1a9867b4-cc5b-4214-97be-22fd9e8d797a&ws_ab_test=searchweb0_0%2Csearchweb201602_4%2Csearchweb201603_52


// 20/80 tooth pulley GT2 bore 8mm (lift) x2
// https://www.aliexpress.com/item/32817328238.html?spm=a2g0o.productlist.0.0.c8cc1d7b4bBISq&algo_pvid=3699666b-a52b-4a7b-8625-62410e9db073&algo_expid=3699666b-a52b-4a7b-8625-62410e9db073-3&btsid=1a9867b4-cc5b-4214-97be-22fd9e8d797a&ws_ab_test=searchweb0_0%2Csearchweb201602_4%2Csearchweb201603_52


// 20 tooth bearing pulley GT2 bore 5mm x6
// https://www.aliexpress.com/item/32817328238.html?spm=a2g0o.productlist.0.0.c8cc1d7b4bBISq&algo_pvid=3699666b-a52b-4a7b-8625-62410e9db073&algo_expid=3699666b-a52b-4a7b-8625-62410e9db073-3&btsid=1a9867b4-cc5b-4214-97be-22fd9e8d797a&ws_ab_test=searchweb0_0%2Csearchweb201602_4%2Csearchweb201603_52


// plain bearing pulley GT2 bore 5mm x4
// https://www.aliexpress.com/item/32817328238.html?spm=a2g0o.productlist.0.0.c8cc1d7b4bBISq&algo_pvid=3699666b-a52b-4a7b-8625-62410e9db073&algo_expid=3699666b-a52b-4a7b-8625-62410e9db073-3&btsid=1a9867b4-cc5b-4214-97be-22fd9e8d797a&ws_ab_test=searchweb0_0%2Csearchweb201602_4%2Csearchweb201603_52


// KFL08 x2
// https://www.aliexpress.com/item/32817328238.html?spm=a2g0o.productlist.0.0.c8cc1d7b4bBISq&algo_pvid=3699666b-a52b-4a7b-8625-62410e9db073&algo_expid=3699666b-a52b-4a7b-8625-62410e9db073-3&btsid=1a9867b4-cc5b-4214-97be-22fd9e8d797a&ws_ab_test=searchweb0_0%2Csearchweb201602_4%2Csearchweb201603_52


// 2020 nuts M3 (for MGN9)x
// 2020 nuts M5 x
// 2020 L connector x

// 2020 300mm x15