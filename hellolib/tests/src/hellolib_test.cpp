#include <gtest/gtest.h>
#include <hellolib.h>

TEST(Suite, test_hello) {
    ASSERT_EQ("hello", hello::get());
}