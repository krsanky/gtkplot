struct point {
	double		x;
	double		y;
};

struct segment {
	struct point	a;
	struct point	b;
};

void		print_segment(struct segment *);
struct segment *scan_new_segment();
