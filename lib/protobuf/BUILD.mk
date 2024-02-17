
protobuf_SRC := https://apache.jfrog.io/artifactory/arrow/thirdparty/7.0.0/protobuf-v21.3.tar.gz

protobuf_CONFIG_ARGS =  -DCMAKE_INSTALL_PREFIX=$$(COSMOS) \
     -DBUILD_SHARED_LIBS=OFF\
     -DCMAKE_C_FLAGS="-Os"\
     -DCMAKE_INSTALL_LIBDIR=lib\
     -Dprotobuf_BUILD_TESTS=OFF\
     -Dprotobuf_BUILD_PROTOC_BINARIES=OFF\
     -DCMAKE_BUILD_TYPE="Release"\
     -DCMAKE_SYSTEM_PROCESSOR="$$(ARCH)"

$(eval $(call DOWNLOAD_SOURCE,lib/protobuf,$(protobuf_SRC)))
$(eval $(call SPECIFY_DEPS,lib/protobuf,$(protobuf_DEPS)))


o/lib/protobuf/configured.x86_64: o/lib/protobuf/setup
o/lib/protobuf/configured.aarch64: o/lib/protobuf/setup

o/lib/protobuf/setup: o/lib/protobuf/patched
	touch $@

$(eval $(call CMAKE_BUILD,lib/protobuf,$(protobuf_CONFIG_ARGS),$(protobuf_CONFIG_ARGS)))

o/lib/protobuf/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)

