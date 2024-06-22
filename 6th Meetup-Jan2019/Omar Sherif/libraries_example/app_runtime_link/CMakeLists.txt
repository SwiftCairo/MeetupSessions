add_executable(
    app_runtime_link

    main.cpp
)

target_link_libraries(
    app_runtime_link

    -ldl
    -lpthread
)