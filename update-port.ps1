$port = $args[0]
& vcpkg format-manifest ".\ports\$port\vcpkg.json"
& vcpkg --x-builtin-ports-root=.\ports --x-builtin-registry-versions-dir=.\versions x-add-version  $port --verbose