enable_language(C)
configure_file(
  "${CMAKE_CURRENT_BINARY_DIR}/ConfigureFileInput.txt.in"
  "${CMAKE_CURRENT_BINARY_DIR}/ConfigureFileOutput.txt"
  @ONLY
  )
try_compile(res
  "${CMAKE_CURRENT_BINARY_DIR}"
  SOURCES "${CMAKE_CURRENT_BINARY_DIR}/TryCompileInput.c"
  )
message("${res}")
