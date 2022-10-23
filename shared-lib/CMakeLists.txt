add_library(sharedlib SHARED
  lib.cpp
)

add_executable(shared-lib-app
  app.cpp
)

target_link_libraries(shared-lib-app sharedlib)

add_test(NAME shared-lib-test
         COMMAND shared-lib-app)