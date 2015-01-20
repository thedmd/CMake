cmake_minimum_required (VERSION 3.1)

project(CPackRPM)

install(FILES CMakeLists.txt DESTINATION /not_relocatable COMPONENT static)
install(FILES CMakeLists.txt DESTINATION relocatable COMPONENT relocatable)

set(CPACK_PACKAGE_RELOCATABLE TRUE)
set(CPACK_GENERATOR "RPM")
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt")

set(CPACK_RPM_COMPONENT_INSTALL ON)

include(CPack)
