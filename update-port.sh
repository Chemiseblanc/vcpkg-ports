#!/usr/bin/env sh

vcpkg format-manifest ".\ports\$1\vcpkg.json"
vcpkg --x-builtin-ports-root=.\ports --x-builtin-registry-versions-dir=.\versions x-add-version  $1 --verbose