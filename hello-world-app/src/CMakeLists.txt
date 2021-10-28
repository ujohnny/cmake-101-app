add_executable(hello-world-app main.cpp)

find_package(hellolib CONFIG REQUIRED)
find_package(worldlib CONFIG REQUIRED)

target_link_libraries(hello-world-app PRIVATE hellolib::hellolib worldlib::worldlib)
target_compile_features(hello-world-app PRIVATE cxx_std_11)