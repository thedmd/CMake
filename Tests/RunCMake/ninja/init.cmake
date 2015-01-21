cmake_minimum_required(VERSION 3.0)
project(ninja C)

configure_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/test.txt.in"
  "${CMAKE_CURRENT_BINARY_DIR}/test.txt")

try_compile(res
  "${CMAKE_CURRENT_BINARY_DIR}/bin"
  SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/tc.c")
message("${res}")
