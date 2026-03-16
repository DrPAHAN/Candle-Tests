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

TEST(CandleTest, Contains_InsideFullRange) {
  Candle c(100.0, 110.0, 90.0, 105.0);
  EXPECT_TRUE(c.contains(95.0));
  EXPECT_TRUE(c.contains(90.0));
  EXPECT_TRUE(c.contains(110.0));
}

TEST(CandleTest, Contains_Boundary) {
  Candle c(100.0, 110.0, 90.0, 105.0);
  EXPECT_TRUE(c.contains(90.0));
  EXPECT_TRUE(c.contains(110.0));
  EXPECT_FALSE(c.contains(89.9));
}

TEST(CandleTest, Contains_Outside) {
  Candle c(100.0, 110.0, 90.0, 105.0);
  EXPECT_FALSE(c.contains(111.0));
  EXPECT_FALSE(c.contains(89.0));
}

TEST(CandleTest, FullSize_Normal) { Candle c(100,110,90,105); EXPECT_DOUBLE_EQ(c.full_size(), 20.0); }
TEST(CandleTest, FullSize_Zero) { Candle c(100,100,100,100); EXPECT_DOUBLE_EQ(c.full_size(), 0.0); }
TEST(CandleTest, FullSize_Big) { Candle c(100,150,50,100); EXPECT_DOUBLE_EQ(c.full_size(), 100.0); }

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}