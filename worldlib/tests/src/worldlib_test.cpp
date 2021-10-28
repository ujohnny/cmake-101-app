//
// Created by Evgenii.Novozhilov on 18.10.2021.
//

#define CATCH_CONFIG_RUNNER

#include <catch2/catch.hpp>
#include <worldlib.h>

TEST_CASE("world test") {
    REQUIRE(world::get() == "world");
}

int main( int argc, char* argv[] ) {
    int result = Catch::Session().run( argc, argv );
    return result;
}