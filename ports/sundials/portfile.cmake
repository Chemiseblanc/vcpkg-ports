vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO LLNL/sundials
        REF e2f29c34f324829302037a1492db480be8828084
        SHA512 9af9a5d7a44de1f2afbc35d8e2ec3d35a2d15f1b708be7a90bf849a0d0576fda6c73fae6b8954025805ac1ca25468558c02dcc2fd86b5767699518988817d4d8
        HEAD_REF master
        PATCHES
        install-dlls-in-bin.patch
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" SUN_BUILD_STATIC)
string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" SUN_BUILD_SHARED)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
            "mpi" BUILD_MPI
            "openmp" ENABLE_OPENMP
            "cuda" ENABLE_CUDA
            "hip" ENABLE_HIP
            "lapack" ENABLE_LAPACK
            "arkode" BUILD_ARKODE
            "cvode" BUILD_CVODE
            "cvodes" BUILD_CVODES
            "ida" BUILD_IDA
            "idas" BUILD_IDAS
            "kinsol" BUILD_KINSOL
            "cpodes" BUILD_CPODES
)

vcpkg_cmake_configure(
        SOURCE_PATH "${SOURCE_PATH}"
        OPTIONS
        -D_BUILD_EXAMPLES=OFF
        -DBUILD_STATIC_LIBS=${SUN_BUILD_STATIC}
        -DBUILD_SHARED_LIBS=${SUN_BUILD_SHARED}
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(REMOVE "${CURRENT_PACKAGES_DIR}/LICENSE")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/LICENSE")

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")