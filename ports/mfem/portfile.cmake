vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO mfem/mfem
  REF v4.6
  SHA512 819519c061fa96d3cd735090085c86c0d46e6344a69712b9b2af087ea9ce56ab3446fd9b3055f80a5d8b2a61f944497319980fc951a857c7aeef88c62b154b8e
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