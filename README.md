# Env for Windows

## How to download
Please use git command and clone recursively, then follow the tutorials and documents to install Env tool:
```shell
git clone --recursive --depth 1 https://github.com/RT-Thread/env-windows.git
```
对于中国大陆用户，请使用以下命令:
```shell
git clone --recursive --depth 1 https://gitee.com/mirrors_RT-Thread/env-windows.git
```
## Tutorials and documents
- [How to install and use Env tool (document)](https://github.com/RT-Thread/rt-thread/blob/master/documentation/env/env.md)
- [Get Started with RT-Thread Env Tool (video)](https://www.youtube.com/watch?v=dEK94o_YoSo)
- [How to use QEMU simulator with Env tool in Windows (document)](https://github.com/RT-Thread/rt-thread/blob/master/documentation/quick-start/quick_start_qemu/quick_start_qemu_windows.md)
- [Development Tools Selection (video)](https://www.youtube.com/watch?v=F_kU1CMjLKw)

## Code formatting

Env includes clang-format **22.1.8** for Windows x64. Open an Env terminal to use
the bundled executable; no separate LLVM or Python package installation is needed.

From a project with a `.clang-format` configuration, run:

```shell
clang-format --version
clang-format --style=file --dry-run --Werror path/to/file.c
clang-format --style=file -i path/to/file.c
```

The last command formats the specified file in place. See
[clang-format package details](tools/bin/clang-format.README.md) for its source,
checksum, and license.

## Upstream and dependencies repository

These repositories will be covered as submodles in this project.

- [RT-Thread Env Script](https://github.com/RT-Thread/env)
- [RT-Thread software packages index](https://github.com/RT-Thread/packages)
