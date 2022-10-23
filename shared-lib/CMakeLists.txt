add_library(sharedlib SHARED
  lib-a.cpp
  lib-b.cpp
)

add_executable(shared-lib-app
  app.cpp
)

target_link_libraries(shared-lib-app sharedlib)

add_test(NAME shared-lib-test
         COMMAND shared-lib-app)