project(JsonCpp)

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
