include(FetchContent)

include(GoogleTest)

set(INSTALL_GTEST OFF CACHE BOOL OFF) # we have to pass it thru cache as the only option for FetchContent

FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/refs/tags/release-1.11.0.zip
)

FetchContent_MakeAvailable(googletest)
