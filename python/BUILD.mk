
include python/cpy311-datasette/BUILD.mk
include python/cpy311-djngo/BUILD.mk
include python/cpy311-pypack1/BUILD.mk
include python/cpy311-pypack2/BUILD.mk
include python/cpy311-scrapscript/BUILD.mk

all-python: datasette pypack1 pypack2 djngo
.PHONY: all-python
