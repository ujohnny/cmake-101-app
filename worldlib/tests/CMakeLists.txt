find_package(Catch2 2 REQUIRED)

add_executable(worldlib_test src/worldlib_test.cpp)
target_link_libraries(worldlib_test PRIVATE Catch2::Catch2 worldlib)
