#include <gtk/gtk.h>
#include <glib.h>

int
main(int argc, char *argv[])
{
	printf("i%d: %s\n", argc, argv[0]);
	g_print("Hello, world!\n");

	return 0;
}

