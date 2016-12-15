# Contributor: Yoshihiro Misawa <myoshi321go@gmail.com>
# Maintainer: Yoshihiro Misawa <myoshi321go@gmail.com>
pkgname=vips
pkgver=8.4.5
pkgrel=0
pkgdesc="A fast image processing library with low memory needs."
url="http://www.vips.ecs.soton.ac.uk/"
arch="all"
license="LGPL 2.1+"
depends=""
depends_dev=""
makedepends="libpng-dev libwebp-dev libexif-dev libxml2-dev libjpeg-turbo-dev libgsf-dev giflib-dev gobject-introspection-dev ghostscript-dev fftw-dev poppler-dev cairo-dev orc-dev librsvg-dev lcms2-dev"
install=""
subpackages="$pkgname-dev $pkgname-doc $pkgname-lang $pkgname-tools"
source="http://www.vips.ecs.soton.ac.uk/supported/8.4/vips-$pkgver.tar.gz"

builddir="$srcdir"/vips-$pkgver
build() {
	cd "$builddir"
	./configure \
		--build=$CBUILD \
		--host=$CHOST \
		--prefix=/usr \
		--enable-debug=no \
		--without-python \
		--enable-gtk-doc-html=no \
		--enable-gtk-doc=no \
		--enable-pyvips8=no \
		--disable-static \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--docdir=/usr/share/doc \
		|| return 1
	make || return 1
}

package() {
	cd "$builddir"
	make DESTDIR="$pkgdir" install || return 1
}

tools() {
	pkgdesc="Command-line tools for $pkgname"
	mkdir -p "$subpkgdir"/usr/
	mv "$pkgdir"/usr/bin "$subpkgdir"/usr/
}

md5sums="38347ebab211722e436e124ea067da16  vips-8.4.5.tar.gz"
sha256sums="0af73a51f53250ca240a683ba0d652003744382b78d8a10152c8f1bd019897fd  vips-8.4.5.tar.gz"
sha512sums="7c925f81a03773ce417b25c1866a35d1cc29f1bf9705916ecc9d6b9ccbd0cda841e8411c345b1aa9949cdb4c1079ed6d7aaa3c861f002e2dfe50891be960cdfe  vips-8.4.5.tar.gz"
