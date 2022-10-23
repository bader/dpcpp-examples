set(LIB_SOURCES
  lib-a.cpp
  lib-b.cpp
)
add_library(libst STATIC
  ${LIB_SOURCES}
)
add_library(libsh SHARED
  ${LIB_SOURCES}
)

add_executable(app-static
  app.cpp
)
add_executable(app-shared
  app.cpp
)

target_link_libraries(app-static libst)
target_link_libraries(app-shared libsh)

add_test(NAME test-static
         COMMAND app-static)
add_test(NAME test-shared
         COMMAND app-shared)
