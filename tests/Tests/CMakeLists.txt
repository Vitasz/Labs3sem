cmake_minimum_required(VERSION 3.5)

project(SortsTests LANGUAGES CXX)

enable_testing()

find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Test)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Test)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(SortsTests tst_sortstests.cpp)
add_test(NAME SortsTests COMMAND SortsTests)

target_link_libraries(SortsTests PRIVATE Qt${QT_VERSION_MAJOR}::Test)

