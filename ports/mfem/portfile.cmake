vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO mfem/mfem
  REF v4.6
  SHA512 8805b4993b6f11abe7ac7dda59d0ddb2e0f5f6b09c2b9c57e665f481cd9bd6b669e63621b38989f70dc8ae38c42a7e8c4e10a1d87a4ac29d53ddd95ce79db0ae
  HEAD_REF main
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)