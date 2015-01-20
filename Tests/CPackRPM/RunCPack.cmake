file(MAKE_DIRECTORY "${dir}")

execute_process(
  COMMAND ${CMAKE_CMAKE_COMMAND}
    "${CMake_SOURCE_DIR}/Tests/CPackRPM"
  COMMAND make package
  RESULT_VARIABLE result
  OUTPUT_VARIABLE stdout
  ERROR_VARIABLE stderr
  WORKING_DIRECTORY ${dir})

# test for partial relocation warning
if(NOT "${stderr}" MATCHES "CPackRPM:Warning: Path /not_relocatable/CMakeLists.txt is not on one of the.*relocatable paths! Package will be partially relocatable.")
  message(FATAL_ERROR "CPack/RPM missing partially relocatable warning; stderr output: '${stderr}'")
endif()
