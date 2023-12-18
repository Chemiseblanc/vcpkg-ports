vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO mfem/mfem
  REF v4.6
  SHA512 8805b4993b6f11abe7ac7dda59d0ddb2e0f5f6b09c2b9c57e665f481cd9bd6b669e63621b38989f70dc8ae38c42a7e8c4e10a1d87a4ac29d53ddd95ce79db0ae
  HEAD_REF main
  PATCHES
    fix-cmake-install.patch
    fix-openmp-msvc.patch
    fix-dep-linkage.patch
    fix-mpfr.patch
    remove_source_install_dir.patch
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        "cuda" MFEM_USE_CUDA
        "openmp" MFEM_USE_OPENMP
        "mpi" MFEM_USE_MPI
        "metis" MFEM_USE_METIS
        "metis" MFEM_USE_METIS_5
        "zlib" MFEM_USE_ZLIB
        "ginkgo" MFEM_USE_GINKGO
        "lapack" MFEM_USE_LAPACK
        "suitesparse" MFEM_USE_SUITESPARSE
        "sundials" MFEM_USE_SUNDIALS
        "gnutls" MFEM_USE_GNUTLS
        "netcdf" MFEM_USE_NETCDF
        "mpfr" MFEM_USE_MPFR
        "libunwind" MFEM_USE_LIBUNWIND
        
        "gslib" MFEM_USE_GSLIB
        "ceed" MFEM_USE_CEED
        "amgx" MFEM_USE_AMGX
        "conduit" MFEM_USE_CONDUIT
        "fms" MFEM_USE_FMS
        "sidre" MFEM_USE_SIDRE # Package actually caleld Axom
        "moonolith" MFEM_USE_MOONOLITH
        "hiop" MFEM_USE_HIOP
        "codipack" MFEM_USE_CODIPACK
        "occa" MFEM_USE_OCCA
        "raja" MFEM_USE_RAJA
        "umpire" MFEM_USE_UMPIRE
        "caliper" MFEM_USE_CALIPER
        "algoim" MFEM_USE_ALGOIM
        "adios2" MFEM_USE_ADIOS2
        "parelag" MFEM_USE_PARELAG
        "enzyme" MFEM_USE_ENZYME

        # MPI Libraries
        "petsc" MFEM_USE_PETSC
        "superlu" MFEM_USE_SUPERLU
        "strumpack" MFEM_USE_STRUMPACK
        "mumps" MFEM_USE_MUMPS
        "slepc" MFEM_USE_SLEPC
        "pumi" MFEM_USE_PUMI
)

file(GLOB FIND_MODULES "${SOURCE_PATH}/config/cmake/modules/Find*.cmake")
file(REMOVE ${FIND_MODULES})

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
  OPTIONS ${FEATURE_OPTIONS}
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup()

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright
)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

