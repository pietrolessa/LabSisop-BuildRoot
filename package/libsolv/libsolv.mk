################################################################################
#
# libsolv
#
################################################################################

LIBSOLV_VERSION = 0.7.22
LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
LIBSOLV_LICENSE = BSD-3-Clause
LIBSOLV_LICENSE_FILES = LICENSE.BSD
LIBSOLV_INSTALL_STAGING = YES
LIBSOLV_DEPENDENCIES = zlib
LIBSOLV_CONF_OPTS = -DCMAKE_CXX_COMPILER_FORCED=ON

ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
LIBSOLV_CONF_OPTS += -DENABLE_STATIC=ON
else
LIBSOLV_CONF_OPTS += -DDISABLE_STATIC=ON
endif

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
LIBSOLV_CONF_OPTS += -DENABLE_SHARED=ON
else
LIBSOLV_CONF_OPTS += -DDISABLE_SHARED=ON
endif

$(eval $(cmake-package))
