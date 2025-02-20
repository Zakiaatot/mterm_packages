TERMUX_PKG_HOMEPAGE=https://www.gnupg.org/related_software/npth/
TERMUX_PKG_DESCRIPTION="New GNU Portable Threads Library"
TERMUX_PKG_LICENSE="LGPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.6
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://www.gnupg.org/ftp/gcrypt/npth/npth-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1
TERMUX_PKG_BREAKS="libnpth-dev"
TERMUX_PKG_REPLACES="libnpth-dev"

termux_step_pre_configure() {
    export LDFLAGS="$LDFLAGS -Wl,--undefined-version"
}
