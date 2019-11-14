#include <stdlib.h>
#include <gtk/gtk.h>

int
main(int argc, char *argv[])
{
	GtkBuilder     *builder;
	GtkWidget      *window;
	char	       *builder_file = "glade/text1.glade";
	GError	       *err = NULL;

	gtk_init(&argc, &argv);

	builder = gtk_builder_new();
	if (gtk_builder_add_from_file(builder, builder_file, &err) == 0) {
		fprintf(stderr, "Error adding builder from file %s\n%s\n",
			builder_file, err->message);
		return EXIT_FAILURE;
	}
	window = GTK_WIDGET(gtk_builder_get_object(builder, "window_main"));
	gtk_builder_connect_signals(builder, NULL);

	g_object_unref(builder);

	gtk_widget_show(window);
	gtk_main();

	return 0;
}

void
on_btn_1_clicked()
{
	g_print("asdasd\n");
}

void
on_window_main_destroy()
{
	gtk_main_quit();
}
