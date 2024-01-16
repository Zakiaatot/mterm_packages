#!/bin/bash
# archs="aarch64 arm i686 x86_64"
archs="aarch64"

for arch in $archs; do
    rsync -rv output/*${arch}.deb root@repo.mterm.hackerfly.cn:/www/wwwroot/repo.mterm.hackerfly.cn/repository/pool/${arch}
done
