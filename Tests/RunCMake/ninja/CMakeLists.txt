cmake_minimum_required(VERSION 2.8.4)

set(test_binary_dir "${test_binary_root}/init-build")

project(${RunCMake_TEST} NONE)
include(${RunCMake_TEST}.cmake)
