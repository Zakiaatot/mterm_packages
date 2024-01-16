#!/bin/bash
get_subdirectories() {
    local directory="$1"
    local subdirectories=""

    # 遍历目录
    for entry in "$directory"/*; do
        # 检查是否为目录
        if [ -d "$entry" ]; then
            # 获取目录名称并添加到变量中
            subdirectories+="$(basename "$entry") "
        fi
    done

    # 移除末尾的空格
    subdirectories="${subdirectories% }"

    # 返回子目录列表
    echo "$subdirectories"
}

debs=$(get_subdirectories "./packages")

# archs="aarch64 arm i686 x86_64"
archs="aarch64"

for deb in $debs; do
    for arch in $archs; do
        echo "Building $deb for $arch"
        ./build-package.sh -a "$arch" "$deb"
    done
done
