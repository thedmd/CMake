# No version of MSVC has full conformance to C++11. Therefore the
# __cplusplus macro always evaluates to 98 even if the compilers come with
# C++11/14/+ features enabled.  Later we should refactor the C++ side of
# this within CMake to allow us to specify that there are no language level
# flags for this compiler.
set(CMAKE_CXX_STANDARD_DEFAULT 98)

macro(cmake_record_cxx_compile_features)
  record_compiler_features(CXX "" CMAKE_CXX_COMPILE_FEATURES)
endmacro()
