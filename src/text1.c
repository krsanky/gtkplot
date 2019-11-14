#include <stdlib.h>
#include <gtk/gtk.h>

int
main(int argc, char *argv[])
{
	GtkBuilder     *builder;
	GtkWidget      *window;
	GtkWidget      *textview;
	GtkTextBuffer  *textbuf;
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



//	g_lbl_hello = GTK_WIDGET(gtk_builder_get_object(builder, "lbl_hello"));
	textview = GTK_WIDGET(gtk_builder_get_object(builder, "text_1"));
	textbuf = gtk_text_view_get_buffer (GTK_TEXT_VIEW(textview));

/*
	textbuf = gtk_text_buffer_new(NULL);
	textview = gtk_text_view_new_with_buffer (textbuf);
*/
	gtk_text_view_set_wrap_mode (GTK_TEXT_VIEW (textview), GTK_WRAP_WORD); 
	gtk_text_buffer_set_text(textbuf, "This is some text ...\nasd more ...", -1);

	g_object_unref(builder);


	gtk_widget_show(window);
	gtk_main();

	return 0;
}

void
on_btn_1_clicked()
{
	printf("asdasd\n");
	g_message("g_message() from %s\n", "on_btn_1_clicked()");
}

void
on_window_main_destroy()
{
	gtk_main_quit();
}
