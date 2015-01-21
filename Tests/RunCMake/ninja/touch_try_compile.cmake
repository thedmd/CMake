execute_process(
  COMMAND "${CMAKE_COMMAND}" -E touch
          "${test_binary_dir}/tc.c")

include("${CMAKE_CURRENT_LIST_DIR}/check_build.cmake")
