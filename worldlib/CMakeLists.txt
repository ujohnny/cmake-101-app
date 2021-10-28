cmake_minimum_required(VERSION 3.20)
project(worldlib)

option(ENABLE_TESTING "Enable test targets" OFF)

add_library(worldlib SHARED src/worldlib.cpp)

include(GNUInstallDirs)
target_include_directories(worldlib
        PUBLIC
            $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>
            $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

set_target_properties(worldlib PROPERTIES PUBLIC_HEADER include/worldlib.h)

if (ENABLE_TESTING)
    include(CTest)
endif()

if (BUILD_TESTING)
    add_subdirectory(tests)
endif()

install(TARGETS worldlib
        EXPORT worldlibExport
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/worldlib
        )

install(EXPORT worldlibExport
        FILE worldlibConfig.cmake
        NAMESPACE worldlib::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)