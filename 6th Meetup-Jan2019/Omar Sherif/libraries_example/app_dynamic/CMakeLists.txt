include_directories(
    ${CMAKE_SOURCE_DIR}/dynamic/include
)

link_directories (
    ${CMAKE_BINARY_DIR_DIR}/dynamic
)

add_executable(
    app_dynamic

    main.cpp
)

target_link_libraries(
    app_dynamic

    idea_dynamic
)

add_dependencies(
    app_dynamic

    idea_dynamic
)