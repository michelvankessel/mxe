# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := miniupnpc
$(PKG)_WEBSITE  := http://miniupnp.free.fr/
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 2.1
$(PKG)_CHECKSUM := 19c5b6cf8f3fc31d5e641c797b36ecca585909c7f3685a5c1a64325340537c94
$(PKG)_GH_CONF  := miniupnp/miniupnp/tags,miniupnpc_,,,_
$(PKG)_DEPS     := cc

define $(PKG)_BUILD
    # build and install the library
    cd '$(BUILD_DIR)' && $(TARGET)-cmake '$(SOURCE_DIR)/miniupnpc' \
        -DUPNPC_BUILD_STATIC=$(CMAKE_STATIC_BOOL) \
        -DUPNPC_BUILD_SHARED=$(CMAKE_SHARED_BOOL) \
        -DUPNPC_BUILD_TESTS=OFF
    $(MAKE) -C '$(BUILD_DIR)' -j '$(JOBS)'
    $(MAKE) -C '$(BUILD_DIR)' -j 1 install
endef
