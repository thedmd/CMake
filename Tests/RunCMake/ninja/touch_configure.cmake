execute_process(
  COMMAND "${CMAKE_COMMAND}" -E touch
          "${test_binary_dir}/test.txt.in")

include("${CMAKE_CURRENT_LIST_DIR}/check_build.cmake")
