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

############ no-rdc ###############
add_library(libst-no-rdc STATIC
  ${LIB_SOURCES}
)
target_compile_options(libst-no-rdc PUBLIC -fno-gpu-rdc)
add_library(libsh-no-rdc SHARED
  ${LIB_SOURCES}
)
target_compile_options(libsh-no-rdc PUBLIC -fno-gpu-rdc)

add_executable(app-static-no-rdc
  app.cpp
)
add_executable(app-shared-no-rdc
  app.cpp
)

target_link_libraries(app-static-no-rdc libst-no-rdc)
target_link_libraries(app-shared-no-rdc libsh-no-rdc)

add_test(NAME test-static-no-rdc
         COMMAND app-static-no-rdc)
add_test(NAME test-shared-no-rdc
         COMMAND app-shared-no-rdc)

############ per-kernel ###############
add_library(libst-pk STATIC
  ${LIB_SOURCES}
)
target_compile_options(libst-pk PUBLIC -fsycl-device-code-split=per_kernel)
add_library(libsh-pk SHARED
  ${LIB_SOURCES}
)
target_compile_options(libsh-pk PUBLIC -fsycl-device-code-split=per_kernel)

add_executable(app-static-pk
  app.cpp
)
add_executable(app-shared-pk
  app.cpp
)

target_link_libraries(app-static-pk libst-pk)
target_link_libraries(app-shared-pk libsh-pk)

add_test(NAME test-static-pk
         COMMAND app-static-pk)
add_test(NAME test-shared-pk
         COMMAND app-shared-pk)

############ no-rdc + per-kernel ###############
add_library(libst-no-rdc-pk STATIC
${LIB_SOURCES}
)
target_compile_options(libst-no-rdc-pk PUBLIC -fno-gpu-rdc -fsycl-device-code-split=per_kernel)
add_library(libsh-no-rdc-pk SHARED
${LIB_SOURCES}
)
target_compile_options(libsh-no-rdc-pk PUBLIC -fno-gpu-rdc -fsycl-device-code-split=per_kernel)

add_executable(app-static-no-rdc-pk
app.cpp
)
add_executable(app-shared-no-rdc-pk
app.cpp
)

target_link_libraries(app-static-no-rdc-pk libst-no-rdc-pk)
target_link_libraries(app-shared-no-rdc-pk libsh-no-rdc-pk)

add_test(NAME test-static-no-rdc-pk
       COMMAND app-static-no-rdc-pk)
add_test(NAME test-shared-no-rdc-pk
       COMMAND app-shared-no-rdc-pk)
