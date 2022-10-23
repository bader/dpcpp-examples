add_library(testlib STATIC
  lib.cpp
)

add_executable(static-lib-app
  app.cpp
)

target_link_libraries(static-lib-app testlib)

add_test(NAME static-lib-test
         COMMAND static-lib-app)