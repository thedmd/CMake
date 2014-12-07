
add_library(somelib SHARED empty.cpp)

install(TARGETS somelib EXPORT exp
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin
)

install(EXPORT exp DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/cmake)
