## Process this file with automake to produce Makefile.in

#AUTOMAKE_OPTIONS = no-dependencies foreign

lib_LTLIBRARIES = libmod_draw.la

libmod_draw_la_SOURCES = mod_draw.c
libmod_draw_la_CFLAGS = $(COMMON_CFLAGS) $(SDL_CFLAGS) -I$(BGD_PATH)/include -I. -I../libdraw/ -I../librender/ -I../libblit/ -I../libgrbase/
libmod_draw_la_LDFLAGS = -s -dynamiclib -no-undefined -avoid-version
libmod_draw_la_LIBADD = $(COMMON_LDFLAGS) -L$(BGD_PATH)/bgdrtm/src/.libs -L../libdraw/.libs -ldraw -L../librender/.libs -lrender -L../libblit/.libs -lblit -L../libgrbase/.libs -lgrbase

## Make sure these will be cleaned even when they're not built by
## default.
CLEANFILES = libmod_draw.la

