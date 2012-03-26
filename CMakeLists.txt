cmake_minimum_required(VERSION 2.6)
find_package(Qt4 REQUIRED)

# Needed for plugin support
add_definitions(-DQT_STATICPLUGIN)
if(UNIX)
  if(NOT APPLE)
    add_definitions(-fPIC)
  endif(NOT APPLE)
endif(UNIX)

add_subdirectory(diagnostics)
add_subdirectory(shares)
