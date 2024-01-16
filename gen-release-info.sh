# !!! just for apt repository

# arch
arch="aarch64"
# gen gpg key
gpg --list-keys || gpg --gen-key
# gen packages
cd /www/wwwroot/repo.mterm.hackerfly.cn/repository
dpkg-scanpackages pool/${arch}/ | gzip -9c >dists/stable/main/binary-${arch}/Packages.gz
dpkg-scanpackages pool/${arch}/ >dists/stable/main/binary-${arch}/Packages
# gen release
cd /www/wwwroot/repo.mterm.hackerfly.cn/repository/dists/stable
apt-ftparchive release . >Release
# Release.gpg
gpg --armor --detach-sign --sign -o Release.gpg Release
# InRelease
gpg --clearsign -o InRelease Release
