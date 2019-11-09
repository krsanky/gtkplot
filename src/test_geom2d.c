#include <stdio.h>
#include <stdlib.h>

#include "geom2d.h"

int
main(void)
{
	printf("test geom2d\n");
	struct segment *s;

	s = scan_new_segment();

//	free(s);
	return EXIT_SUCCESS;
}
