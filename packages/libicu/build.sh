TERMUX_PKG_HOMEPAGE=http://site.icu-project.org/home
TERMUX_PKG_DESCRIPTION='International Components for Unicode library'
TERMUX_PKG_LICENSE="custom"
# We override TERMUX_PKG_SRCDIR termux_step_post_get_source so need to do
# this hack to be able to find the license file.
TERMUX_PKG_LICENSE_FILE="../LICENSE"
TERMUX_PKG_MAINTAINER="@termux"
# Never forget to always bump revision of reverse dependencies and rebuild them
# when bumping "major" version.
TERMUX_PKG_VERSION="74.2"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://mirrors.aliyun.com/blfs/conglomeration/icu/icu4c-74_1-src.tgz
TERMUX_PKG_SHA256=86ce8e60681972e60e4dcb2490c697463fcec60dd400a5f9bffba26d0b52b8d0
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_METHOD=repology
TERMUX_PKG_DEPENDS="libc++"
TERMUX_PKG_BREAKS="libicu-dev"
TERMUX_PKG_REPLACES="libicu-dev"
TERMUX_PKG_HOSTBUILD=true
TERMUX_PKG_EXTRA_HOSTBUILD_CONFIGURE_ARGS="--disable-samples --disable-tests"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-samples --disable-tests --with-cross-build=$TERMUX_PKG_HOSTBUILD_DIR"

termux_step_post_get_source() {
	rm $TERMUX_PKG_SRCDIR/LICENSE
	# curl -o $TERMUX_PKG_SRCDIR/LICENSE -L https://raw.githubusercontent.com/unicode-org/icu/release-${TERMUX_PKG_VERSION//./-}/LICENSE
	TERMUX_PKG_SRCDIR+="/source"
	find . -type f | xargs touch
}

termux_step_post_massage() {
	local _GUARD_FILE="lib/libicuuc.so.74"
	if [ ! -e "${_GUARD_FILE}" ]; then
		termux_error_exit "Error: file ${_GUARD_FILE} not found."
	fi
}
