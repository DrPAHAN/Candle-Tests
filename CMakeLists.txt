cmake_minimum_required(VERSION 3.24.2)
project(testproj CXX)

include(FetchContent)
FetchContent_Declare(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG        v1.15.2
)
FetchContent_MakeAvailable(googletest)

add_executable(${PROJECT_NAME} main.cpp candle.cpp)

target_link_libraries(${PROJECT_NAME} GTest::gtest_main)

enable_testing()
include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME})