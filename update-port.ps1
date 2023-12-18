$port = $args[0]

& vcpkg format-manifest ".\ports\$port\vcpkg.json"
& git add ".\ports\$port"
& git commit -m "Updated port of $port"

& vcpkg --x-builtin-ports-root=.\ports --x-builtin-registry-versions-dir=.\versions x-add-version  $port --verbose
& git add ".\versions"
& git commit -m "Updated baseline of $port"