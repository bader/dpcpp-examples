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

############ per-kernel + debug ###############
add_library(libst-pk-g STATIC
${LIB_SOURCES}
)
target_compile_options(libst-pk-g PUBLIC -fsycl-device-code-split=per_kernel -g)
add_library(libsh-pk-g SHARED
${LIB_SOURCES}
)
target_compile_options(libsh-pk-g PUBLIC -fsycl-device-code-split=per_kernel -g)

add_executable(app-static-pk-g
app.cpp
)
add_executable(app-shared-pk-g
app.cpp
)

target_link_libraries(app-static-pk-g libst-pk-g)
target_link_libraries(app-shared-pk-g libsh-pk-g)

add_test(NAME test-static-pk-g
       COMMAND app-static-pk-g)
add_test(NAME test-shared-pk-g
       COMMAND app-shared-pk-g)

############ no-rdc + per-kernel + debug ###############
add_library(libst-no-rdc-pk-g STATIC
${LIB_SOURCES}
)
target_compile_options(libst-no-rdc-pk-g PUBLIC -fno-gpu-rdc -fsycl-device-code-split=per_kernel -g)
add_library(libsh-no-rdc-pk-g SHARED
${LIB_SOURCES}
)
target_compile_options(libsh-no-rdc-pk-g PUBLIC -fno-gpu-rdc -fsycl-device-code-split=per_kernel -g)

add_executable(app-static-no-rdc-pk-g
app.cpp
)
add_executable(app-shared-no-rdc-pk-g
app.cpp
)

target_link_libraries(app-static-no-rdc-pk-g libst-no-rdc-pk-g)
target_link_libraries(app-shared-no-rdc-pk-g libsh-no-rdc-pk-g)

add_test(NAME test-static-no-rdc-pk-g
     COMMAND app-static-no-rdc-pk-g)
add_test(NAME test-shared-no-rdc-pk-g
     COMMAND app-shared-no-rdc-pk-g)
