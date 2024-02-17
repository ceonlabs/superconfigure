
arrow_SRC := https://github.com/apache/arrow/archive/refs/tags/apache-arrow-15.0.0.tar.gz

arrow_DEPS := compress/zlib compress/brotli lib/protobuf compress/zlib lib/jemalloc lib/boost lib/thrift

arrow_CONFIG_ARGS = -DCMAKE_INSTALL_PREFIX=$$(COSMOS) \
     -DBUILD_SHARED_LIBS=OFF\
     -DCMAKE_C_FLAGS="-Os"\
     -DCMAKE_INSTALL_LIBDIR=lib\
     -DCMAKE_BUILD_TYPE="Release"\
     --preset "ninja-release" \
     -DCMAKE_C_FLAGS="-DMADV_DONTNEED=MADV_DONTNEED -D_GNU_SOURCE" \
     -DCMAKE_CXX_FLAGS="-fexceptions -frtti" \
     -DMADV_DONTNEED=MADV_DONTNEED -D_GNU_SOURCE\
     -DCMAKE_SYSTEM_NAME=Linux \
     -DCMAKE_SYSTEM_PROCESSOR="$$(ARCH)" \
     -DARROW_BUILD_SHARED=OFF -DARROW_BUILD_STATIC=ON \
     -DARROW_BUILD_TESTS=OFF -DARROW_BUILD_INTEGRATION=OFF \
     -DARROW_DEPENDENCY_USE_SHARED=OFF \
     -DJEMALLOC_INCLUDE_DIR=$$(COSMOS)/include/jemalloc -DJEMALLOC_LIB_DIR=$$(COSMOS)/lib\ 
     -DBoost_SOURCE=SYSTEM \
     -DBrotli_SOURCE=SYSTEM \
     -Djemalloc_SOURCE=SYSTEM \
     -DZLIB_SOURCE=SYSTEM \
     -DProtobuf_SOURCE=SYSTEM \
     -DThrift_SOURCE=SYSTEM

$(eval $(call DOWNLOAD_SOURCE,lib/arrow,$(arrow_SRC)))
$(eval $(call SPECIFY_DEPS,lib/arrow,$(arrow_DEPS)))


o/lib/arrow/configured.x86_64: o/lib/arrow/setup
o/lib/arrow/configured.aarch64: o/lib/arrow/setup

o/lib/arrow/setup: o/lib/arrow/patched
	mv o/lib/arrow/arrow-apache-arrow-15.0.0 o/lib/arrow/arrow-15.0.0
	cp lib/arrow/ThirdpartyToolchain.cmake o/lib/arrow/arrow-15.0.0/cpp/cmake_modules/ThirdpartyToolchain.cmake
	touch $@


define ARROW_CMAKE_BUILD =
o/lib/arrow/configured.x86_64: CONFIG_COMMAND = cmake -G Ninja $(BASELOC)/o/lib/arrow/arrow-15.0.0/cpp arrow_CONFIG_ARGS
o/lib/arrow/configured.aarch64: CONFIG_COMMAND = cmake -G Ninja $(BASELOC)/o/lib/arrow/arrow-15.0.0/cpp arrow_CONFIG_ARGS
o/lib/arrow/built.x86_64: BUILD_COMMAND = ninja -j$(MAXPROC)
o/lib/arrow/built.aarch64: BUILD_COMMAND = ninja -j$(MAXPROC)
o/lib/arrow/installed.x86_64: INSTALL_COMMAND = ninja install -j$(MAXPROC)
o/lib/arrow/installed.aarch64: INSTALL_COMMAND = ninja install -j$(MAXPROC)
endef

$(eval $(call ARROW_CMAKE_BUILD))

o/lib/arrow/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)

