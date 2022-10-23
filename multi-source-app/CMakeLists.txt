add_executable(multi-source-app
  a.cpp
  b.cpp
)

add_test(NAME multi-source-test
         COMMAND multi-source-app)