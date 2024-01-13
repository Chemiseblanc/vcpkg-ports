vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO chemiseblanc/dataflow
        REF 0d5b81cf488b7b489e7bbc6f960745551a0c8352
        SHA512 180a8bec081c20da023f382c7e2f24bc18482ad1e70914de2036a1cd9f1c9bea9a2f6eaac9d6b68f7d6e4f1b73b7e7d80ce9c351987609f0e8751e48f15b2ee9
        HEAD_REF main
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
            -DDATAFLOW_BUILD_EXAMPLES=OFF
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()