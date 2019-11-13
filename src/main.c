#include <stdlib.h>
#include <gtk/gtk.h>

GtkWidget      *g_lbl_hello;
GtkWidget      *g_lbl_count;
static cairo_surface_t *surface = NULL;

int
main(int argc, char *argv[])
{
	GtkBuilder     *builder;
	GtkWidget      *window;
	char	       *builder_file = "glade/gtkplot.glade";
	GError	       *err = NULL;

	gtk_init(&argc, &argv);

	builder = gtk_builder_new();
	/* gtk_builder_add_from_file(builder, "glade/gtkplot.glade", NULL); */
	if (gtk_builder_add_from_file(builder, builder_file, &err) == 0) {
		fprintf(stderr, "Error adding builder from file %s\n%s\n",
			builder_file, err->message);
		return EXIT_FAILURE;
	}
	window = GTK_WIDGET(gtk_builder_get_object(builder, "window_main"));
	gtk_builder_connect_signals(builder, NULL);

	g_lbl_hello = GTK_WIDGET(gtk_builder_get_object(builder, "lbl_hello"));
	g_lbl_count = GTK_WIDGET(gtk_builder_get_object(builder, "lbl_count"));

	g_object_unref(builder);

	gtk_widget_show(window);
	gtk_main();

	return 0;
}

static void
clear_surface(void)
{
	cairo_t	       *cr;
	cr = cairo_create(surface);
	cairo_set_source_rgb(cr, 1, 1, 1);
	cairo_paint(cr);
	cairo_destroy(cr);
}

/* called when button is clicked */
#ifdef _WIN32
G_MODULE_EXPORT void
#else
void
#endif
on_btn_hello_clicked()
{
	/* static yay! */
	static unsigned int count = 0;
	char		str_count[30] = {0};

	gtk_label_set_text(GTK_LABEL(g_lbl_hello), "Clicked Count");
	count++;
	sprintf(str_count, "%d", count);
	gtk_label_set_text(GTK_LABEL(g_lbl_count), str_count);
}

#ifdef _WIN32
G_MODULE_EXPORT void
#else
void
#endif
on_btn_close_clicked()
{
	gtk_main_quit();
}

/* called when window is closed */
#ifdef _WIN32
G_MODULE_EXPORT void
#else
void
#endif
on_window_main_destroy()
{
	gtk_main_quit();
}
