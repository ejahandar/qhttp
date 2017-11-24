TEMPLATE = subdirs

SUBDIRS += src
SUBDIRS += example

example.depends = src


DISTFILES += qhttp.pri
