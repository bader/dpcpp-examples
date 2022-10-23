cmake_minimum_required(VERSION 3.18)
project(CXX)

add_compile_options(-fsycl)
add_link_options(-fsycl)

enable_testing()

add_subdirectory(multi-source-app)
add_subdirectory(static-lib)