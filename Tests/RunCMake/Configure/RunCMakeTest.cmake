include(RunCMake)

run_cmake(CustomTargetAfterError)
run_cmake(ErrorLogs)
run_cmake(FailCopyFileABI)

# Use a single build tree for a few tests without cleaning.
set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/RerunCMake-build)
set(RunCMake_TEST_NO_CLEAN 1)
file(REMOVE_RECURSE "${RunCMake_TEST_BINARY_DIR}")
file(MAKE_DIRECTORY "${RunCMake_TEST_BINARY_DIR}")
set(input  "${RunCMake_TEST_BINARY_DIR}/CustomCMakeInput.txt")
set(stamp  "${RunCMake_TEST_BINARY_DIR}/CustomCMakeStamp.txt")
set(depend "${RunCMake_TEST_BINARY_DIR}/CustomCMakeDepend.txt")
set(output "${RunCMake_TEST_BINARY_DIR}/CustomCMakeOutput.txt")
file(WRITE "${input}" "1")
file(WRITE "${depend}" "1")
run_cmake(RerunCMake)
execute_process(COMMAND ${CMAKE_COMMAND} -E sleep 1) # handle 1s resolution
file(WRITE "${input}" "2")
run_cmake_command(RerunCMake-build1 ${CMAKE_COMMAND} --build .)
file(WRITE "${depend}" "2")
run_cmake_command(RerunCMake-build2 ${CMAKE_COMMAND} --build .)
unset(RunCMake_TEST_BINARY_DIR)
unset(RunCMake_TEST_NO_CLEAN)

if(RunCMake_GENERATOR STREQUAL "Ninja")
  # Use a single build tree for a few tests without cleaning.
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/NinjaRerunCMake-build)
  set(RunCMake_TEST_NO_CLEAN 1)
  file(REMOVE_RECURSE "${RunCMake_TEST_BINARY_DIR}")
  file(MAKE_DIRECTORY "${RunCMake_TEST_BINARY_DIR}")
  set(in_conf  "${RunCMake_TEST_BINARY_DIR}/ConfigureFileInput.txt.in")
  file(WRITE "${in_conf}" "1")
  set(in_tc  "${RunCMake_TEST_BINARY_DIR}/TryCompileInput.c")
  file(WRITE "${in_tc}" "int main(void) { return 0; }\n")

  # Force NINJA_STATUS to be a certain style to not break the regex.
  set(ENV{NINJA_STATUS} "[%s/%t] ")

  message(STATUS "NinjaRerunCMake - First configuration:")
  run_cmake(NinjaRerunCMake)
  run_cmake_command(NinjaRerunCMake-nowork ${CMAKE_COMMAND} --build .)
  execute_process(COMMAND ${CMAKE_COMMAND} -E sleep 1) # handle 1s resolution
  message(STATUS "NinjaRerunCMake - Modify try_compile input:")
  file(WRITE "${in_tc}" "does-not-compile\n")
  run_cmake_command(NinjaRerunCMake-rerun ${CMAKE_COMMAND} --build .)
  run_cmake_command(NinjaRerunCMake-nowork ${CMAKE_COMMAND} --build .)

  message(STATUS "NinjaRerunCMake - Remove configure_file output:")
  file(REMOVE "${RunCMake_TEST_BINARY_DIR}/ConfigureFileOutput.txt")
  run_cmake_command(NinjaRerunCMake-rerun ${CMAKE_COMMAND} --build .)
  run_cmake_command(NinjaRerunCMake-nowork ${CMAKE_COMMAND} --build .)

  execute_process(COMMAND ${CMAKE_COMMAND} -E sleep 1) # handle 1s resolution
  message(STATUS "NinjaRerunCMake - Modify configure_file input:")
  file(WRITE "${in_conf}" "2")
  run_cmake_command(NinjaRerunCMake-rerun ${CMAKE_COMMAND} --build .)
  run_cmake_command(NinjaRerunCMake-nowork ${CMAKE_COMMAND} --build .)

  unset(RunCMake_TEST_BINARY_DIR)
  unset(RunCMake_TEST_NO_CLEAN)
endif()
