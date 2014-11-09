cmake_minimum_required(VERSION 2.8.9)
project(Test)

include_directories(${CMAKE_SOURCE_DIR})

add_library(lib1 SHARED lib1.cpp lib1.h)

add_library(lib2 STATIC lib2.cpp lib2.h)
target_link_libraries(lib2 lib1)

add_executable(exec main.cpp)
target_link_libraries(exec lib1)
target_link_libraries(exec lib2)
