module corn(l, s1 = 20, s2) {
	so = (s2 == undef) ? s1 : s2;
	translate([]);
	D() {
		cube(l, s1, s2)
	}
}