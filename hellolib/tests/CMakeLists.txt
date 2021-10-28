list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

include(gtest)

# Now simply link against gtest or gtest_main as needed. Eg
add_executable(hellolib_test src/hellolib_test.cpp)
target_link_libraries(hellolib_test PRIVATE gtest_main hellolib)

gtest_discover_tests(hellolib_test)
