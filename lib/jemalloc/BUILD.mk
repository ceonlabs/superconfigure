
jemalloc_SRC := https://apache.jfrog.io/artifactory/arrow/thirdparty/7.0.0/jemalloc-5.3.0.tar.bz2

$(eval $(call DOWNLOAD_SOURCE,lib/jemalloc,$(jemalloc_SRC)))
$(eval $(call SPECIFY_DEPS,lib/jemalloc,$(jemalloc_DEPS)))

o/lib/jemalloc/setup: o/lib/jemalloc/patched
	touch $@

o/lib/jemalloc/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/lib/jemalloc/config-wrapper
o/lib/jemalloc/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/lib/jemalloc/config-wrapper

o/lib/jemalloc/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/lib/jemalloc/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/lib/jemalloc/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/lib/jemalloc/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/lib/jemalloc/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)

