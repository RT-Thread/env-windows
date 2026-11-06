# clang-format 22.1.8

`clang-format.exe` is the unmodified Windows x64 executable from the LLVM
22.1.8 release. It is bundled in `tools/bin`, which Env already adds to `PATH`.
It runs without a separate LLVM installation, Python package, or Visual C++
Redistributable installation. It does not run on 32-bit Windows.

## Source

- Project: https://github.com/llvm/llvm-project
- Release tag: `llvmorg-22.1.8`
- Revision reported by the executable: `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`
- Archive: `clang+llvm-22.1.8-x86_64-pc-windows-msvc.tar.xz`
- Download: https://github.com/llvm/llvm-project/releases/download/llvmorg-22.1.8/clang+llvm-22.1.8-x86_64-pc-windows-msvc.tar.xz
- Archive member: `clang+llvm-22.1.8-x86_64-pc-windows-msvc/bin/clang-format.exe`
- Executable size: `3799040` bytes
- Executable SHA-256: `7eb8182754035ce4044ae3a68abaf91432387ff44bc2d54c7077067e2bcce1d0`

To reproduce this package, extract the member above from the official archive
and copy it to `tools/bin/clang-format.exe`. Check the SHA-256 with PowerShell:

```powershell
Get-FileHash .\tools\bin\clang-format.exe -Algorithm SHA256
```

## Usage

Open an Env terminal and check the bundled version:

```shell
clang-format --version
```

Use the target project's `.clang-format` configuration to check or format a file:

```shell
clang-format --style=file --dry-run --Werror path/to/file.c
clang-format --style=file -i path/to/file.c
```

The first command checks formatting without modifying the file and returns a
nonzero exit code for formatting violations. The second command rewrites the
file. Without a `.clang-format` configuration, clang-format uses its default
LLVM style.

## License

The LLVM Project is distributed under the Apache License 2.0 with LLVM
Exceptions. The accompanying [license](clang-format.LICENSE.txt) is copied from
`llvm/LICENSE.TXT` at the `llvmorg-22.1.8` tag:

https://github.com/llvm/llvm-project/blob/llvmorg-22.1.8/llvm/LICENSE.TXT
