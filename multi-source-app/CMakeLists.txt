cmake_minimum_required(VERSION 3.18)
project(CXX)

add_compile_options(-fsycl)
add_link_options(-fsycl)

add_executable(multi-source-app
  a.cpp
  b.cpp
)

add_test(NAME multi-source-test
         COMMAND multi-source-app)