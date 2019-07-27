module corn(l, t = 2, s1 = 20, s2) {
	so = (s2 == undef) ? s1 : s2;
	translate([-l / 2, 0, 0])
	difference() {
		cube(l, s1, so);
		// translate([-0.05, t, t])
		// cube(l + 0.1, s1 + 0.1, so + 1);
	}
}