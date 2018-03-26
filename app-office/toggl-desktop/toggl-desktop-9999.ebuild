# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3
DESCRIPTION="Toggl desktop"
HOMEPAGE="https://toggl.com/"
EGIT_REPO_URI="https://github.com/toggl/toggldesktop.git"

LICENSE="APACHE2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/poco
		dev-libs/openssl
		media-libs/gst-plugins-base:0.10
		dev-qt/qtwebkit"
RDEPEND="${DEPEND}"

src_compile () {
	emake -j1 deps || die "Failed to build dependencies"
	emake -j1 || die "Erorr on building the application"
}

src_install () {
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoData.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoJSON.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoUtil.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libssl.so.1.1
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so.1.0
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoDataSQLite.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoNet.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoXML.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so.1.0.0
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoCrypto.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoFoundation.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libPocoNetSSL.so.50
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so.1

	cd src/ui/linux/TogglDesktop/build/release

	dobin TogglDesktop
}
