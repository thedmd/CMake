include(Platform/Windows-MSVC)
set(_COMPILE_CXX " /TP")
if(NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS 18.0)
  set(_FS_CXX " /FS")
endif()
__windows_compiler_msvc(CXX)

if(MSVC_VERSION LESS 1600)
  set(CMAKE_CXX_STANDARD_DEFAULT 98)
elseif(MSVC_VERSION EQUAL 1600 OR MSVC_VERSION GREATER 1600)
  #all versions starting with 2010 and above default to c++11
  set(CMAKE_CXX_STANDARD_DEFAULT 11)
endif()

macro(cmake_record_cxx_compile_features)
  record_compiler_features(CXX "" CMAKE_CXX_COMPILE_FEATURES)
endmacro()
