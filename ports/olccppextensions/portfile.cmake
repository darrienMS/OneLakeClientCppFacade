vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL https://powerbi.visualstudio.com/Trident/_git/OneLakeClient
    REF 12088506dc1a0aeb640c93b0986751ba45c89126
    HEAD_REF users/darrienhunt/feature-cpp-extension-shiproom
)

vcpkg_configure_cmake(
  SOURCE_PATH "${SOURCE_PATH}"
  PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(
  INSTALL "${SOURCE_PATH}/LICENSE"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
