include(RunCMake)

# Test that Ninja is rerun properly.
set(test_dir "${CMAKE_CURRENT_BINARY_DIR}/ninja/test")

set(RunCMake_BINARY_DIR "${test_dir}")
run_cmake(init)

function (busy_loop)
  execute_process(
    COMMAND "${CMAKE_COMMAND}" -E sleep
            2)
endfunction ()

set(RunCMake_TEST_OPTIONS "-Dtest_binary_root=${test_dir}")
busy_loop()
run_cmake(touch_try_compile)
busy_loop()
run_cmake(remove_configured_file)
busy_loop()
run_cmake(touch_configure)
