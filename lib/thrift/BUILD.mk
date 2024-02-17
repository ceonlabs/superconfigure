
thrift_SRC := https://apache.jfrog.io/artifactory/arrow/thirdparty/7.0.0/thrift-0.16.0.tar.gz

thrift_CONFIG_ARGS =  -DCMAKE_INSTALL_PREFIX=$$(COSMOS) \
     -DBUILD_SHARED_LIBS=OFF\
     -DCMAKE_C_FLAGS="-Os"\
     -DCMAKE_CXX_FLAGS="-fexceptions -frtti -include poll.h" \
     -DCMAKE_INSTALL_LIBDIR=lib\
     -DCMAKE_BUILD_TYPE="Release"\
     -DCMAKE_SYSTEM_PROCESSOR="$$(ARCH)"\
     -DBUILD_COMPILER=OFF -DBUILD_TESTING=OFF \
     -DWITH_JAVASCRIPT=OFF -DWITH_NODEJS=OFF \
     -DBoost_USE_STATIC_LIBS=ON


$(eval $(call DOWNLOAD_SOURCE,lib/thrift,$(thrift_SRC)))
$(eval $(call SPECIFY_DEPS,lib/thrift,$(thrift_DEPS)))


o/lib/thrift/configured.x86_64: o/lib/thrift/setup
o/lib/thrift/configured.aarch64: o/lib/thrift/setup

o/lib/thrift/setup: o/lib/thrift/patched
	touch $@

$(eval $(call CMAKE_BUILD,lib/thrift,$(thrift_CONFIG_ARGS),$(thrift_CONFIG_ARGS)))

o/lib/thrift/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)

