
boost_SRC := https://apache.jfrog.io/artifactory/arrow/thirdparty/7.0.0/boost_1_81_0.tar.gz

$(eval $(call DOWNLOAD_SOURCE,lib/boost,$(boost_SRC)))
$(eval $(call SPECIFY_DEPS,lib/boost,$(boost_DEPS)))

o/lib/boost/setup: o/lib/boost/patched
	touch $@

o/lib/boost/configured.x86_64: CONFIG_COMMAND = $(BASELOC)/lib/boost/config-wrapper
o/lib/boost/configured.aarch64: CONFIG_COMMAND = $(BASELOC)/lib/boost/config-wrapper

o/lib/boost/built.x86_64: BUILD_COMMAND = $(DUMMYLINK0)
o/lib/boost/built.aarch64: BUILD_COMMAND = $(DUMMYLINK0)

o/lib/boost/installed.x86_64: INSTALL_COMMAND = $(DUMMYLINK0)
o/lib/boost/installed.aarch64: INSTALL_COMMAND = $(DUMMYLINK0)

o/lib/boost/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)

