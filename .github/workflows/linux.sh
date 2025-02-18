#/bin/bash

#
# Copyright tricked-dev 2022
#

wget "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod a+x appimagetool-x86_64.AppImage
sudo mv appimagetool-x86_64.AppImage /bin/appimagetool

cd desktop

run() {
    strip -s target/x86_64-unknown-linux-gnu/release/desktop
    echo installing cargo $1
    cargo install cargo-$1 &>/dev/null
    echo Running cargo $1
    cargo $1 &>/dev/null
}

run deb
run aur
run appimage
run generate-rpm

mkdir ../dist &>/dev/null
ls -R #I hate life
mv PKGBUILD ../dist/
mv ascella-*.AppImage ../dist/
mv ascella-*.tar.gz ../dist/
mv target/debian/ascella_*.deb ../dist/
mv target/generate-rpm/ascella-*.rpm ../dist/
cp LICENSE ../dist/
