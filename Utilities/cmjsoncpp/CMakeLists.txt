project(JsonCpp)

# Disable warnings to avoid changing 3rd party code.
if(CMAKE_CXX_COMPILER_ID MATCHES
    "^(GNU|Clang|AppleClang|XL|VisualAge|SunPro|MIPSpro|HP|Intel)$")
  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -w")
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "PathScale")
  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -woffall")
endif()

set(JSONCPP_SOURCES
  json_tool.h
  json_reader.cpp
  json_batchallocator.h
  json_valueiterator.inl
  json_value.cpp
  json_writer.cpp
)

include_directories(${JsonCpp_SOURCE_DIR})

add_library(cmjsoncpp ${JSONCPP_SOURCES})
