## Process this file with automake to produce Makefile.in

#AUTOMAKE_OPTIONS = no-dependencies foreign

lib_LTLIBRARIES = libmod_regex.la

libmod_regex_la_SOURCES = mod_regex.c regex.c mod_regex.def
libmod_regex_la_CFLAGS = $(COMMON_CFLAGS) -I. -I$(BGD_PATH)/include -I$(BGD_PATH)/bgdrtm/include
libmod_regex_la_LDFLAGS = -s -dynamiclib -no-undefined -avoid-version
libmod_regex_la_LIBADD = $(COMMON_LDFLAGS) -L$(BGD_PATH)/bgdrtm/src/.libs -lbgdrtm

## Make sure these will be cleaned even when they're not built by
## default.
CLEANFILES = libmod_regex.la

