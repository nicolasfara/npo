# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils
DESCRIPTION="Toggl desktop"
HOMEPAGE="https://toggl.com/"
SRC_URI="https://github.com/toggl/toggldesktop/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/poco
		dev-libs/openssl
		media-libs/gst-plugins-base:0.10
		dev-qt/qtwebkit"
RDEPEND="${DEPEND}"


src_prepare() {
	#epatch "${FILESDIR}/systemlibs.patch"
	eapply_user
	eapply "${FILESDIR}/production.patch"
}

src_compile() {
	emake -j1 deps || die "Failed to compile deps"
	emake -j1 || die "failed to compile sources"
}

src_install () {
	dobin src/ui/linux/TogglDesktop.sh
	dobin src/ui/linux/TogglDesktop/build/release/TogglDesktop

	newlib.so src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so.1.0.0 libTogglDesktopLibrary.so.1 || die "Lib fail"
	newlib.so third_party/bugsnag-qt/build/release/libbugsnag-qt.so.1.0.0 libbugsnag-qt.so.1 || die "lib fail"

	newlib.so src/lib/linux/TogglDesktopLibrary/build/release/libcrypto.so libcrypto.so.1
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libcrypto.so.1.1
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoCrypto.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoData.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoDataSQLite.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoFoundation.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoJSON.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoNet.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoNetSSL.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoUtil.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoXML.so.50
	newlib.so src/lib/linux/TogglDesktopLibrary/build/release/libssl.so libssl.so.1
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libssl.so.1.1

}
