# 编译日志

## 一.编译步骤

```shell
./scripts/run-docker.sh
# into docker container
./scripts/build-bootstrap.sh
```

## 二.遇到问题

### 1.404

换下载源或版本

### 2.symbol not found

```shell
termux_step_pre_configure() {
    export LDFLAGS="$LDFLAGS -Wl,--undefined-version"
}
```

### 3.No package bzip2 found in any of the enabled repositories. Are you trying to set up a custom repository

`./scripts/build-bootstrap.sh` 和 `./scripts/generate-bootstrap.sh`

里面`bzip2`替换为`libbz2`
