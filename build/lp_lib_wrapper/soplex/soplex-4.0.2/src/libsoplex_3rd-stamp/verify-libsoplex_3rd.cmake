# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

if("/home/alen/ibex-lib/lp_lib_wrapper/soplex/3rd/soplex-4.0.2.tar" STREQUAL "")
  message(FATAL_ERROR "LOCAL can't be empty")
endif()

if(NOT EXISTS "/home/alen/ibex-lib/lp_lib_wrapper/soplex/3rd/soplex-4.0.2.tar")
  message(FATAL_ERROR "File not found: /home/alen/ibex-lib/lp_lib_wrapper/soplex/3rd/soplex-4.0.2.tar")
endif()

if("" STREQUAL "")
  message(WARNING "File will not be verified since no URL_HASH specified")
  return()
endif()

if("" STREQUAL "")
  message(FATAL_ERROR "EXPECT_VALUE can't be empty")
endif()

message(STATUS "verifying file...
     file='/home/alen/ibex-lib/lp_lib_wrapper/soplex/3rd/soplex-4.0.2.tar'")

file("" "/home/alen/ibex-lib/lp_lib_wrapper/soplex/3rd/soplex-4.0.2.tar" actual_value)

if(NOT "${actual_value}" STREQUAL "")
  message(FATAL_ERROR "error:  hash of
  /home/alen/ibex-lib/lp_lib_wrapper/soplex/3rd/soplex-4.0.2.tar
does not match expected value
  expected: ''
    actual: '${actual_value}'
")
endif()

message(STATUS "verifying file... done")
