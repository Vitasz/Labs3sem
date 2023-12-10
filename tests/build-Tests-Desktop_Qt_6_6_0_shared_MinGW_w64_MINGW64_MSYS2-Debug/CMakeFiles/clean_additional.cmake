# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\SortsTests_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\SortsTests_autogen.dir\\ParseCache.txt"
  "SortsTests_autogen"
  )
endif()
