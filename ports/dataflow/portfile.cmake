vcpkg_from_git(
        OUT_SOURCE_PATH SOURCE_PATH
        URL https://github.com/Chemiseblanc/dataflow/
        REF 4a8d5a320aaab1dd3e591b0c9777a0a1e4221111
        HEAD_REF main
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
            -DDATAFLOW_BUILD_EXAMPLES=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(
        CONFIG_PATH "share/cmake/dataflow"
)
vcpkg_copy_pdbs()


file(
    INSTALL "${SOURCE_PATH}/LICENSE.txt"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
    RENAME copyright
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")