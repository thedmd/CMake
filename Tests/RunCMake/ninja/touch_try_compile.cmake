execute_process(
  COMMAND "${CMAKE_COMMAND}" -E touch
          "${CMAKE_CURRENT_LIST_DIR}/tc.c")

include("${CMAKE_CURRENT_LIST_DIR}/check_build.cmake")
