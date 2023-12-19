vcpkg_from_github(
        OUT_SOURCE_PATH SOURCE_PATH
        REPO LLNL/sundials
        REF v6.7.0
        SHA512 ad72a7d9ad3a650d5cb9fe825e79b6a3921944a0951c798616343cd36a8e8933c993783724afcf820a6283dc877226845ee43248472d769721822732541e4368
        HEAD_REF master
        PATCHES
        install-dlls-in-bin.patch
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" SUN_BUILD_STATIC)
string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "dynamic" SUN_BUILD_SHARED)

vcpkg_check_features(
        OUT_FEATURE_OPTIONS FEATURE_OPTIONS
        FEATURES
            "mpi" ENABLE_MPI
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
        -D_SHARED_LIB_SUFFIX=""
        -D_STATIC_LIB_SUFFIX=""
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
file(REMOVE "${CURRENT_PACKAGES_DIR}/LICENSE")
file(REMOVE "${CURRENT_PACKAGES_DIR}/debug/LICENSE")

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH "lib/cmake/${PORT}")