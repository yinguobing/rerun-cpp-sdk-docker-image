cmake_minimum_required(VERSION 3.22)
project(RerunCppSdk)

include(FetchContent)
FetchContent_Declare(
  rerun_sdk
  URL https://github.com/rerun-io/rerun/releases/download/0.21.0/rerun_cpp_sdk.zip
)
FetchContent_MakeAvailable(rerun_sdk)
