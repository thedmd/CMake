cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

file(MAKE_DIRECTORY "${dir}")

# run cmake
execute_process(
  COMMAND "${CMAKE_CMAKE_COMMAND}" "${CMake_SOURCE_DIR}/Tests/CPackRPM"
  WORKING_DIRECTORY "${dir}"
  OUTPUT_QUIET)

# package RPM
execute_process(
  COMMAND make package
  WORKING_DIRECTORY "${dir}"
  ERROR_VARIABLE stderr
  OUTPUT_QUIET)

# test for partial relocation warning
if(NOT "${stderr}" MATCHES "CPackRPM:Warning: Path /not_relocatable/CMakeLists.txt is not on one of the.*relocatable paths! Package will be partially relocatable.")
  message(FATAL_ERROR "CPack/RPM missing partially relocatable warning; stderr output: '${stderr}'")
endif()
