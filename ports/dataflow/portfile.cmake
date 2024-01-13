vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO chemiseblanc/dataflow
        REF 0d5b81cf488b7b489e7bbc6f960745551a0c8352
        SHA512 0
        HEAD_REF main
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()