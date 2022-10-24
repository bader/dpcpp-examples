cmake_minimum_required(VERSION 3.18)
project(dpcpp-examples LANGUAGES CXX)

add_compile_options(-fsycl -ftemplate-backtrace-limit=0)
add_link_options(-fsycl)

enable_testing()

add_subdirectory(multi-source-app)
add_subdirectory(library)