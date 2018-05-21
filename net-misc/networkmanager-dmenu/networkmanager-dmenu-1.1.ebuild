# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Small script to manage NetworkManager connections with dmenu instead of nm-applet"
HOMEPAGE="https://github.com/firecat53/networkmanager-dmenu"
SRC_URI="https://github.com/firecat53/networkmanager-dmenu/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-misc/networkmanager"
RDEPEND="${DEPEND}"

src_install() {
	dobin networkmanager_dmenu
	dodoc README.rst
}
