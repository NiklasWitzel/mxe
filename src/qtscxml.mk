# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qtscxml
$(PKG)_WEBSITE  := https://www.qt.io/
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := e96a6db3423af6b4643e8e170905926642379537fe5d023ec989bd07b3c7f0ec
$(PKG)_SUBDIR    = $(subst qtbase,qtscxml,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtscxml,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtscxml,$(qtbase_URL))
$(PKG)_DEPS     := cc qtbase qtdeclarative

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
