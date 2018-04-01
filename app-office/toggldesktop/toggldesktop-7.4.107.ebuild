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
	emake -j1 DESTDIR="${D}" deps || die
	emake -j1 DESTDIR="${D}" || die
}

src_install () {
	dolib.so src/lib/linux/TogglDesktopLibrary/build/release/libTogglDesktopLibrary.so.1
	dolib.so third_party/bugsnag-qt/build/release/libbugsnag-qt.so.1

	dobin src/ui/linux/TogglDesktop.sh
	dobin src/ui/linux/TogglDesktop/build/release/TogglDesktop
}
