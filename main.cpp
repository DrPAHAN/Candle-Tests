#include "candle.h"
#include <gtest/gtest.h>

// 2.1. 3 теста для body_contains
TEST(CandleTest, BodyContains_GreenCandle) {
  Candle c(100.0, 110.0, 90.0, 105.0);
  EXPECT_TRUE(c.body_contains(100.0));
  EXPECT_TRUE(c.body_contains(105.0));
  EXPECT_FALSE(c.body_contains(99.9));
}

TEST(CandleTest, BodyContains_RedCandle) {
  Candle c(105.0, 110.0, 90.0, 100.0);
  EXPECT_TRUE(c.body_contains(100.0));
  EXPECT_TRUE(c.body_contains(105.0));
  EXPECT_FALSE(c.body_contains(105.1));
}

TEST(CandleTest, BodyContains_DojiBoundary) {
  Candle c(100.0, 110.0, 90.0, 100.0);
  EXPECT_TRUE(c.body_contains(100.0));
  EXPECT_FALSE(c.body_contains(99.9));
  EXPECT_FALSE(c.body_contains(100.1));
}

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}