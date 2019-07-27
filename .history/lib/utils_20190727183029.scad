module corn(l, s1 = 20, s2) {
	if (s2 = undef) s2 = s1;
	translate([])
	D() {
		cube(l, s1, s2)
	}
}