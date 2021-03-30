# Maintainer: FadeMind <fademind@gmail.com>

pkgname=abstract-gray-wallpaper
pkgver=20180214
pkgrel=1
pkgdesc="Abstract Gray wallpaper"
url="https://github.com/FadeMind/${pkgname}"
arch=('any')
license=('GPL')
makedepends=('make')
options=('!strip')
source=(Makefile)
sha256sums=('7a77f034033398097ba57b7671843cd4fcdcee11640c2a4d90c00747e4c8f3af')

package() {
    make -C "${startdir}" install DESTDIR="$pkgdir"
}
