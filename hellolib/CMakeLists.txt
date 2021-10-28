cmake_minimum_required(VERSION 3.20)
project(hellolib)

option(ENABLE_TESTING "Enable test targets" OFF)

add_library(hellolib SHARED src/hellolib.cpp)
target_compile_features(hellolib PRIVATE cxx_std_17)

include(GNUInstallDirs)
target_include_directories(hellolib
        PRIVATE
            src
        INTERFACE
            $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
            $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

set_target_properties(hellolib PROPERTIES PUBLIC_HEADER include/hellolib.h)

if (ENABLE_TESTING)
    include(CTest)
endif()

if (BUILD_TESTING)
    add_subdirectory(tests)
endif()

install(TARGETS hellolib
        EXPORT hellolibExport
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/hellolib
        )

install(EXPORT hellolibExport
        FILE hellolibConfig.cmake
        NAMESPACE hellolib::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)