cmake_minimum_required(VERSION 3.1)

find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_subdirectory(app_dynamic)
add_subdirectory(app_static)
add_subdirectory(app_runtime_link)
add_subdirectory(dynamic)
add_subdirectory(static)