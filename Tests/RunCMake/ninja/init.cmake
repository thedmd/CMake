cmake_minimum_required(VERSION 3.0)
project(ninja C)

set(in_conf "${CMAKE_CURRENT_BINARY_DIR}/test.txt.in")

if (NOT EXISTS "${in_conf}")
  file(WRITE "${in_conf}" "")
endif ()

configure_file(
  "${in_conf}"
  "${CMAKE_CURRENT_BINARY_DIR}/test.txt")

set(in_try_compile "${CMAKE_CURRENT_BINARY_DIR}/tc.c")

if (NOT EXISTS "${in_try_compile}")
  file(WRITE "${in_try_compile}" "int main(int, char**) { return 0; }")
endif ()

try_compile(res
  "${CMAKE_CURRENT_BINARY_DIR}/bin"
  SOURCES "${in_try_compile}")
message("${res}")
