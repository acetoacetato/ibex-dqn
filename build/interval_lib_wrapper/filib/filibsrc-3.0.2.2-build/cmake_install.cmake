# Install script for directory: /home/alen/ibex-lib/build/interval_lib_wrapper/filib/filibsrc-3.0.2.2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevtoolsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ibex/3rd" TYPE DIRECTORY FILES
    "/home/alen/ibex-lib/build/interval_lib_wrapper/filib/filibsrc-3.0.2.2/ieee"
    "/home/alen/ibex-lib/build/interval_lib_wrapper/filib/filibsrc-3.0.2.2/fp_traits"
    "/home/alen/ibex-lib/build/interval_lib_wrapper/filib/filibsrc-3.0.2.2/interval"
    "/home/alen/ibex-lib/build/interval_lib_wrapper/filib/filibsrc-3.0.2.2/rounding_control"
    FILES_MATCHING REGEX "/[^/]*\\.hpp$" REGEX "/[^/]*\\.icc$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevtoolsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ibex/3rd/rounding_control" TYPE FILE FILES "/home/alen/ibex-lib/build/interval_lib_wrapper/filib/filibsrc-3.0.2.2-build/rounding_control/rounding_control_config.hpp")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevtoolsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/ibex/3rd" TYPE STATIC_LIBRARY FILES "/home/alen/ibex-lib/build/interval_lib_wrapper/filib/filibsrc-3.0.2.2-build/libprim.a")
endif()

