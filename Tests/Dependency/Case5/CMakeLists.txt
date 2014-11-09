project(CASE5 C)

include_directories(${CASE5_SOURCE_DIR})

add_library(case5Foo SHARED foo.c foo.h)

add_library(case5Bar STATIC bar.c bar.h)
target_link_libraries(case5Bar case5Foo)

add_executable(case5 main.c)
target_link_libraries(case5 case5Foo)
target_link_libraries(case5 case5Bar)
