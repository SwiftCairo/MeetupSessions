include_directories(
    ${CMAKE_SOURCE_DIR}/static/include
)

link_directories (
    ${CMAKE_BINARY_DIR_DIR}/static
)

add_executable(
    app_static

    main.cpp
)

target_link_libraries(
    app_static

    idea_static
)

add_dependencies(
    app_static

    idea_static
)