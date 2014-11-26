cmake_minimum_required (VERSION 3.0)
project (RegexClear C)

function (check_for_success)
  if (CMAKE_MATCH_1 STREQUAL "0" AND
      CMAKE_MATCH_2 STREQUAL "1")
    message("Matched string properly")
  else ()
    message(FATAL_ERROR "Failed to match properly")
  endif ()
endfunction ()

function (check_for_failure)
  if (CMAKE_MATCH_1 STREQUAL "" AND
      CMAKE_MATCH_2 STREQUAL "")
    message("Matched nothing properly")
  else ()
    message(FATAL_ERROR "Found a match where there should be none")
  endif ()
endfunction ()

macro (do_regex_success)
  string(REGEX MATCH "(0)(1)" output "01")
  check_for_success()
endmacro ()

macro (do_regex_failure)
  string(REGEX MATCH "(0)(1)" output "12")
  check_for_failure()
endmacro ()

do_regex_success()

list(INSERT CMAKE_MODULE_PATH 0
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
find_package(dummy) # Ensure cmMakefile::PushScope/PopScope work.

check_for_failure()
do_regex_failure()
do_regex_success()

add_subdirectory(subdir)

check_for_success() # Ensure that the subdir didn't mess with this scope.

add_executable(RegexClear RegexClear.c)
